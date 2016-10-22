<?php
/**
 * Contact Form 7 Form Metabox View
 *
 * @package WordPress
 * @package CF7--Template-Support
 *
 * @author Max G J Panas <http://maxpanas.com>
 */

// make sure this file is called by wp
defined( 'ABSPATH' ) or die( "No script kiddies please!" );

include 'cf7ts-form.php';

/**
 * Prints the custom Form
 * Meta-Box content
 *
 * @see   wpcf7_form_meta_box()
 *
 * @since 1.0
 *
 * @param $post
 */
function cf7ts_form_meta_box( $post ) {

	cf7ts_template_selector( $post );

	?>

	<div id="cf7ts_type__form">
		<br/>
		<?php
		// print the default contact form 7
		// form builder
		wpcf7_form_meta_box( $post );
		?>
	</div>

<?php
}