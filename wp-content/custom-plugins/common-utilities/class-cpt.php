<?php



/**
 * Class Mlib_CPT
 *
 * Very simple Custom Post Type
 * helper function
 */
class Mlib_CPT {

	/**
	 * @var string
	 */
	var $post_type;

	/**
	 * @var string
	 */
	var $name_singular;

	/**
	 * @var string
	 */
	var $name_plural;

	/**
	 * @var string
	 */
	var $slug;

	/**
	 * @var array
	 */
	var $args;



	/**
	 * Get an array of all public
	 * post types
	 *
	 * @param array $filter
	 *
	 * @return array
	 */
	static function get_public_post_types( $filter = array() ) {
		return array_values( get_post_types( array_merge( array(
			'public' => true
		), $filter ) ) );
	}



	/**
	 * Set the basic properties
	 * of the Custom Post Type
	 * and register the necessary
	 * actions for the CPT to work
	 *
	 * @param       $post_type
	 * @param array $args
	 */
	function __construct( $post_type, $args = array() ) {

		/** --- Properties --- */
		// Set class properties

		$this->post_type = $post_type;

		$this->name_singular = isset( $args['name_singular'] ) && ! empty( $args['name_singular'] )
			? $args['name_singular']
			: $this->post_type;

		$this->name_plural = isset( $args['name_plural'] ) && ! empty( $args['name_plural'] )
			? $args['name_plural']
			: $this->name_singular . 's';

		$this->slug = isset( $args['slug'] ) && ! empty( $args['slug'] )
			? $args['slug']
			: sanitize_title_for_query( $this->name_singular );

		$this->args = $args;

		/** --- Actions & Filters --- */
		// register post type actions

		add_action( 'init', array( &$this, 'register_post_type' ), 3 );
	}



	/**
	 * Generate and return the
	 * Labels config array
	 * based on the singular
	 * and plural name of the
	 * cpt
	 *
	 * @return array
	 */
	function get_labels() {
		return array(
			'name'               => $this->name_plural,
			'singular_name'      => $this->name_singular,
			'menu_name'          => $this->name_plural,
			'parent_item_colon'  => sprintf( __( 'Parent %s', 'mutil-lib' ), $this->name_singular ),
			'all_items'          => sprintf( __( 'All %s', 'mutil-lib' ), $this->name_plural ),
			'view_item'          => sprintf( __( 'View %s', 'mutil-lib' ), $this->name_singular ),
			'add_new_item'       => sprintf( __( 'Add New %s', 'mutil-lib' ), $this->name_singular ),
			'add_new'            => sprintf( __( 'Add %s', 'mutil-lib' ), $this->name_singular ),
			'edit_item'          => sprintf( __( 'Edit %s', 'mutil-lib' ), $this->name_singular ),
			'update_item'        => sprintf( __( 'Update %s', 'mutil-lib' ), $this->name_singular ),
			'search_items'       => sprintf( __( 'Search %s', 'mutil-lib' ), $this->name_plural ),
			'not_found'          => __( 'Not found', 'mutil-lib' ),
			'not_found_in_trash' => __( 'Not found in Trash', 'mutil-lib' ),
		);
	}



	/**
	 * Generate the cpt arguments
	 * based on a set of predefined
	 * defaults
	 *
	 * you can override these defaults
	 * by passing the differences into
	 * the args parameter when calling
	 * the class
	 *
	 * @return array
	 */
	function get_args() {
		return wp_parse_args( $this->args, array(
			'label'               => $this->name_plural,
			'labels'              => self::get_labels(),
			'description'         => '',
			'public'              => true,
			'exclude_from_search' => false,
			'publicly_queryable'  => true,
			'show_ui'             => true,
			'show_in_nav_menus'   => true,
			'show_in_menu'        => true,
			'show_in_admin_bar'   => true,
			'menu_position'       => 7,
			'menu_icon'           => 'dashicons-admin-post',
			'capability_type'     => 'post',
			'hierarchical'        => false,
			'supports'            => array( 'title', 'editor', 'thumbnail' ),
			'has_archive'         => false,
			'permalink_epmask'    => EP_PERMALINK,
			'rewrite'             => array(
				'slug'       => $this->slug,
				'with_front' => true,
				'feeds'      => false,
				'pages'      => true,
				'ep_mask'    => EP_PERMALINK
			)
		) );
	}



	/**
	 * Register the Custom
	 * post type with WP
	 *
	 */
	function register_post_type() {
		register_post_type( $this->post_type, self::get_args() );
	}
}