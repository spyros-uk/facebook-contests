<?php



/**
 * Class Mlikes_WPML
 *
 * WPML Plugin for Moz likes
 */
class MLikes_Plugin_WPML {

	/**
	 * Register Mlikes plugin
	 * hooks
	 *
	 */
	function __construct() {
		add_filter( 'mlikes_content_details', array( &$this, 'edit_content_details' ) );
	}


	/**
	 * Normalize content likes
	 * across languages
	 *
	 * @param $content
	 *
	 * @return mixed
	 */
	function edit_content_details( $content ) {
		/** @var $sitepress SitePress */
		global $sitepress;

		if ( in_array( $content['type'], array( 'singular', 'term' ) ) ) {
			$content['id'] = (int) wpml_object_id( $content['id'], $content['meta'], true, $sitepress->get_default_language() );
		}

		return $content;
	}
}