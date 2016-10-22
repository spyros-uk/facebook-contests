<?php



/**
 * Class MChimp_Mailchimp
 *
 */
class MChimp_Core {

	/**
	 * @var string
	 */
	private $email = '';

	/**
	 * @var array
	 */
	private $response = false;

	/**
	 * Hook into WordPress
	 */
	function __construct() {
		add_action( 'init', array( &$this, 'handle_submission' ) );

		add_action( 'wp_ajax_nopriv_subscribe_newsletter', array( &$this, 'handle_ajax_submission' ) );
		add_action( 'wp_ajax_subscribe_newsletter', array( &$this, 'handle_ajax_submission' ) );
	}


	/**
	 * Set the default unhandled
	 * response
	 *
	 */
	function set_default_response() {
		$this->response = array(
			'status' => 'error',
			'msg'    => __( 'An error occured with your submission. Please, try again', 'mailchimp' )
		);
	}


	/**
	 * Handle the signup form
	 * submission
	 *
	 */
	function handle_submission() {
		// if the request is an ajax call, do NOT run the init function
		if ( defined( 'DOING_AJAX' ) && DOING_AJAX ) {
			return;
		}

		if ( ! isset( $_POST['newsletter_nonce'] ) ) {
			return;
		}

		self::set_default_response();

		if ( ! wp_verify_nonce( $_POST['newsletter_nonce'], 'mailchimp_newsletter_signup' ) ) {
			return;
		}

		$response = $this->subscribe();

		if ( is_array( $response ) ) {
			$this->response = $response;
		}
	}


	/**
	 * Handle signup form ajax
	 * submission
	 *
	 */
	function handle_ajax_submission() {
		self::set_default_response();

		if ( ! check_ajax_referer( 'mailchimp_newsletter_signup', 'newsletter_nonce' ) ) {
			wp_die( json_encode( $this->get_response() ) );
		}

		$response = $this->subscribe();

		if ( is_array( $response ) ) {
			$this->response = $response;
		}

		wp_die( json_encode( $this->get_response() ) );
	}


	/**
	 * Subscribe to a mailchimp
	 * list
	 *
	 * @return array|int
	 */
	function subscribe() {
		$this->email = $_POST['newsletter_email'];

		$apiKey = get_field( 'mailchimp_api_key', 'options' );
		$listId = get_field( 'mailchimp_list_id', 'options' );

		if ( empty( $apiKey ) || empty( $listId ) ) {
			return $this->response; // return default error
		}

		if ( ! class_exists( 'Drewn\\MailChimp' ) ) {
			// same directory as store-address.php
			require_once( 'vendor/mailchimp-api/src/Drewm/MailChimp.php' );
		}

		// grab an API Key from http://admin.mailchimp.com/account/api/
		$MailChimp = new Drewm\MailChimp( $apiKey );

		return $MailChimp->call( 'lists/subscribe', array(
			'id'                => $listId,
			'email'             => array( 'email' => $this->email ),
			'double_optin'      => false,
			'update_existing'   => true,
			'replace_interests' => false,
			'send_welcome'      => false,
		) );
	}


	/**
	 * Return the ajax response
	 *
	 * @return array|bool
	 */
	function get_response() {
		if ( ! is_array( $this->response ) ) {
			return false;
		}

		if ( 'error' === $this->response['status'] ) {
			$response = array(
				'status' => 'error',
				'msg'    => isset( $this->response['error'] ) ? $this->response['error'] : $this->response['msg']
			);
		} else {
			$response = array(
				'status' => 'success',
				'msg'    => __( 'You are successfully registered', 'mailchimp' )
			);
		}

		return $response;
	}


	/**
	 * Get the email used in
	 * the form submission
	 *
	 * @return string
	 */
	function get_email() {
		return $this->email;
	}


	/**
	 * Get the status of the
	 * form submission
	 *
	 * @return string|bool
	 */
	function get_status() {
		return isset( $this->response['status'] ) ? $this->response['status'] : 'default';
	}
}