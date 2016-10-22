<?php


/**
 * Print the custom form
 * template stuff
 *
 * @param $post
 */
function cf7ts_template_selector( $post ) {
	?>
	<style>
		#cf7ts_type__template {
			max-height: 300px;
			-webkit-transition: 0.3s;
			-moz-transition: 0.3s;
			-o-transition: 0.3s;
			transition: 0.3s;
			overflow: hidden;
		}

		#cf7ts_type__template.cf7ts-hidden {
			max-height: 0;
		}

		.cf7ts-list {
			list-style: disc;
			padding-left: 20px;
		}

		.cf7ts-hidden {
			display: none;
		}
	</style>

	<p>
		<label for="cf7ts_form_type">
			<?php esc_html_e( 'Create the form with', 'cf7ts' ); ?>:
		</label>
	</p>

	<?php
	$form_type = $post->prop( 'cf7ts-form-type' );
	$form_type = ( ! empty( $form_type ) ) ? $form_type : 'cf7ts_type__form';
	?>

	<select id="cf7ts_form_type" name="cf7ts-form-type">
		<option value="cf7ts_type__form" <?php selected( $form_type, 'cf7ts_type__form' ); ?>>
			<?php esc_html_e( 'the Form Builder', 'cf7ts' ); ?>
		</option>
		<option value="cf7ts_type__template" <?php selected( $form_type, 'cf7ts_type__template' ); ?>>
			<?php esc_html_e( 'a Template File', 'cf7ts' ); ?>
		</option>
	</select>

	<div id="cf7ts_type__template">
		<div class="half-left">
			<p>
				<label for="cf7ts_form_template">
					<?php esc_html_e( 'Select the template file you would like to use', 'cf7ts' ); ?>:
				</label>
			</p>
			<?php
			$form_template = $post->prop( 'cf7ts-form-template' );
			$templates     = cf7ts_get_templates( '/cf7-(?:.+)\.php/', '/(?:\s|^)CF7-Template:\s([0-9\s\w]+)/' );
			if ( ! empty( $templates ) ) : ?>
				<p>
					<select id="cf7ts_form_template" name="cf7ts-form-template">
						<?php foreach ( $templates as $template ) :
							$path = esc_attr( $template['path'] );
							?>
							<option value="<?php echo $path; ?>" <?php selected( ltrim( $form_template, '/' ), ltrim( $path, '/' ) ); ?>>
								<?php echo esc_html( $template['name'] ); ?>
							</option>
						<?php endforeach; ?>
					</select>
					<br/>
						<span class="description">
							<?php esc_html_e( 'If the template file is not found, the form below will be used to produce the form.', 'cf7ts' ); ?>
						</span>
				</p>
			<?php else : ?>
				<span class="description">
						<?php _e( 'Oops! It appears you do not have any Contact Form 7 templates in your theme. Please create some first! It\'s easy:', 'cf7ts' ); ?>
					</span>
				<ul class="cf7ts-list">
					<li><?php _e( 'Base yourself on the form below (<strong>use the shortcodes for the inputs</strong>)', 'cf7ts' ); ?></li>
					<li><?php _e( 'Use any php/wp/etc functions you need', 'cf7ts' ); ?></li>
					<li><?php _e( 'Add the name of the template in a comment at the top, like so:<br /><strong>CF7-Template: Contact Form</strong>', 'cf7ts' ); ?></li>
					<li><?php _e( 'Prefix the filename with "cf7-", like so: <strong>cf7-contact.php</strong>', 'cf7ts' ); ?></li>
				</ul>
				<p>
					<?php _e( 'That\'s it! Once you\'ve created the file, refresh this page and it will appear here!', 'cf7ts' ); ?>
				</p>
			<?php endif; ?>
		</div>
		<br class="clear"/>
	</div>

	<?php
}



/**
 *
 *
 */
function cf7ts_template_selector_scripts() {
	?>

	<script>
		(function ($) {
			var select = $('#cf7ts_form_type');
			var templateTab = $('#cf7ts_type__template');
			var formTab = $('#cf7ts_type__form');

			select.on('change cf7ts_UpdateFormType', function () {
				if ($(this).val() === "cf7ts_type__form") {
					templateTab.addClass('cf7ts-hidden');
					formTab.removeClass('cf7ts-hidden');
				} else {
					templateTab.removeClass('cf7ts-hidden');
					formTab.addClass('cf7ts-hidden');
				}
			}).trigger('cf7ts_UpdateFormType');
		}(jQuery));
	</script>

	<?php
}