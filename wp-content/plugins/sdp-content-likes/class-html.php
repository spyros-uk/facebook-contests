<?php



/**
 *
 */
class MLikes_Html {
	/**
	 * Print the markup for the
	 * likes counter
	 *
	 * @param array $options
	 */
	public static function likes_counter( $options = array() ) {
		echo self::get_likes_counter( $options );
	}


	/**
	 * Return the markup for
	 * the likes counter
	 *
	 * @param array $options
	 *
	 * @return string
	 */
	public static function get_likes_counter( $options = array() ) {
		$options = array_merge( array(
			'user'       => get_current_user_id(),
			'class'      => 'likes-count',
			'count_wrap' => '<span class="%1$s" data-mlikes-user-likes-count="%2$d">%2$d</span>'
		), $options );

		return sprintf(
			$options['count_wrap'],
			esc_attr( $options['class'] ),
			mlikes()->liker->count_user_likes( $options['user'] )
		);
	}


	/**
	 * Print a like button
	 *
	 * @param array $options
	 */
	public static function like_button( $options = array() ) {
		$like_button = self::get_like_button( $options );
		if ( $like_button && ! is_wp_error( $like_button ) ) {
			echo $like_button;
		}
	}


	/**
	 * Get the markup for a
	 * like button
	 *
	 * @param array $options
	 *
	 * @return bool|string
	 */
	public static function get_like_button( $options = array() ) {
		$options = array_merge( array(
			'user'           => get_current_user_id(),
			'label'          => false,
			'content'        => false,
			'like'           => __( 'Favorite %s', 'mlikes' ),
			'unlike'         => __( 'Un-favorite %s', 'mlikes' ),
			'button_content' => '',
			'scrrdr_class'   => 'visuallyhidden',
			'base_class'     => 'like',
			'liked_class'    => 'like--liked',
			'alt_class'      => 'like--disabled',
			'alt_content'    => '',
			'alt_link'       => wp_login_url(),
			'alt_msg'        => __( 'Please log-in to Favorite %s', 'mlikes' )
		), $options );

		$user = $options['user'];
		if ( is_user_logged_in() && ! get_userdata( $user ) ) {
			return new WP_Error( 'invalid-user', sprintf(
				__( 'The user with id: %d, is not a valid user', 'mlikes' ),
				$user
			) );
		}

		$content = $options['content'];
		if ( ! ( defined( 'DOING_AJAX' ) && DOING_AJAX ) && ( ! $content || empty( $content ) ) ) {
			$content = mlikes()->content->get_current();
		}

		if ( ! mlikes()->content->is_valid_content( $content ) ) {
			return new WP_Error( 'invalid-content',
				__( 'The content provided is invalid', 'mlikes' )
			);
		}

		$label = $options['label'];
		if ( ! $label || empty( $label ) ) {
			$label = mlikes()->content->get_content_label( $content );
		}

		$has_been_liked = mlikes()->liker->like_exists( $options['user'], $content );

		$action = $has_been_liked ? 'unlike' : 'like';

		$btn_class = $options['base_class'];
		if ( $has_been_liked ) {
			$btn_class .= " {$options['liked_class']}";
		}

		ob_start();
		if ( is_user_logged_in() ) : ?>

			<form data-mlikes-liker="<?php echo mlikes()->content->get_hash( $content ); ?>"
			      method="post"
			      action="">

				<?php wp_nonce_field( mlikes()->liker->get_nonce_key( $content, $action ) ); ?>
				<input type="hidden" name="action" value="mlikes_liker_<?php echo $action; ?>">
				<input type="hidden" name="type" value="<?php echo esc_attr( $content['type'] ); ?>">
				<input type="hidden" name="id" value="<?php echo esc_attr( $content['id'] ); ?>">
				<input type="hidden" name="meta" value="<?php echo esc_attr( $content['meta'] ); ?>">

				<button data-mlikes-liked-class="<?php echo esc_attr( $options['liked_class'] ); ?>"
				        class="<?php echo esc_attr( $btn_class ); ?>"
				        type="submit">
					<?php echo $options['button_content']; ?>
				</button>

			</form>

		<?php else : ?>

			<a class="<?php echo esc_attr( "{$options['base_class']} {$options['alt_class']}" ); ?>"
			   href="<?php echo esc_url( $options['alt_link'] ); ?>"
			   rel="nofollow">

				<?php if ( empty( $options['alt_content'] ) ) : ?>
					<span class="<?php echo esc_attr( $options['scrrdr_class'] ); ?>">
						<?php printf( esc_html( $options['alt_msg'] ), $label ); ?>
					</span>
				<?php else : ?>
					<?php echo $options['alt_content']; ?>
				<?php endif; ?>

			</a>

		<?php endif;

		return ob_get_clean();
	}
}
