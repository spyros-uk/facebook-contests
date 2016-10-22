<?php
/**
 *
 */


class MLikes_Core {

	/**
	 * @var MLikes_Admin
	 */
	var $admin;

	/**
	 * @var MLikes_Liker
	 */
	var $liker;

	/**
	 * @var MLikes_Content
	 */
	var $content;

	/**
	 * @var MLikes_LikesTable
	 */
	var $db;


	/**
	 * Hook the plugin into WordPress
	 *
	 * @param $plugin_file
	 */
	function __construct( $plugin_file ) {

		register_activation_hook( $plugin_file, array( &$this, 'plugin_activate' ) );

		/** -- actions -- */

		add_action( 'plugins_loaded', array( &$this, 'init' ), 0 );

		add_action( 'mlikes_init', array( &$this, 'init_core_plugins' ) );
	}


	/**
	 * Activate Plugin
	 * Functionality
	 *
	 */
	function plugin_activate() {
		self::init();
		self::install_likes_table();
	}


	/**
	 * Initialize the plugin
	 * and fire off init hooks
	 *
	 */
	function init() {
		/**
		 * Hook into this action to
		 * initialize Mlikes Plugins
		 *
		 * @since 1.0
		 */
		do_action( 'mlikes_init', $this );


		/**
		 * Initialize the plugin's
		 * external components
		 *
		 */
		$this->db      = new MLikes_LikesTable();
		$this->content = new MLikes_Content();
		$this->admin   = new MLikes_Admin();
		$this->liker   = new MLikes_Liker();
	}


	/**
	 * Initialize the core Mlikes
	 * plugins
	 *
	 */
	function init_core_plugins() {
		// is wpml enabled?
		if ( function_exists( 'wpml_object_id' ) ) {
			// initialize the wpml plugin
			// for moz likes
			new MLikes_Plugin_WPML();
		}
	}


	/**
	 * Make sure to install
	 * the likes table if
	 * it doesn't exist
	 *
	 */
	function install_likes_table() {
		if ( ! $this->db->table_exists() ) {
			$this->db->create();
		}
	}
}