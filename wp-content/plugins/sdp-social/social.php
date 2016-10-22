<?php
/*
 * Plugin Name: SDP - Social
 * Description: Add and Manage Posts and Tweets for Increadible Crete Website
 * Version: 1.0
 * Author: SDPapaioannou
 * Author URI: http://sdpapaioannou.com
 * License: Creative Commons
 *
 */



// make sure this file is called by wp
defined( 'ABSPATH' ) or die();

// Register the class autoloader for
// the social plugin
spl_autoload_register( function ( $class ) {
    $prefix = 'MSoc_';

    if ( substr( $class, 0, strlen( $prefix ) ) == $prefix ) {
        $class = substr( $class, strlen( $prefix ) );
    } else {
        return;
    }

    $class = strtolower( $class );
    $class = str_replace( '_', '-', $class );

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

new MSoc_Core();