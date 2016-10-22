<?php
/**
 * Contact Form 7 Form Panel View
 *
 * @package WordPress
 * @package CF7--Template-Support
 *
 * @author  Max G J Panas <http://maxpanas.com>
 */

// make sure this file is called by wp
defined( 'ABSPATH' ) or die( "No script kiddies please!" );

include 'cf7ts-form.php';

/**
 * Prints the custom Form
 * Panel content
 *
 * @see   wpcf7_editor_panel_form()
 *
 * @since 1.0
 *
 * @param $post
 */
function cf7ts_editor_panel_form( $post ) {
	?>

	<h3><?php echo esc_html( __( 'Form', 'contact-form-7' ) ); ?></h3>

	<?php cf7ts_template_selector( $post ); ?>

	<div id="cf7ts_type__form">
		<br/>
		<?php
		$tag_generator = WPCF7_TagGenerator::get_instance();
		$tag_generator->print_buttons();
		?>

		<textarea id="wpcf7-form"
		          name="wpcf7-form"
		          cols="100"
		          rows="24"
		          class="large-text code">
			<?php echo esc_textarea( $post->prop( 'form' ) ); ?>
		</textarea>
	</div>

	<?php cf7ts_template_selector_scripts(); ?>

<?php
}
