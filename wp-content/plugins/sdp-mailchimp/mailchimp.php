<?php
/*
 * Plugin Name: SDP - Simple Mailchimp Form
 * Depends: Advanced Custom Fields PRO
 * Description: This Plugin helps you make an ajax mailchimp newsletter signup form.
 * Version: 1.0
 * Author: Stelios Charmpalis, Max GJ Panas
 * Author URI: http://www.twitter.com/SteliosHarb
 */


// make sure this file is called by wp
defined( 'ABSPATH' ) or die();


// Register the class autoloader for
// the likes
spl_autoload_register( function ( $class ) {
	$prefix = 'MChimp_';
	if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
		$class = substr( $class, strlen( $prefix ) );
	}
	$class = strtolower( $class );

	$path = "class-$class.php";

	foreach ( array( '' ) as $dir ) {
		if ( ! empty( $dir ) ) {
			$dir = $dir . DIRECTORY_SEPARATOR;
		}

		if ( file_exists( __DIR__ . DIRECTORY_SEPARATOR . $dir . $path ) ) {
			include $dir . $path;
			break;
		}
	}
} );

global $mchimp_mailchimp;
$mchimp_mailchimp = new MChimp_Core();

/**
 * Expose the plugin
 * instance
 *
 * @return MChimp_Core
 */
function mMailchimp() {
	global $mchimp_mailchimp;

	return $mchimp_mailchimp;
}