<?php
/*
 * Plugin Name: SDP - Plugin Utilities
 * Description: Exposes Utility Libraries for plugins to build upon
 * Version: 1.1
 * Author: Max GJ Panas
 * Author URI: http://maxpanas.com
 * License: GPLv2+ && MIT
 * Text-Domain: mutil-lib
 *
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();


// Register the class autoloader for library
spl_autoload_register( function ( $class ) {
	$prefix = 'Mlib_';
	if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
		$class = substr( $class, strlen( $prefix ) );
	}
	$class = strtolower( $class );

	$path = 'common-utilities' . DIRECTORY_SEPARATOR . "class-$class.php";

	if ( file_exists( __DIR__ . DIRECTORY_SEPARATOR . $path ) ) {
		include $path;
	}
} );