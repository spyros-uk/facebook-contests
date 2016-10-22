<?php



/**
 * Class Mevent_Core
 *
 */
class Mevent_Core {

	/**
	 * @var array
	 */
	var $post_types = array();

	/**
	 * @var Mevent_EventTable
	 */
	var $eventmeta;

	/**
	 * @var Mlib_Rewrites
	 */
	var $rewrites;

	/**
	 * @var array
	 */
	var $state = array();


	/**
	 * Set a state
	 *
	 * @param $state array
	 */
	function set_state( $state ) {
		$this->state = array_merge( $this->state, $state );
	}


	/**
	 * Get a state property
	 *
	 * @param $property
	 *
	 * @return mixed
	 */
	function get_state( $property ) {
		if ( ! isset( $this->state[ $property ] ) ) {
			return false;
		}

		return $this->state[ $property ];
	}


	/**
	 * Register all the action and
	 * filter hooks for the events plugin
	 *
	 * @param $plugin_file
	 */
	function __construct( $plugin_file ) {

		register_activation_hook( $plugin_file, array( &$this, 'plugin_activate' ) );

		register_deactivation_hook( $plugin_file, 'flush_rewrite_rules' );


		/** -- hooks -- */

		// initialization actions

		add_action( 'plugins_loaded', array( &$this, 'init' ), 0 );

		add_action( 'plugins_loaded', array( &$this, 'register_post_types' ), 11 );


		// query related actions

		add_filter( 'query_vars',    array( &$this, 'add_query_vars' ) );

		add_action( 'init',          array( &$this, 'register_rewrite_rules' ), 4 );

		add_action( 'pre_get_posts', array( &$this, 'handle_events_query' ), 12 );


		// post meta related actions

		add_action( 'save_post',    array( &$this, 'save_event_metadata' ) );

		add_action( 'delete_post', array( &$this->eventmeta, 'delete_event_meta' ) );


		// plugin actions

		add_action( 'mevent_init', array( &$this, 'init_core_plugins' ) );
	}


	/**
	 * Do all actions necessary
	 * to fully activate the events
	 * plugin
	 *
	 */
	function plugin_activate() {
		self::init();
		self::activate_post_types();
		self::install_events_table();
		flush_rewrite_rules();
	}



	/**
	 * Initialize the plugin
	 * and fire off init hooks
	 *
	 */
	function init() {

		/**
		 * Hook into this action to
		 * initialize Mevent Plugins
		 *
		 * @since 1.0
		 */
		do_action( 'mevent_init', $this );


		/**
		 * Initialize the plugin's
		 * external components
		 *
		 */
		$this->eventmeta = new Mevent_EventTable();
		$this->rewrites  = new Mlib_Rewrites();
	}


	/**
	 * Initialize the core Mevent
	 * plugins
	 *
	 */
	function init_core_plugins() {
		// is wpml enabled?
		if ( function_exists( 'wpml_object_id' ) ) {
			// initialize the wpml plugin for events
			new Mevent_Plugin_WPML();
		}
	}


	/**
	 * Register and Activate the
	 * custom post types required
	 * by the events plugin
	 *
	 */
	function activate_post_types() {
		self::register_post_types();

		foreach ( $this->post_types as $post_type ) {
			/** @var Mlib_CPT $post_type */
			$post_type->register_post_type();
		}
	}



	/**
	 * Register the custom post
	 * types required by the
	 * events plugin
	 *
	 */
	function register_post_types() {
		$custom_post_types = array(
			'event' => array(
				'menu_icon'     => 'dashicons-calendar',
				'name_singular' => __( 'Event', 'mevent' ),
				'name_plural'   => __( 'Events', 'mevent' ),
				'has_archive'   => 'events',
			)
		);

		foreach ( $custom_post_types as $post_type => $args ) {
			$this->post_types[ $post_type ] = new Mlib_CPT( $post_type, $args );
		}
	}



	/**
	 * Register custom rewrite rules
	 *
	 */
	function register_rewrite_rules() {
		if ( $post_type_rule = Mlib_Rewrites::get_post_type_rule( 'event' ) ) {
			$rule  = "{$post_type_rule['rule']}/archive";
			$query = "{$post_type_rule['query']}&event_archive=true";

			$this->rewrites->register_rule( $rule, $query );
			$this->rewrites->register_pages_rules( $rule, $query );
			$this->rewrites->register_date_rules( $rule, $query, array(
				'feed'  => false,
				'paged' => true
			) );
		};
 	}


	/**
	 * Add custom query vars to make
	 * sure WordPress doesn't ignore
	 * them
	 *
	 * @param array $query_vars
	 *
	 * @return array
	 */
	function add_query_vars( $query_vars ) {
		$query_vars[] = 'event_archive';
		return $query_vars;
	}



	/**
	 * Make sure to install
	 * the events table if
	 * it doesn't exist
	 *
	 */
	function install_events_table() {
		if ( ! $this->eventmeta->table_exists() ) {
			$this->eventmeta->create();
		}
	}



