<?php



/**
 * Class MLikes_Liker
 *
 */
class MLikes_Liker {

	/**
	 * @var array
	 */
	var $user_likes = array();

	/**
	 * @var array
	 */
	var $content_likes = array();

	/**
	 * @var bool
	 */
	var $doing_ajax = false;


	/**
	 * Initialize Liker
	 */
	function __construct() {
		$this->doing_ajax = defined( 'DOING_AJAX' ) && DOING_AJAX;

		add_action( 'init', array( &$this, 'handle_user_like_action' ), 10 );

		add_action( 'wp_ajax_mlikes_liker_like', array( &$this, 'handle_user_like_action' ) );
		add_action( 'wp_ajax_nopriv_mlikes_liker_like', array( &$this, 'handle_user_like_action' ) );

		add_action( 'wp_ajax_mlikes_liker_unlike', array( &$this, 'handle_user_like_action' ) );
		add_action( 'wp_ajax_nopriv_mlikes_liker_unlike', array( &$this, 'handle_user_like_action' ) );
	}


	/**
	 * Handle a user trying
	 * to like or unlike a
	 * post
	 *
	 */
	function handle_user_like_action() {
		if ( ! isset( $_POST['action'] ) ) {
			return;
		}

		$action = false;
		if ( 'mlikes_liker_like' === $_POST['action'] ) {
			$action = 'like';
		} else if ( 'mlikes_liker_unlike' === $_POST['action'] ) {
			$action = 'unlike';
		}

		if ( ! $action ) {
			return;
		}

		if ( ! is_user_logged_in() ) {
			if ( $this->doing_ajax ) {
				wp_send_json_error( new WP_Error( 'not-logged-in',
					__( 'The user must be logged in to like content', 'mlikes' )
				) );
			} else {
				auth_redirect();
			}
		}

		$current_user = get_current_user_id();

		$type = $_POST['type'];
		$id   = $_POST['id'];
		$meta = $_POST['meta'];

		$content = mlikes()->content->get_content_details( $type, $id, $meta );

		$nonce_key = self::get_nonce_key( $content, $action );
		if ( ! isset( $_POST['_wpnonce'] ) || ! wp_verify_nonce( $_POST['_wpnonce'], $nonce_key ) ) {
			$error = new WP_Error( 'invalid-nonce', __( 'The nonce was invalid', 'mlikes' ) );
			if ( $this->doing_ajax ) {
				wp_send_json_error( $error );
			} else {
				wp_die( $error );
			}
		}

		$successful = 'like' === $action
			? self::like( $content, $current_user )
			: self::unlike( $content, $current_user );

		if ( ! $successful || is_wp_error( $successful ) ) {
			$error = is_wp_error( $successful )
				? $successful
				: new WP_Error( "$action-failed",
					sprintf( __( 'Sorry. The %s action failed for some reason.', 'mlikes' ), $action )
				);

			if ( $this->doing_ajax ) {
				wp_send_json_error( $error );
			} else {
				wp_die( $error );
			}
		}

		self::cache_current_user_likes();

		if ( $this->doing_ajax ) {
			$new_action = ( 'like' === $action ) ? 'unlike' : 'like';

			$data = array(
				'action'    => $action,
				'newAction' => $new_action,
				'newNonce'  => wp_create_nonce( self::get_nonce_key( $content, $new_action ) )
			);

			if ( isset( $_POST['getUserLikesCount'] ) && $_POST['getUserLikesCount'] ) {
				$data['userLikesCount'] = self::count_user_likes();
			}

			if ( isset( $_POST['getContentLikesCount'] ) && $_POST['getContentLikesCount'] ) {
				$data['contentLikesCount'] = self::count_content_likes( $content );
			}

			wp_send_json_success( apply_filters( 'mlikes_liker_success_response', $data, $content ) );
		}
	}


	/**
	 * Return the nonce field key
	 * for the liker actions
	 *
	 * @param $content_details
	 * @param $action
	 *
	 * @return string
	 */
	function get_nonce_key( $content_details, $action ) {
		return 'mlikes_liker_' . md5( implode( '', array(
			$content_details['type'],
			$content_details['id'],
			$content_details['meta'],
			$action
		) ) );
	}


	/**
	 * Return the cached likes for a
	 * given user
	 *
	 * @param int $user_id
	 *
	 * @return array
	 */
	function get_user_likes( $user_id = null ) {
		if ( empty( $user_id ) ) {
			$user_id = get_current_user_id();
		}

		if ( ! isset( $this->user_likes[ $user_id ] ) ) {
			self::cache_user_likes( $user_id );
		}

		return $this->user_likes[ $user_id ];
	}


	/**
	 * Determine if a given user
	 * has already liked a given
	 * content
	 *
	 * @param $user_id
	 * @param $content_details
	 *
	 * @return bool
	 */
	function like_exists( $user_id, $content_details ) {
		return in_array( $content_details, self::get_user_likes( $user_id ) );
	}


