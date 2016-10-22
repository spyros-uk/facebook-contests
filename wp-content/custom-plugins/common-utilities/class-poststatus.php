<?php



/**
 * Class Mlib_PostStatus
 *
 * PostStatus helper
 * class
 *
 * WARNING: Be careful when implementing
 *          a custom post status as it is
 *          not 100% supported by WordPress
 *          yet!
 */
class Mlib_PostStatus {

	/**
	 * @var string
	 */
	var $post_status;

	/**
	 * @var string
	 */
	var $name_singular;

	/**
	 * @var string
	 */
	var $name_plural;

	/**
	 * @var array|bool
	 */
	var $post_types;

	/**
	 * @var array
	 */
	var $args;


	/**
	 * Set the basic properties
	 * of the Custom Post Status
	 * and register the necessary
	 * actions for the CPS to work
	 *
	 * @param $post_status
	 * @param $args
	 */
	function __construct( $post_status, $args ) {
		// set class properties
		$this->post_status = $post_status;

		$this->name_singular = isset( $args['name_singular'] ) && ! empty( $args['name_singular'] )
			? $args['name_singular']
			: $this->post_status;

		$this->name_plural = isset( $args['name_plural'] ) && ! empty( $args['name_plural'] )
			? $args['name_plural']
			: $this->post_status;

		$this->post_types = isset( $args['post_types'] ) && ! empty( $args['post_types'] )
			? (array) $args['post_types']
			: false;

		$this->args = $args;


		// register post status actions
		add_action( 'init', array( &$this, 'register_post_status' ) );

		if ( isset( $args['show_in_post_editor'] ) && $args['show_in_post_editor'] ) {
			add_action( 'display_post_status_label',   array( &$this, 'add_post_status_label' ) );
			add_action( 'display_post_status_choices', array( &$this, 'add_post_status_choices' ) );

			add_filter( 'no_draft_button_post_statuses', array( &$this, 'add_post_status' ), 10, 2 );
			add_filter( 'status_editor_post_statuses',   array( &$this, 'add_post_status' ), 10, 2 );
			add_filter( 'publish_choice_post_statuses',  array( &$this, 'add_post_status' ), 10, 2 );
			add_filter( 'published_post_statuses',       array( &$this, 'add_post_status' ), 10, 2 );
		}

		if ( isset( $args['include_in_archives'] ) && $args['include_in_archives'] ) {
			add_action( 'pre_get_posts', array( &$this, 'include_posts_with_status_in_archives' ), 0 );
		}
	}



	/**
	 * Print the custom post status
	 * label
	 *
	 * @param WP_Post $post
	 */
	function add_post_status_label( $post ) {
		if ( self::is_allowed( $post ) ) {
			echo esc_html( $this->name_singular );
		}
	}



	/**
	 * Print the custom post status
	 * option for the post status
	 * picker
	 *
	 * @param WP_Post $post
	 */
	function add_post_status_choices( $post ) {
		if ( self::is_allowed( $post ) ) : ?>

			<option<?php selected( $post->post_status, $this->post_status ); ?>
				value="<?php echo esc_attr( $this->post_status ); ?>">
				<?php echo esc_html( $this->name_singular ); ?>
			</option>

			<?php
		endif;
	}



	/**
	 * Add custom post status to
	 * given post statuses if post type
	 * matches
	 *
	 * @param array   $post_statuses
	 * @param WP_Post $post
	 *
	 * @return array
	 */
	function add_post_status( $post_statuses, $post ) {
		if ( self::is_allowed( $post ) ) {
			array_push( $post_statuses, $this->post_status );
		}

		return $post_statuses;
	}



	/**
	 * Check if post status allowed
	 * for given post
	 *
	 * @param WP_Post $post
	 *
	 * @return bool
	 */
	function is_allowed( $post ) {
		return ! $this->post_types || in_array( get_post_type( $post ), $this->post_types );
	}



	/**
	 * Include posts with this post
	 * status on archive pages
	 *
	 * @param WP_Query $query
	 */
	function include_posts_with_status_in_archives( $query ) {
		if ( $query->is_main_query() && $query->is_archive() ) {
			// add post status to existing post status query
			$post_statuses = $query->get( 'post_status' );
			$post_statuses = empty( $post_statuses ) ? array( 'publish' ) : (array) $post_statuses;
			array_push( $post_statuses, $this->post_status );

			$query->set( 'post_status', $post_statuses );
		}
	}


	/**
	 * Get the post status's
	 * configuration given a
	 * sensible default
	 *
	 * @return array
	 */
	function get_args() {
		return wp_parse_args( $this->args, array(
			'label'                     => $this->name_singular,
			'public'                    => false,
			'exclude_from_search'       => true,
			'show_in_admin_all_list'    => true,
			'show_in_admin_status_list' => true,
			'internal'                  => null,
			'protected'                 => null,
			'private'                   => null,
			'publicly_queryable'        => false,
			'label_count'               => _n_noop(
				"{$this->name_singular} <span class='count'>(%s)</span>",
				"{$this->name_plural} <span class='count'>(%s)</span>"
			)
		) );
	}



	/**
	 * Register the custom post
	 * status with WordPress
	 *
	 */
	function register_post_status() {
		register_post_status( $this->post_status, self::get_args() );
	}
}