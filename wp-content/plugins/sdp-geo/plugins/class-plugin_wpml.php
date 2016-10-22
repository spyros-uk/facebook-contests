<?php



/**
 * Class Mloc_WPML
 *
 * WPML Plugin for Moz Geo Services
 *
 * @extends Mevent_Plugin
 */
class Mloc_Plugin_WPML {

	/**
	 * Register Mloc Plugin
	 * hooks
	 *
	 */
	function __construct() {
		add_filter( 'mloc_add_location_data', array( &$this, 'normalize_location' ) );
	}


	/**
	 * Normalize post id across
	 * languages
	 *
	 * @param $post_id
	 *
	 * @return bool|mixed|null|string
	 */
	function normalize_post_id( $post_id ) {
		/** @var $sitepress SitePress */
		global $sitepress;

		return wpml_object_id(
			$post_id,
			get_post_type( $post_id ),
			true,
			$sitepress->get_default_language()
		);
	}


	/**
	 * Normalize location across
	 * languages
	 *
	 * @param $data
	 *
	 * @return mixed
	 */
	function normalize_location( $data ) {
		$data['post_id'] = self::normalize_post_id( $data['post_id'] );
		return $data;
	}
}