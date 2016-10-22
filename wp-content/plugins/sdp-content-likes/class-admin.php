<?php

/**
 * Class MLikes_Admin
 *
 */
class MLikes_Admin {

	const LIKES_PAGE_FIELD_KEY = 'mlikes_likes_page';

	/**
	 * Hook into WP admin
	 */
	function __construct() {
		add_action( 'admin_init', array( &$this, 'register_settings' ) );
	}


	/**
	 * Register plugin settings
	 *
	 */
	function register_settings() {
		add_settings_field(
			self::LIKES_PAGE_FIELD_KEY,
			'Content Likes display',
			array( &$this, 'render_likes_page_field' ),
			'reading'
		);

		register_setting( 'reading', self::LIKES_PAGE_FIELD_KEY );
	}


	/**
	 * Render the likes page
	 * field
	 *
	 */
	function render_likes_page_field() {

		echo '<label for="mlikes_likes_page">';
			echo 'Content Likes page:';
		echo '</label> ';

		wp_dropdown_pages( array(
			'name'              => self::LIKES_PAGE_FIELD_KEY,
			'show_option_none'  => __( '&mdash; Select &mdash;' ),
			'option_none_value' => '0',
			'selected'          => self::get_likes_page()
		) );
	}


	/**
	 * Return the page selected
	 * to display likes to the
	 * user
	 *
	 * @return mixed|void
	 */
	function get_likes_page() {
		return get_option( self::LIKES_PAGE_FIELD_KEY );
	}
}