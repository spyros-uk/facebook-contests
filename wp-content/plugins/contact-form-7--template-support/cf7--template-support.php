<?php
/*
 * Plugin Name: Contact Form 7: Template Support
 * Description: Adds the ability to use template files for contact form 7 forms.
 * Version: 1.4
 * Author: Max GJ Panas
 * Author URI: http://maxpanas.com
 * Text Domain: cf7ts
 * License: GPL2
 *
 * Copyright 2014  Max G J Panas  (email : m@maxpanas.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License, version 2, as
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */



// make sure this file is called by wp
defined( 'ABSPATH' ) or die( "No script kiddies please!" );

class CF7_Template_Support {

	var $forms = array();

	function __construct() {

		/* =========================================
				ACTION HOOKS & FILTERS
			 ========================================= */

		/** --- Actions --- */

		add_action( 'init',                    array( &$this, 'cf7ts_load_text_domain' ) );

		add_action( 'wpcf7_add_meta_boxes',    array( &$this, 'cf7ts_replace_form_metabox' ) );

		add_action( 'wpcf7_save_contact_form', array( &$this, 'cf7ts_save_custom_form_meta' ) );


		/** --- Filters --- */

		add_filter( 'wpcf7_editor_panels', array( &$this, 'cf7ts_replace_form_panel' ) );

		add_filter( 'wpcf7_contact_form_properties', array( &$this, 'cf7ts_register_custom_form_meta' ), 10, 2 );
	}


	/* =========================================
			HOOKED Functions
		 ========================================= */

	/** --- Actions --- */

	/**
	 * Load the plugins text
	 * domain and relative paths
	 * to allow for internationalization
	 *
	 * @since 1.1
	 */
	function cf7ts_load_text_domain() {

		load_plugin_textdomain( 'cf7ts', false, basename( dirname( __FILE__ ) ) . '/i18n' );
	}



	/**
	 * Action Replace the Form
	 * Metabox with our custom one
	 * in the admin form edit
	 * screen
	 *
	 * @see   cf7ts_form_meta_box()
	 *
	 * @since 1.1
	 */
	function cf7ts_replace_form_metabox() {
		// deregister cf7 original metabox
		remove_meta_box( 'formdiv', null, 'form' );

		require_once 'admin/cf7ts-metabox--form.php';

		// register our own custom metabox
		add_meta_box(
			'cf7ts_formdiv',
			__( 'Form', 'contact-form-7' ),
			'cf7ts_form_meta_box',
			null,
			'form',
			'core'
		);
	}



	/**
	 * Action to save the custom
	 * Form Properties when saving
	 * in the admin form edit screen
	 *
	 * @since 1.1
	 *
	 * @param $contact_form
	 *
	 * @return mixed
	 */
	function cf7ts_save_custom_form_meta( $contact_form ) {

		$properties = $contact_form->get_properties();

		if ( isset( $_POST['cf7ts-form-type'] ) && in_array( $_POST['cf7ts-form-type'], array(
					'cf7ts_type__form',
					'cf7ts_type__template'
			) )
		) {
			$properties['cf7ts-form-type'] = $_POST['cf7ts-form-type'];
		}

		if ( isset( $_POST['cf7ts-form-template'] ) && '' !== locate_template( $_POST['cf7ts-form-template'] ) ) {
			$properties['cf7ts-form-template'] = $_POST['cf7ts-form-template'];
		}

		return $contact_form->set_properties( $properties );
	}



	/** --- Filters --- */


	/**
	 * Replace Form
	 * Panel Callback
	 *
	 * @param $panels
	 *
	 * @return mixed
	 */
	function cf7ts_replace_form_panel( $panels ) {

		require_once 'admin/cf7ts-panel--form.php';

		$panels['form-panel'] = array(
			'title'    => __( 'Form', 'contact-form-7' ),
			'callback' => 'cf7ts_editor_panel_form'
		);

		return $panels;
	}



	/**
	 * Filter to modify the properties
	 * of the Form to include our
	 * custom form properties
	 *
	 * @since 1.0
	 *
	 * @param $properties
	 *
	 * @return mixed
	 */
	function cf7ts_register_custom_form_meta( $properties, $contact_form ) {

		// make sure "cf7ts-form-type" is available as a property
		$properties['cf7ts-form-type'] = ( isset( $properties['cf7ts-form-type'] ) )
			? $properties['cf7ts-form-type']
			: 'cf7ts_type__form';

		// make sure "cf7ts-form-template" is available as a property
		$properties['cf7ts-form-template'] = ( isset( $properties['cf7ts-form-template'] ) )
			? str_replace( array( '\\', '/' ), DIRECTORY_SEPARATOR, $properties['cf7ts-form-template'] )
			: '';

		if ( 'cf7ts_type__template' === $properties['cf7ts-form-type'] && ! empty( $properties['cf7ts-form-template'] ) ) {
			// if cf7ts type is template set form to template output
			if ( ! isset( $this->forms[$contact_form->id()] ) ) {
				ob_start();
					locate_template( $properties['cf7ts-form-template'], true, false );
				$this->forms[$contact_form->id()] = ob_get_clean();
			}
			$properties['form'] = $this->forms[$contact_form->id()];
		}

		return $properties;
	}
}



new CF7_Template_Support();


/* =========================================
		GENERAL Functions
   ========================================= */


/**
 * Retrieves the list of named Contact
 * Form 7 Templates from the current
 * theme directory.
 *
 * Checks for files matching cf7-{something}.php
 * and then checks to read the template's "name"
 * as it is defined in a comment in the first five
 * lines of the file. The comment should contain
 * the following:
 *
 * 		CF7-Template: {THE NAME OF THE TEMPLATE}
 *
 * @since 1.1
 *
 * @param string $pattern The pattern to match template files against
 * @param string $linePattern The pattern to match template names against
 *
 * @return array
 */
function cf7ts_get_templates( $pattern, $linePattern ) {
	$templates = array();

	// The theme directory
	//
	// Note: when using a child theme this refers
	// to the parent theme directory
	$folder = get_template_directory();

	// Iterate through the files in the theme
	// directory and match all files matching
	// the template file-name $pattern
	$dir = new RecursiveDirectoryIterator( $folder );
	$ite = new RecursiveIteratorIterator( $dir );
	$files = new RegexIterator( $ite, $pattern );

	foreach( $files as $file ) {

		// use wp locate_template for better
		// child-theme support
		$path = locate_template( ltrim( str_replace(
					$folder, '',
					$file->getPathname() // < -- the path to the file
		), DIRECTORY_SEPARATOR ) );

		if ( empty( $path ) ) {
			continue;
		}

		// Open the file and read a maximum of 5 lines.
		// If the template name pattern matches, extract
		// the template's given name and push the template
		// to the templates list.
		$fh = fopen( $path, 'r' );
		$maxLines = 5;
		while ( ! feof( $fh ) && $maxLines-- ) {
			$line = fgets( $fh, 4096 );
			preg_match( $linePattern, $line, $match );
			if ( ! empty( $match ) ) {
				array_push( $templates, array(
					'path' => ltrim( str_replace(
						$folder, '',
						$path
					), DIRECTORY_SEPARATOR ),
					'name' => $match[1]
				) );
				break;
			}
		}
		fclose( $fh );
	}

	return $templates;
}