	/**
	 * Save the post metadata
	 *
	 * @param $post_id
	 */
	function save_event_metadata( $post_id ) {
		if ( ! current_user_can( 'edit_post', $post_id )
			|| ! array_key_exists( get_post_type( $post_id ), $this->post_types )
		) {
			return;
		}

		if ( ! isset( $_POST['acf'] ) ) {
			return;
		}

		$event_start_field = acf_get_field( 'event_start', false );
		$event_end_field   = acf_get_field( 'event_end', false );

		if ( ! isset( $_POST['acf'][$event_start_field['key']] ) || empty( $_POST['acf'][$event_start_field['key']] ) ) {
			return;
		}

		$event_start = DateTime::createFromFormat( self::get_date_format( $event_start_field ), $_POST['acf'][ $event_start_field['key']] );

		$event_end = ( isset( $_POST['acf'][$event_end_field['key']] ) && ! empty( $_POST['acf'][$event_end_field['key']] ) )
			? DateTime::createFromFormat( self::get_date_format( $event_end_field ), $_POST['acf'][$event_end_field['key']] )
			: $event_start;

		$eventmeta = apply_filters( 'mevent_eventmeta_save', array(
			'start_date' => $event_start->format( 'Y-m-d H:i:s' ),
			'end_date'   => $event_end->format( 'Y-m-d H:i:s' ),
		), $post_id );

		// update the eventmeta
		// with our new data
		$this->eventmeta->update( $post_id, $eventmeta );
	}


	/**
	 * Parse and return the format
	 * set for a given date time format
	 * field
	 *
	 * @param $field
	 *
	 * @return string
	 */
	function get_date_format( $field ) {
		$format = array();

		if ( isset( $field['date_format'] ) ) {
			$format[] = str_replace( array(
				'dd', 'mm', 'yy'
			), array(
				'd', 'm', 'Y'
			), $field['date_format'] );
		}

		if ( isset( $field['time_format'] ) ) {
			$format[] = str_replace( array(
				'HH', 'mm', 'ss', 'tt'
			), array(
				'H', 'i', 's', ''
			), $field['time_format'] );
		}

		return implode( ' ', $format );
	}


	/**
	 * Handle a query for the events
	 * post type
	 *
	 * @param $query WP_Query
	 */
	function handle_events_query( $query ) {
		if (
			is_admin()
			|| ! $query->is_main_query()
			|| ! $query->is_archive()
			|| ! array_key_exists( $query->get( 'post_type' ), $this->post_types )
		) {
			return;
		}

		$is_event_archive = 'true' === $query->get( 'event_archive' );
		$this->set_state( array( 'is_event_archive' => $is_event_archive ) );

		if ( $query->is_date() ) {
			$date_query_type = $is_event_archive ? 'exact' /*'happening_before'*/ : 'happening_after';

			$events = $this->get_events_from_date_query( $query, $date_query_type );

		} else {
			$now = new DateTime();
			$this->set_state( array(
				'year'  => (int) $now->format( 'Y' ),
				'month' => (int) $now->format( 'm' ),
				'day'   => (int) $now->format( 'd' )
			) );

			if ( $is_event_archive ) {
				$events = $this->eventmeta->get_events_happening_before( $now->format( 'Y-m-t 23:59:59' ) );
			} else {
				$events = $this->eventmeta->get_events_happening_after( $now->format( 'Y-m-d 00:00:00' ) );
			}
		}

		if ( empty( $events ) ) {
			// required. forces WordPress
			// to return no results
			$events = array( 0 );
		}

		$query->set( 'post__in', $events );
		$query->set( 'orderby', 'post__in' );
	}



	/**
	 * Handler for a date query
	 *
	 * @param &$query     WP_Query
	 * @param $query_type string
	 *
	 * @returns array
	 */
	function get_events_from_date_query( &$query, $query_type = 'exact' ) {
		$events = array();

		$year  = $query->get( 'year' );
		$month = $query->get( 'monthnum' );
		$day   = $query->get( 'day' );

		switch ( $query_type ) {

			case 'exact':
				if ( $day ) {
					$events = $this->eventmeta->get_events_for_day( $year, $month, $day );
				} else if ( $month ) {
					$events = $this->eventmeta->get_events_for_month( $year, $month );
				} else if ( $year ) {
					$events = $this->eventmeta->get_events_for_year( $year );
				}

				break;

			case 'happening_after':
				$month = $month ? $month : 1;
				$day   = $day ? $day : 1;

				$events = $this->eventmeta->get_events_happening_after( "$year-$month-$day 00:00:00" );
				break;

			case 'happening_before':
				$month = $month ? $month : 12;

				$date_for_day = new DateTime( "$year-$month-01" );
				$day = $day ? $day : (int) $date_for_day->format( 't' );

				$events = $this->eventmeta->get_events_happening_before( "$year-$month-$day 23:59:59" );
				break;
		}

		$this->set_state( array(
			'is_date' => true,
			'year'    => $year,
			'month'   => $month,
			'day'     => $day
		) );

		// clear the date
		// parts of the query
		self::clear_date_query( $query );

		return $events;
	}



	/**
	 * Clear the date query data
	 * from the query
	 *
	 * @param $query WP_Query
	 */
	function clear_date_query( &$query ) {
		$query->set( 'year', 0 );
		$query->set( 'monthnum', 0 );
		$query->set( 'day', 0 );
	}


	/**
	 * Get the event archive page
	 * urls
	 *
	 * @param mixed $type
	 * @param mixed $year
	 * @param mixed $month
	 * @param mixed $day
	 * @param mixed $url
	 *
	 * @return string
	 */
	function get_archive_url( $type = false, $year = false, $month = false, $day = false, $url = false ) {
		if ( ! $url ) {
			$url = get_post_type_archive_link( 'event' );
		}

		if ( $type ) {
			$url .= "$type/";
		}

		if ( $day ) {
			$url .= "$year/$month/$day/";
		} else if ( $month ) {
			$url .= "$year/$month/";
		} else if ( $year ) {
			$url .= "$year/";
		}

		return $url;
	}
}