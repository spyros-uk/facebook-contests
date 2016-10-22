<?php
/*
 * Plugin Name: SDP - Geo Service
 * Depends: SDP - Plugin Utilities, Advanced Custom Fields PRO
 * Description: Adds required functionality to WP to allow for Location Based Queries
 * Version: 1.0
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons.
 *
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();


// Register the class autoloader for
// the likes
spl_autoload_register( function ( $class ) {
	$prefix = 'Mloc_';
	if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
		$class = substr( $class, strlen( $prefix ) );
	}
	$class = strtolower( $class );

	$path = "class-$class.php";

	foreach ( array( '', 'library', 'plugins' ) as $dir ) {
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
global $sdp_mloc;
$sdp_mloc = new Mloc_Core( __FILE__ );


function mloc() {
	/** @var $sdp_mloc Mloc_Core */
	global $sdp_mloc;

	return $sdp_mloc;
}