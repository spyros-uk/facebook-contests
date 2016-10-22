<?php



/**
 * Class MLikes_LikesTable
 *
 */
class MLikes_LikesTable extends Mlib_DBTable {


	/**
	 * Get a better default select
	 * for likes queries
	 *
	 * @param $select
	 *
	 * @returns string
	 */
	protected static function get_parsed_select( $select = null ) {
		if ( empty( $select ) ) {
			$select = '
				content_type as type,
				content_id as id,
				content_meta as meta
			';
		}

		return parent::_get_parsed_select( $select );
	}


	/**
	 * Set up the Likes Meta table
	 *
	 */
	function __construct() {
		$likes_columns = apply_filters( 'mlikes_likes_columns', array(
			array(
				'label'   => 'user_id',
				'type'    => 'MEDIUMINT(9)',
				'allowed' => 'NOT NULL'
			),
			array(
				'label'   => 'content_type',
				'type'    => 'VARCHAR(20)',
				'allowed' => 'NOT NULL'
			),
			array(
				'label'   => 'content_id',
				'type'    => 'VARCHAR(255)',
				'allowed' => 'NOT NULL'
			),
			array(
				'label' => 'content_meta',
				'type'  => 'VARCHAR(255)'
			),
			array(
				'label'   => 'like_date',
				'type'    => 'TIMESTAMP',
				'allowed' => 'NOT NULL',
				'default' => array(
					'raw'   => true,
					'value' => 'CURRENT_TIMESTAMP',
				)
			)
		) );

		parent::__construct( 'sdp_likes', $likes_columns );
	}


	/**
	 * Construct the 'order by' query
	 *
	 * @param array|string|bool $order
	 *
	 * @return string
	 */
	function get_likes_order_query( $order = array() ) {
		if ( false === $order ) {
			return '';
		}

		$orderby = isset( $order['by'] ) && ! empty( $order['by'] )
			? $order['by']
			: 'like_date';

		$orderdir = isset( $order['dir'] ) && ! empty( $order['dir'] )
			? $order['dir']
			: 'DESC';

		if ( is_string( $order ) ) {
			$orderdir = $order;
		}

		return "ORDER BY $orderby $orderdir";
	}


	/**
	 * Construct the extendable query
	 * for the likes table
	 *
	 * @param string            $query_base
	 * @param array             $query_params
	 * @param array|string|bool $order
	 * @param bool              $suppress_filters
	 *
	 * @return string
	 */
	function get_query( $query_base = 'SELECT *', $query_params = array(), $order = array(), $suppress_filters = false ) {
		if ( ! $suppress_filters ) {
			$query_params = apply_filters( 'mlikes_get_likes_query_params', $query_params );
			$order        = apply_filters( 'mlikes_get_likes_order', $order );
		}

		$query[] = parent::_construct_query( $query_base, $query_params );

		$query[] = self::get_likes_order_query( $order );

		return implode( ' ', $query );
	}


	/**
	 * Parse content details into
	 * likes table query parameters
	 *
	 * @param array $content_details
	 *
	 * @return array
	 */
	function get_content_query_params( $content_details ) {
		$query_params = array();

		foreach ( $content_details as $detail => $value ) {
			array_push( $query_params, array(
				'key'   => "content_$detail",
				'value' => $value
			) );
		}

		return $query_params;
	}


	/**
	 * Get the likes for a given
	 * user
	 *
	 * @param int          $user_id
	 * @param array|string $select
	 * @param array|string $content
	 * @param array|string $order
	 *
	 * @return mixed
	 */
	function get_likes_for_user( $user_id = null, $select = null, $content = null, $order = 'ASC' ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		if ( empty( $user_id ) ) {
			$user_id = get_current_user_id();
		}

		$select = self::get_parsed_select( $select );

		$params = array(
			array(
				'key'   => 'user_id',
				'value' => $user_id
			)
		);

		if ( ! empty( $content ) ) {
			if ( is_array( $content ) ) {
				$params = array_merge( $params, self::get_content_query_params( $content ) );
			} else {
				if ( ! mlikes()->content->is_valid_type( $content ) ) {
					return array();
				}

				array_push( $params, array(
					'key'   => 'content_type',
					'value' => $content
				) );
			}
		}

		return $wpdb->get_results( $this->get_query( "SELECT $select", $params, $order ), ARRAY_A );
	}


	/**
	 * Get the likes for a given
	 * content
	 *
	 * @param array        $content_details
	 * @param array|string $select
	 * @param array|string $order
	 *
	 * @return mixed
	 */
	function get_likes_for_content( $content_details, $select = '*', $order = 'ASC' ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$select = self::get_parsed_select( $select );

		$query_params = self::get_content_query_params( $content_details );

		return $wpdb->get_results( $this->get_query( "SELECT $select", $query_params, $order ) );
	}


	/**
	 * Delete likes by user
	 *
	 * @param $user_id
	 *
	 * @return mixed
	 */
	function delete_likes_by_user( $user_id ) {
		return parent::_delete( array(
			'user_id' => $user_id
		), '%d' );
	}


	/**
	 * Delete likes by content
	 *
	 * @param array $content
	 *
	 * @return mixed
	 */
	function delete_likes_by_content( $content ) {
		return parent::_delete( array(
			'content_type' => $content['type'],
			'content_id'   => $content['id'],
			'content_meta' => $content['meta']
		), '%s' );
	}


	/**
	 * Delete a single like for the
	 * given user_id and content
	 *
	 * @param int   $user_id
	 * @param array $content
	 *
	 * @return mixed
	 */
	function delete_like( $user_id, $content ) {
		return parent::_delete( array(
			'user_id'      => $user_id,
			'content_type' => $content['type'],
			'content_id'   => $content['id'],
			'content_meta' => $content['meta']
		) );
	}


	/**
	 * Add a single like for the
	 * given user_id and content
	 *
	 * @param int   $user_id
	 * @param array $content
	 *
	 * @return mixed
	 */
	function add_like( $user_id, $content ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$extra_data = apply_filters( 'mlikes_add_like_extra_data', array() );
		$data       = array_merge( array(
			'user_id'      => $user_id,
			'content_type' => $content['type'],
			'content_id'   => $content['id'],
			'content_meta' => $content['meta']
		), $extra_data );

		if ( $wpdb->get_var( $this->get_query( 'SELECT *', $data ) ) ) {
			return new WP_Error( 'already-liked', 'Current content already liked by user' );
		}

		return parent::_update( $data );
	}
}