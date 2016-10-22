<?php
/**
 * Class MCF_Core
 *
 *
 */
class MCF_Core {

	/**
	 * @var array
	 */
	var $cpts       = array();

	/**
	 * @var array
	 */
	var $taxonomies = array();



	/**
	 * Register all the action and
	 * filter hooks for the custom
	 * functionality plugin
	 *
	 */
	function __construct() {

		register_activation_hook( __FILE__, array( &$this, 'activate' ) );

		register_deactivation_hook( __FILE__, 'flush_rewrite_rules' );


		add_action( 'plugins_loaded', array( &$this, 'register_post_types' ), 11 );

		add_action( 'plugins_loaded', array( &$this, 'register_taxonomies' ), 11 );


		add_action( 'admin_menu', array( &$this, 'register_options_pages' ) );
		add_action( 'admin_init', array( &$this, 'register_options_pages' ) );
	}



	/**
	 * Do all the necessary things
	 * on plugin activation
	 *
	 */
	function activate() {
		// register the site's
		// custom post types
		self::register_post_types();
		foreach ( $this->cpts as $cpt ) {
			/** @var $cpt Mlib_CPT */
			$cpt->register_post_type();
		}

		// and taxonomies
		self::register_taxonomies();
		foreach ( $this->taxonomies as $taxonomy ) {
			/** @var $taxonomy Mlib_Taxonomy */
			$taxonomy->register_taxonomy();
		}

		// register the site's
		// options page
		self::register_options_pages();

		// flush rewrite rules so
		// new rewrite rules take
		// effect
		flush_rewrite_rules();
	}



	/**
	 * Register the site's custom
	 * post types
	 *
	 */
	function register_post_types() {
		/*
		$custom_post_types = array(
			'gallery' => array(
				'public'        => false,
				'menu_position' => 11,
				'menu_icon'     => 'dashicons-admin-media',
				'name_singular' => __( 'Gallery', 'xxx001' ),
				'name_plural'   => __( 'Galleries', 'xxx001' ),
				'has_archive'   => __( 'gallery', 'xxx001' ),
				// 'rewrite'       => false
			),
		);
		*/

		$custom_post_types = array();

		foreach ( $custom_post_types as $post_type => $args ) {
			$this->cpts[$post_type] = new Mlib_CPT( $post_type, $args );
		}
	}



	/**
	 * Register the site's custom
	 * taxonomies
	 *
	 */
	function register_taxonomies() {

		/*
		$custom_taxonomies = array(
			'location_type' => array(
				'post_types'    => 'location',
				'name_singular' => __( 'Type', 'xxx001' ),
			  	'rewrite'       => array(
					'slug' => _x( 'places', 'slug for the Location Type taxonomy', 'xxx001' )
			  	)
			),
		)
		*/

		$custom_taxonomies = array( );

		foreach ( $custom_taxonomies as $taxonomy => $args ) {
			$post_types = isset( $args['post_types'] ) && ! empty( $args['post_types'] )
				? $args['post_types']
				: '';

			$this->taxonomies[$taxonomy] = new Mlib_Taxonomy( $taxonomy, $post_types, $args );
		}
	}



	/**
	 * Register the options
	 * pages to be used
	 *
	 */
	function register_options_pages() {
		if ( function_exists( 'acf_add_options_page' ) ) {
			acf_add_options_page( array(
				'position'    => 59,
				'page_title'  => 'Site Options',
				'redirect'    => false
			) );

			/*

			// Add sub page to Site Options

			acf_add_options_sub_page( array(
				'page_title'  => 'User Options',
				'menu_slug'   => 'user-options',
			  'parent_slug' => 'acf-options-site-options'
			) );


			
			// Add custom post type Sub Options Page

			acf_add_options_sub_page( array(
				'page_title'  => 'Gallery Options',
				'capability'  => 'edit_published_posts',
				'parent_slug' => 'edit.php?post_type=gallery'
			) );

			*/

		}
	}
}