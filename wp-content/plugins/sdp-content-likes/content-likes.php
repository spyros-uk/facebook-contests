<?php
/*
 * Plugin Name: SDP - Content Likes
 * Depends: SDP - Plugin Utilities
 * Description: Adds required functionality to WP to allow for Users "Liking" or "Favorite-ing" Content
 * Version: 1.1
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons
 *
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();


// Register the class autoloader for
// the likes
spl_autoload_register( function ( $class ) {
	$prefix = 'MLikes_';
	if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
		$class = substr( $class, strlen( $prefix ) );
	}
	$class = strtolower( $class );

	$path = "class-$class.php";

	foreach ( array( '', 'library', 'plugins' ) as $dir )  {
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
global $sdp_mlikes;
$sdp_mlikes = new MLikes_Core( __FILE__ );


function mlikes() {
	global $sdp_mlikes;
	return $sdp_mlikes;
}