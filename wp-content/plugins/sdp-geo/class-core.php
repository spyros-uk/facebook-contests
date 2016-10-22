<?php
/**
 *
 */


class Mloc_Core {


	/**
	 * @var Mloc_GeoTable
	 */
	var $db;


	/**
	 * Return the posts for
	 * the given locations
	 *
	 * @param array            $locations
	 * @param array            $args
	 * @param string|int|array $post__not_in
	 *
	 * @return array
	 */
	function get_posts_for_locations( $locations, $args = array(), $post__not_in = array() ) {
		if ( empty( $locations ) ) {
			return array();
		}

		$post__in = array_diff( wp_list_pluck( $locations, 'post_id' ), (array) $post__not_in );
		if ( ! $post__in || empty( $post__in ) ) {
			return array();
		}

		$query = array_merge( array(
			'posts_per_page'   => -1,
			'post_type'        => array_keys( get_post_types( array( 'public' => true ) ) ),
			'suppress_filters' => false,
			'post__in'         => $post__in,
			'orderby'          => 'post__in'
		), $args );

		return get_posts( $query );
	}


	/**
	 * Returns the location
	 * data of the current
	 * post
	 *
	 * @param mixed $context
	 *
	 * @return bool|mixed|null|void
	 */
	static function get_acf_location( $context = false ) {
		if ( $location = get_field( 'location', $context ) ) {
			return $location;
		}

		$event_location = get_field( 'event_location', $context );

		return get_field( 'location', $event_location );
	}


	/**
	 * Hook the plugin into WordPress
	 *
	 * @param $plugin_file
	 */
	function __construct( $plugin_file ) {

		register_activation_hook( $plugin_file, array( &$this, 'plugin_activate' ) );

		add_action( 'plugins_loaded', array( &$this, 'init' ), 0 );


		// post meta related actions

		add_action( 'save_post', array( &$this, 'save_location_metadata' ) );

		add_action( 'deleted_post', array( &$this->db, 'delete_location' ) );
	}


	/**
	 * Activate Plugin
	 * Functionality
	 *
	 */
	function plugin_activate() {
		self::init();
		self::install_geo_table();
		self::install_existing_locations();
	}


	/**
	 * Initialize the plugin
	 * and fire off init hooks
	 *
	 */
	function init() {
		/**
		 * Hook into this action to
		 * initialize Mloc Plugins
		 *
		 * @since 1.0
		 */
		do_action( 'mloc_init', $this );


		/**
		 * Initialize the plugin's
		 * external components
		 *
		 */
		$this->db = new Mloc_GeoTable();
	}


	/**
	 * Install the Geo
	 * Table
	 *
	 */
	function install_geo_table() {
		if ( ! $this->db->table_exists() ) {
			$this->db->create();
		}
	}


	/**
	 * Iterate through existing posts
	 * and save any location data
	 * found
	 *
	 */
	function install_existing_locations() {
		$posts = get_posts( array(
			'posts_per_page'   => -1,
			'post_type'        => array_keys( get_post_types() ),
			'post_status'      => array_keys( get_post_stati() ),
			'suppress_filters' => false
		) );

		if ( empty( $posts ) ) {
			return;
		}

		foreach ( $posts as $post ) {
			if ( $location = self::get_acf_location( $post->ID ) ) {
				$this->db->add_location( $post->ID, $location );
			}
		}
	}


	/**
	 * Save post location metadata
	 *
	 * @param int $post_id
	 */
	function save_location_metadata( $post_id ) {
		if ( ! current_user_can( 'edit_post', $post_id ) ) {
			return;
		}

		if ( ! isset( $_POST['acf'] ) ) {
			return;
		}

		$location_field = acf_get_field( 'location', false );
		$event_location_field = acf_get_field( 'event_location', false );

		$location = false;

		if (
			isset( $_POST['acf'][$location_field['key']] )
			&& ! empty( $_POST['acf'][$location_field['key']] )
		) {
			$location = array(
				'lat' => (float) $_POST['acf'][$location_field['key']]['lat'],
				'lng' => (float) $_POST['acf'][$location_field['key']]['lng']
			);
		} else if (
			isset( $_POST['acf'][$event_location_field['key']] )
			&& ! empty( $_POST['acf'][$event_location_field['key']] )
			&& is_int( $_POST['acf'][$event_location_field['key']] )
		) {
			$location = get_field( 'location', (int) $_POST['acf'][$event_location_field['key']] );
		}

		if ( ! $location || empty( $location ) ) {
			$this->db->delete_location( $post_id );
		}

		$this->db->add_location( $post_id, $location );
	}
}