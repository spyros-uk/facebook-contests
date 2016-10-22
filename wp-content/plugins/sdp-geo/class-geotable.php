<?php


/**
 * Class MLikes_LikesTable
 *
 */
class Mloc_GeoTable extends Mlib_DBTable {


	/**
	 * Set up the Likes Meta table
	 *
	 */
	function __construct() {
		$likes_columns = apply_filters( 'mloc_likes_columns', array(
			array(
				'label'   => 'post_id',
			  'type'    => 'MEDIUMINT(9)',
				'allowed' => 'NOT NULL UNIQUE'
			),
			array(
				'label'   => 'lat',
				'type'    => 'DECIMAL(9,6)',
				'allowed' => 'NOT NULL'
			),
			array(
				'label'   => 'lng',
			  'type'    => 'DECIMAL(9,6)',
				'allowed' => 'NOT NULL'
			),
			array(
				'label'   => 'time',
				'type'    => 'TIMESTAMP',
				'allowed' => 'NOT NULL',
				'default' => array(
					'raw'     => true,
					'value'   => 'CURRENT_TIMESTAMP',
				)
			)
		) );

		parent::__construct( 'sdp_geo', $likes_columns );
	}


	/**
	 * Construct the 'order by' query
	 *
	 * @param array|string|bool $order
	 *
	 * @return string
	 */
	function get_order_query( $order = array() ) {
		if ( false === $order ) {
			return '';
		}

		$orderby = isset( $order['by'] ) && ! empty( $order['by'] )
			? $order['by']
			: 'time';

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
	 * for the geo table
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
			$query_params = apply_filters( 'mloc_get_likes_query_params', $query_params );
			$order        = apply_filters( 'mloc_get_likes_order', $order );
		}

		$query[] = parent::_construct_query( $query_base, $query_params );

		$query[] = self::get_order_query( $order );

		return implode( ' ', $query );
	}


	/**
	 * Get all location data
	 *
	 * @param array             $query_params
	 * @param array|string|bool $order
	 * @param bool              $suppress_filters
	 *
	 * @return mixed
	 */
	function get_locations( $query_params = array(), $order = array(), $suppress_filters = false ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$query = $this->get_query(
			'SELECT post_id',
			$query_params,
			$order,
			$suppress_filters
		);

		return $wpdb->get_col( $query );
	}


	/**
	 * Get locations within the
	 * given radius of the center
	 * point
	 *
	 * @param array     $location lat,lng pair
	 * @param int|float $radius   kilometers
	 * @param int}false $limit
	 * @param string    $order
	 *
	 * @return mixed
	 */
	function get_within_radius( $location, $radius = 100, $limit = -1, $order = 'ASC' ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$earth_radius = 6371.009; // km

		$limit_string = ( 0 <= $limit )	? $wpdb->prepare( 'LIMIT %d', $limit ) : '';
		return $wpdb->get_results( $wpdb->prepare(
			'SELECT *, (
	      %1$f * acos (
		      cos ( radians( %2$f ) )
		      * cos( radians( lat ) )
		      * cos( radians( lng ) - radians( %3$f ) )
		      + sin ( radians( %2$f ) )
		      * sin( radians( lat ) )
	      )
      ) as distance
      FROM %4$s
      HAVING distance < %5$f
      ORDER BY distance %6$s
    ' . $limit_string, array(
			$earth_radius,
			$location['lat'],
			$location['lng'],
			$this->table_name,
			$radius,
			$order
		) ) );
	}


	/**
	 * Add a single location for
	 * the given post id
	 *
	 * @param int   $post_id
	 * @param array $location lat,lng pair
	 *
	 * @return mixed
	 */
	function add_location( $post_id, $location ) {
		$data = apply_filters( 'mloc_add_location_data', array(
			'post_id' => $post_id,
			'lat'     => $location['lat'],
			'lng'     => $location['lng']
		) );

		return parent::_update( $data );
	}


	/**
	 * Delete the geo meta for
	 * the given post id
	 *
	 * @param $post_id
	 *
	 * @return mixed
	 */
	function delete_location( $post_id ) {
		return parent::_delete( array( 'post_id' => $post_id ), '%d' );
	}
}