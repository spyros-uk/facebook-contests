<?php
/*
 * Plugin Name: SDP - Custom Functionality Plugin
 * Depends: SDP - Plugin Utilities
 * Description: Adds required functionality to WP required by the project
 * Version: 1.1
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons
 *
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();



// Register the class autoloader for
// the mbwp functionality plugin
spl_autoload_register( function ( $class ) {

	$prefix = 'MCF_';
	if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
		$class = substr( $class, strlen( $prefix ) );
	}
	$class = strtolower( $class );

	$path  = "class.$class.php";

	foreach ( array( '', 'library' ) as $dir ) {
		if ( ! empty( $dir ) ) {
			$dir = $dir . DIRECTORY_SEPARATOR;
		}

		if ( file_exists( __DIR__ . DIRECTORY_SEPARATOR . $dir . $path ) ) {
			include $dir . $path;
			break;
		}
	}
} );


// initialize plugin
new MCF_Core();