	/**
	 * Return the count of how many
	 * likes a given user has
	 *
	 * @param int $user_id
	 *
	 * @return int
	 */
	function count_user_likes( $user_id = null ) {
		return count( (array) self::get_user_likes( $user_id ) );
	}


	/**
	 * Return the count of how many
	 * likes a given piece of
	 * content has
	 *
	 * @param array $content
	 *
	 * @return int
	 */
	function count_content_likes( $content = null ) {
		$content = self::process_content_param( $content );
		if ( is_wp_error( $content ) ) {
			return $content;
		}

		$content_hash = mlikes()->content->get_hash( $content );

		if ( ! isset( $this->content_likes[ $content_hash ] ) ) {
			self::cache_content_likes( $content );
		}

		return count( $this->content_likes[ $content_hash ] );
	}


	/**
	 * Cache the current user's
	 * likes to be able to quickly
	 * compare against them
	 *
	 */
	function cache_current_user_likes() {
		self::cache_user_likes( get_current_user_id() );
	}


	/**
	 * Cache a given user's likes
	 * to be able to quickly compare
	 * against them
	 *
	 * @param $user_id
	 *
	 * @returns array
	 */
	function cache_user_likes( $user_id ) {
		return $this->user_likes[ $user_id ] = mlikes()->db->get_likes_for_user( $user_id );
	}


	/**
	 * Cache a given content's likes
	 * to be able to quickly compare
	 * against them
	 *
	 * @param array $content
	 *
	 * @returns array|WP_Error
	 */
	function cache_content_likes( $content = null ) {
		$content = $this->process_content_param( $content );
		if ( is_wp_error( $content ) ) {
			return $content;
		}

		$content_hash = mlikes()->content->get_hash( $content );

		return $this->content_likes[ $content_hash ] = mlikes()->db->get_likes_for_content( $content );
	}


	/**
	 * Process the given user param
	 *
	 * @param int|null $user_id
	 *
	 * @return int|WP_Error
	 */
	private function process_user_param( $user_id = null ) {
		if ( ! is_user_logged_in() ) {
			return new WP_Error( 'not-logged-in', 'User must be logged in to perform this action.' );
		}

		$current_user_id = get_current_user_id();

		if ( ! $user_id ) {
			$user_id = $current_user_id;
		}

		if ( $current_user_id !== $user_id && ! current_user_can_for_blog( get_current_blog_id(), 'edit_users' ) ) {
			return new WP_Error( 'sneaky', 'You are not authorized to perform this action on behalf of other users.' );
		}

		return $user_id;
	}


	/**
	 * Process the given content params
	 *
	 * @param bool|array $content
	 *
	 * @return array|WP_Error
	 */
	private function process_content_param( $content = false ) {
		if ( ! $content && mlikes()->content->is_valid ) {
			$content = mlikes()->content->get_current();
		}

		if ( ! mlikes()->content->is_valid_content( $content ) ) {
			return new WP_Error( 'invalid-content', 'This content is not recognized or blocked.' );
		}

		return mlikes()->content->get_content_details( $content['type'], $content['id'], $content['meta'] );
	}


	/**
	 * Validate the given content
	 * and user params given to
	 * like functions
	 *
	 * @param null|array $content_details
	 * @param null|int   $user_id
	 *
	 * @return array|WP_Error
	 */
	private function process_like_params( $content_details = null, $user_id = null ) {
		$user_id = self::process_user_param( $user_id );
		if ( is_wp_error( $user_id ) ) {
			return $user_id;
		}

		$content = self::process_content_param( $content_details );
		if ( is_wp_error( $content ) ) {
			return $content;
		}

		return array( $user_id, $content );
	}


	/**
	 * Do the like action on a piece
	 * of content
	 *
	 * @param null|array $content_details
	 * @param null|int   $user_id
	 *
	 * @return array|mixed|WP_Error
	 */
	function like( $content_details = null, $user_id = null ) {
		$like_params = self::process_like_params( $content_details, $user_id );

		if ( is_wp_error( $like_params ) ) {
			return $like_params;
		}

		list( $user_id, $content_details ) = $like_params;

		return mlikes()->db->add_like( $user_id, $content_details );
	}


	/**
	 * Remove a like for a specific
	 * content and user
	 *
	 * @param null|array $content_details
	 * @param null|int   $user_id
	 *
	 * @return array|mixed|WP_Error
	 */
	function unlike( $content_details = null, $user_id = null ) {
		$like_params = self::process_like_params( $content_details, $user_id );

		if ( is_wp_error( $like_params ) ) {
			return $like_params;
		}

		list( $user_id, $content_details ) = $like_params;

		return mlikes()->db->delete_like( $user_id, $content_details );
	}
}
