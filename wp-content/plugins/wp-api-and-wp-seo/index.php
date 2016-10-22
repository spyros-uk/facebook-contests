<?php
/*
 * Plugin Name: SDP - WP API SEO
 * Plugin Dependencies: WP-API, WordPress SEO
 * Description: Include WordPress SEO data in JSON output. Note: Only supports reading the data not writing or deleting it via the api.
 * Version: 1.0
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons
 *
 */



/**
 * Class WP_API_SEO
 *
 */
class WP_API_SEO {
	/**
	 * Return an array of the
	 * currently registered
	 * post types
	 *
	 * @return array
	 */
	protected static function get_public_post_types() {
		return array_values( (array) get_post_types( array( 'public' => true ) ) );
	}


	/**
	 * Determine if a given object
	 * is a wp post object
	 *
	 * @param $object
	 *
	 * @return bool
	 */
	protected static function is_singular( $object ) {
		return ! is_object( $object ) || ! $object instanceof WP_Post;
	}


	/**
	 * Register action and filter
	 * hooks
	 *
	 * WP_API_SEO constructor.
	 */
	public function __construct() {
		add_action( 'rest_api_init', array( &$this, 'register_fields' ) );
	}


	/**
	 * Register the seo api
	 * field and attach a get
	 * request handler to it
	 *
	 */
	public function register_fields() {
		register_rest_field( self::get_public_post_types(), 'seo', array(
			'get_callback' => array( &$this, 'gather_seo_data' )
		) );
	}


	/**
	 * Gather all seo related data
	 *
	 * @warning currently only works for singular pages
	 *
	 * @param array           $object     The object from the response
	 * @param string          $field_name Name of field
	 * @param WP_REST_Request $request    Current request
	 *
	 * @return array
	 */
	public function gather_seo_data( $object, $field_name, $request ) {
		if ( ! self::is_singular( $object ) ) return false;

		/** @var $object WP_Post */
		return array(
			'title' => WPSEO_Meta::get_value( 'title', $object->ID ),
			'description' => WPSEO_Meta::get_value( 'metadesc', $object->ID )
		);
	}
}

// initialize the plugin
new WP_API_SEO();
