<?php



/**
 *
 */
class MSoc_Social_Feed_Controller {

	/**
	 * Register Ajax listeners
	 *
	 */
	function __construct() {
		// social feed query
		add_action( 'wp_ajax_social_feed', array( &$this, 'parse_social_feed' ) );
		add_action( 'wp_ajax_nopriv_social_feed', array( &$this, 'parse_social_feed' ) );
	}


	/**
	 * Normalize a facebook
	 * item
	 *
	 * @param $item
	 *
	 * @return array
	 */
	function parse_fb_item( $item ) {
		if ( ! $item->images[5]->source ) {
			return false;
		}

		return array(
			'src'      => $item->images[5]->source,
			'url'      => $item->link,
			'date'     => strtotime( $item->created_time ),
			'platform' => 'facebook'
		);
	}


	/**
	 * Normalize a Tweeter
	 * item
	 *
	 * @param $item
	 *
	 * @return array
	 */
	function parse_tw_item( $item ) {
		if ( ! $item->entities->media[0]->media_url ) {
			return false;
		}

		return array(
			'src'      => $item->entities->media[0]->media_url,
			'url'      => 'http://twitter.com/' . $item->user->screen_name . '/status/' . $item->id_str,
			'date'     => strtotime( $item->created_at ),
			'platform' => 'twitter'
		);
	}


	/**
	 * Normalize an Instagram
	 * item
	 *
	 * @param $item
	 *
	 * @return array
	 */
	function parse_ig_item( $item ) {
		if ( ! $item->images->standard_resolution->url ) {
			return false;
		}

		return array(
			'src'      => esc_url( $item->images->standard_resolution->url ),
			'url'      => esc_url( $item->link ),
			'date'     => $item->created_time,
			'platform' => 'instagram'
		);
	}


	/**
	 * "Zip-Merge" the given feeds
	 *
	 * @param array $feeds
	 * @param int   $limit
	 *
	 * @return array
	 */
	function get_zip_merged_feeds( $feeds, $limit = -1 ) {
		// Determine the maximum number of loops for the given feeds
		$loopLimit = array_reduce( array_values( $feeds ), function ( $prevMax, $feed ) {
			$feedCount = count( $feed );
			return $prevMax < $feedCount ? $feedCount : $prevMax;
		}, 0);

		$select_all = 0 > $limit;

		$i = 0;
		$merged_feeds = array();
		while ( ( $select_all || count( $merged_feeds ) < $limit ) && $i <= $loopLimit ) {
			foreach ( $feeds as $platform => $feed ) {
				if ( isset( $feed[ $i ] ) && ( $select_all || count( $merged_feeds ) < $limit ) ) {
					if ( $item = $this->{"parse_{$platform}_item"}( $feed[ $i ] ) ) {
						array_push( $merged_feeds, $item );
					}
				}
			}
			$i++;
		}

		return $merged_feeds;
	}



	/**
	 * Parse the social feed
	 *
	 */
	function parse_social_feed() {
		$feeds = array();

		$count = isset( $_GET['count'] ) && 0 < (int) $_GET['count']
			? intval( $_GET['count'] )
			: 8;

		$platforms = array( 'fb', 'ig', 'tw' );
		if ( isset( $_GET['platforms'] ) && is_array( $_GET['platforms'] ) ) {
			$platforms = array_intersect( $platforms, $_GET['platforms'] );
		}

		$transient_key = "msoc_social_feed_{$count}_" . implode( '-', $platforms );
		if ( false === ( $posts = get_transient( $transient_key ) ) ) {
			foreach ( $platforms as $platform ) {
				$feeds[ $platform ] = $this->{"get_{$platform}_feed"}();
			}

			$posts = self::get_zip_merged_feeds( $feeds, $count );

			set_transient( $transient_key, $posts, 1800 );
		}

		shuffle( $posts );

		wp_send_json_success( $posts );
	}



	/**
	 * Load data from Instagram
	 *
	 * @return mixed|string
	 */
	function get_ig_feed() {
		$ig_tag = 'crete';
		$ig_client = "423acd660dc0449ca96117bd55533e6e";
		$ig = "https://api.instagram.com/v1/tags/{$ig_tag}/media/recent?client_id={$ig_client}&count=9";

		return json_decode( self::get_curl( $ig ) )->data;
	}



	/**
	 * Load data from Facebook
	 *
	 * @return mixed
	 */
	function get_fb_feed() {
		$fb_id      = 'incrediblecrete';

		//App Info, needed for Auth
		$app_id     = "1412132259114705";
		$app_secret = "e4b65a173e0ab549aa7dc191f3ca6d67";

		//Retrieve auth token
		$authToken   = self::get_curl( "https://graph.facebook.com/oauth/access_token?grant_type=client_credentials&client_id={$app_id}&client_secret={$app_secret}" );
		$json_object = self::get_curl( "https://graph.facebook.com/{$fb_id}/photos/uploaded?{$authToken}" );

		return json_decode( $json_object )->data;
	}



	/**
	 * Load tweets using the
	 * codebird library
	 *
	 * @return mixed
	 */
	function get_tw_feed() {
		$tag = 'crete';

		require_once 'social/twitter/codebird.php';
		\Codebird\Codebird::setConsumerKey( 'Vrf7FuD4pGV1jVHx56MKW48R6', 'O8wY39Wi9HUK6IvM2yjfUIZIrHe0plyqURUEraPsmK649sdNbO' ); // static, see 'Using multiple Codebird instances'
		\Codebird\Codebird::setBearerToken( 'AAAAAAAAAAAAAAAAAAAAAK7qgAAAAAAAh%2BUWu%2Fs2DS3AaAjO3J%2Fg7NLU4Zg%3DGutBNlNnb1kfKgoWdMygW6gIZmUjHoOCrNI62eeoVGxQ1IgkqF' );

		/** @var $cb \Codebird\Codebird */
		$cb = \Codebird\Codebird::getInstance();

		return $cb->search_tweets( "q=%23{$tag}&src=typd&f=images", true )->statuses;
	}



	/**
	 * Get curl response
	 *
	 * @param $url
	 *
	 * @return mixed|string
	 */
	function get_curl( $url ) {
		if ( function_exists( 'curl_init' ) ) {

			$ch = curl_init();
			curl_setopt( $ch, CURLOPT_URL, $url );
			curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
			curl_setopt( $ch, CURLOPT_HEADER, 0 );
			curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0 );
			curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0 );
			$output = curl_exec( $ch );
			echo curl_error( $ch );
			curl_close( $ch );

			return $output;

		} else {
			return file_get_contents( $url );
		}
	}
}

