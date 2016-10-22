<?php



/**
 * Class Mlib_Taxonomy
 *
 * Very simple Custom Taxonomy
 * helper function
 */
class Mlib_Taxonomy {

	/**
	 * @var string
	 */
	var $taxonomy;

	/**
	 * @var array
	 */
	var $post_types;

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
	 * Set the basic properties
	 * of the Custom Taxonomy
	 * and register the necessary
	 * actions for the Taxonomy to work
	 *
	 * @param       $taxonomy
	 * @param       $post_types
	 * @param array $args
	 */
	function __construct( $taxonomy, $post_types, $args = array() ) {
		// Set class properties
		$this->taxonomy   = $taxonomy;
		$this->post_types = is_array( $post_types ) ? $post_types : array( $post_types );

		$this->name_singular = isset( $args['name_singular'] ) && ! empty( $args['name_singular'] )
			? $args['name_singular']
			: $this->taxonomy;

		$this->name_plural = isset( $args['name_plural'] ) && ! empty( $args['name_plural'] )
			? $args['name_plural']
			: $this->name_singular . 's';

		$this->slug = isset( $args['slug'] ) && ! empty( $args['slug'] )
			? $args['slug']
			: sanitize_title_for_query( $this->name_singular );

		$this->args = $args;

		// register taxonomy actions
		add_action( 'init', array( &$this, 'register_taxonomy' ), 15 );

		// in admin add taxonomy filters to custom post type tables
		add_action( 'restrict_manage_posts', array( &$this, 'add_taxonomy_filters' ) );
	}


	/**
	 * Generate and return the
	 * Labels config array
	 * based on the singular
	 * and plural name of the
	 * Taxonomy
	 *
	 * @return array
	 */
	function get_labels() {
		return array(
			'name'                       => $this->name_plural,
			'singular_name'              => $this->name_singular,
			'menu_name'                  => $this->name_plural,
			'all_items'                  => sprintf( __( 'All %s', 'mutil-lib' ), $this->name_plural ),
			'edit_item'                  => sprintf( __( 'Edit %s', 'mutil-lib' ), $this->name_singular ),
			'view_item'                  => sprintf( __( 'View %s', 'mutil-lib' ), $this->name_singular ),
			'update_item'                => sprintf( __( 'Update %s', 'mutil-lib' ), $this->name_singular ),
			'add_new'                    => sprintf( __( 'Add %s', 'mutil-lib' ), $this->name_singular ),
			'add_new_item'               => sprintf( __( 'Add New %s', 'mutil-lib' ), $this->name_singular ),
			'new_item_name'              => sprintf( __( 'New %s Name', 'mutil-lib' ), $this->name_singular ),
			'parent_item'                => sprintf( __( 'Parent %s', 'mutil-lib' ), $this->name_singular ),
			'parent_item_colon'          => sprintf( __( 'Parent %s:', 'mutil-lib' ), $this->name_singular ),
			'search_items'               => sprintf( __( 'Search %s', 'mutil-lib' ), $this->name_plural ),
			'popular_items'              => sprintf( __( 'Popular %s', 'mutil-lib' ), $this->name_plural ),
			'separate_items_with_commas' => sprintf( __( 'Separate %s with commas', 'mutil-lib' ), $this->name_plural ),
			'add_or_remove_items'        => sprintf( __( 'Add or remove %s', 'mutil-lib' ), $this->name_plural ),
			'choose_from_most_used'      => sprintf( __( 'Choose from the most used %s', 'mutil-lib' ), $this->name_plural ),
			'not_found'                  => sprintf( __( 'No %s Found', 'mutil-lib' ), $this->name_plural ),
			'not_found_in_trash'         => sprintf( __( 'No %s Found in Trash', 'mutil-lib' ), $this->name_plural ),
		);
	}


	/**
	 * Generate the Taxonomy arguments
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
			'label'                 => $this->name_plural,
			'labels'                => self::get_labels(),
			'public'                => true,
			'show_ui'               => true,
			'show_in_nav_menus'     => true,
			'show_tagcloud'         => true,
			'show_in_quick_edit'    => true,
			'meta_box_cb'           => null,
			'show_admin_column'     => true,
			'hierarchical'          => true,
			'update_count_callback' => null,
			'query_var'             => $this->taxonomy,
			'rewrite'               => array(
				'slug'         => $this->slug,
				'with_front'   => true,
				'hierarchical' => true,
				'ep_mask'      => EP_PERMALINK
			),
			'capabilities'          => array(
				'manage_terms',
				'edit_terms',
				'delete_terms',
				'assign_terms'
			),
			'sort'                  => null
		) );
	}


	/**
	 * Add the custom Taxonomy filter
	 * to the Custom Post Type admin
	 * table
	 *
	 */
	function add_taxonomy_filters() {
		global $typenow;

		if ( in_array( $typenow, $this->post_types ) ) {
			$selected = false;
			if ( isset( $_GET[ $this->taxonomy ] ) && ( $term = get_term_by( 'slug', $_GET[ $this->taxonomy ], $this->taxonomy ) ) ) {
				$selected = $term->slug;
			}

			wp_dropdown_categories( array(
				'show_option_all'   => "All {$this->name_plural}",
				'show_option_none'  => false,
				'show_count'        => true,
				'hide_empty'        => false,
				'selected'          => $selected,
				'hierarchical'      => true,
				'name'              => $this->taxonomy,
				'id'                => $this->taxonomy,
				'class'             => '',
				'taxonomy'          => $this->taxonomy,
				'value_field'       => 'slug',
			) );
		}
	}


	/**
	 * Register the Custom
	 * taxonomy with WP
	 *
	 */
	function register_taxonomy() {
		register_taxonomy( $this->taxonomy, $this->post_types, self::get_args() );
	}
}
