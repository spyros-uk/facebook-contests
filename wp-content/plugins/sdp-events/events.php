<?php
/*
 * Plugin Name: SDP - Events
 * Depends: SDP - Plugin Utilities
 * Description: Adds required functionality to WP to allow for Events
 * Version: 1.0
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons
 *
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();


// Register the class autoloader for events
spl_autoload_register( function ( $class ) {

	$prefix = 'Mevent_';
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
global $sdp_mevent;
$sdp_mevent = new Mevent_Core( __FILE__ );


function mevent() {
	global $sdp_mevent;
	return $sdp_mevent;
}