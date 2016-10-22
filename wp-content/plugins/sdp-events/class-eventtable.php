<?php

class Mevent_EventTable extends Mlib_DBTable {


	/**
	 * Get a DateTime object
	 * from a given date string
	 * or timestamp
	 *
	 * @param $date
	 * @param $format string
	 *
	 * @return bool|string
	 */
	static function get_datetime_string( $date, $format = 'Y-m-d H:i:s' ) {
		$date = is_int( $date ) ? "@$date" : $date;

		if ( $datetime = new DateTime( $date ) ) {
			return $datetime->format( $format );
		}

		return false;
	}


	/**
	 * Set up the Event Meta table
	 *
	 */
	function __construct() {
		$eventmeta_columns = apply_filters( 'mevent_eventmeta_columns', array(
			array(
				'label'   => 'post_id',
				'type'    => 'MEDIUMINT(9)',
				'allowed' => 'NOT NULL UNIQUE'
			),
			array(
				'label'   => 'start_date',
				'type'    => 'TIMESTAMP',
				'default' => '0000-00-00 00:00:00',
				'allowed' => 'NOT NULL'
			),
			array(
				'label'   => 'end_date',
				'type'    => 'TIMESTAMP',
				'default' => '0000-00-00 00:00:00',
				'allowed' => 'NOT NULL'
			)
		) );

		parent::__construct( 'sdp_eventmeta', $eventmeta_columns );
	}


	/**
	 * Update an event meta row for
	 * a given post_id
	 *
	 * @param $post_id
	 * @param $row_data
	 * @param $format
	 *
	 * @return mixed
	 */
	function update( $post_id, $row_data, $format = null ) {
		return parent::_update( array(
			'post_id' => $post_id
		), $row_data, $format );
	}


	/**
	 * Construct the 'order by' query
	 *
	 * @param array|string|bool $order
	 *
	 * @return string
	 */
	function get_events_order_query( $order = array() ) {
		if ( false === $order ) {
			return '';
		}

		$orderby = isset( $order['by'] ) && ! empty( $order['by'] )
			? $order['by']
			: 'start_date';

		$orderdir = isset( $order['dir'] ) && ! empty( $order['dir'] )
			? $order['dir']
			: 'ASC';

		if ( is_string( $order ) ) {
			$orderdir = $order;
		}

		return "ORDER BY $orderby $orderdir";
	}


	/**
	 * Construct the extendable query
	 * for the events table
	 *
	 * @param string     $query_base
	 * @param array      $query_params
	 * @param array|bool $order
	 * @param bool       $suppress_filters
	 *
	 * @return string
	 */
	function get_query( $query_base, $query_params = array(), $order = array(), $suppress_filters = false ) {

		if ( ! $suppress_filters ) {
			$query_params = apply_filters( 'mevent_get_events_query_params', $query_params );
			$order        = apply_filters( 'mevent_get_events_order', $order );
		}

		$query[] = parent::_construct_query( $query_base, $query_params );

		$query[] = self::get_events_order_query( $order );

		return implode( ' ', $query );
	}


	/**
	 * Get the start date of the first
	 * event
	 *
	 * @return mixed
	 */
	function get_first_event_start_date() {
		/** @var $wpdb WPDB */
		global $wpdb;

		return $wpdb->get_var( $this->get_query(
			'SELECT MIN(start_date) as start_date',
			array(), array(), false
		) );
	}


	/**
	 * Get an array of the the
	 * number of
	 *
	 * @return array
	 */
	function get_event_counts_array() {
		/** @var $wpdb WPDB */
		global $wpdb;

		$event_dates = $wpdb->get_results( $this->get_query(
			'SELECT start_date, end_date'
		) );

		$counts = array();

		foreach ( $event_dates as $dates ) {
			$start_date = new DateTime( $dates->start_date );
			$end_date   = new DateTime( $dates->end_date );

			$end_date->add( new DateInterval( 'P1D' ) );

			$interval   = new DateInterval( 'P1M' );
			$period     = new DatePeriod( $start_date, $interval, $end_date );

			foreach ( $period as $date ) {
				/** @var $date DateTime */
				$year  = $date->format( 'Y' );
				$month = $date->format( 'm' );

				if ( ! isset( $counts[$year] ) ) {
					$counts[$year] = array();
				}

				if ( ! isset( $counts[$year][$month] ) ) {
					$counts[$year][$month] = 0;
				}

				$counts[$year][$month] += 1;
			}
		}

		return $counts;
	}



	/**
	 * Get the post ids of the events
	 * matching the given query
	 *
	 * @param $query_params
	 * @param $order
	 * @param $suppress_filters
	 *
	 * @return mixed
	 */
	function get_events( $query_params, $order = array(), $suppress_filters = false ) {
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
	 * Get the post ids of events
	 * ending before the given time
	 *
	 * @param $date
	 * @param $order string
	 *
	 * @return mixed
	 */
	function get_events_happening_before( $date, $order = 'DESC' ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		if ( $datetime = self::get_datetime_string( $date ) ) {
			return $this->get_events( array(
				$wpdb->prepare( 'start_date <= %s', $datetime )
			), $order );
		}

		return array();
	}


	/**
	 * Get the post ids of events
	 * ending after the given time
	 *
	 * @param $date
	 * @param $order string
	 *
	 * @return mixed
	 */
	function get_events_happening_after( $date, $order = 'ASC' ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		if ( $datetime = self::get_datetime_string( $date ) ) {
			return $this->get_events( array(
				$wpdb->prepare( 'end_date >= %s', $datetime )
			), $order );
		}

		return array();
	}


	/**
	 * Get events happening
	 * between date range
	 *
	 * @param string $start
	 * @param string $end
	 * @param string $order
	 *
	 * @return mixed
	 */
	function get_events_between( $start, $end, $order ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		return $this->get_events( array(
			$wpdb->prepare( '( start_date BETWEEN %s AND %s', $start, $end ),
			$wpdb->prepare( 'OR end_date BETWEEN %s AND %s )', $start, $end )
		), $order );
	}


	/**
	 * Get events happening in
	 * a specific year
	 *
	 * @param int    $year
	 * @param string $order
	 *
	 * @return mixed
	 */
	function get_events_for_year( $year, $order = 'DESC' ) {
		$start = "$year-01-01 00:00:00";
		$end   = "$year-12-31 23:59:59";

		return $this->get_events_between( $start, $end, $order );
	}


	/**
	 * Get events happening in
	 * a specific month
	 *
	 * @param int    $year
	 * @param int    $month
	 * @param string $order
	 *
	 * @return mixed
	 */
	function get_events_for_month( $year, $month, $order = 'DESC' ) {
		$start = "$year-$month-01 00:00:00";

		if ( $start_date = new DateTime( $start ) ) {
			$end = "$year-$month-{$start_date->format( 't' )} 23:59:59";

			return $this->get_events_between( $start, $end, $order );
		}

		return array();
	}



	/**
	 * Get events happening on
	 * a specific day
	 *
	 * @param int    $year
	 * @param int    $month
	 * @param int    $day
	 * @param string $order
	 *
	 * @return mixed
	 */
	function get_events_for_day( $year, $month, $day, $order = 'DESC' ) {
		$start = "$year-$month-$day 00:00:00";
		$end   = "$year-$month-$day 23:59:59";

		return $this->get_events_between( $start, $end, $order );
	}


	/**
	 * Delete an event from the
	 * events table
	 *
	 * @param $post_id
	 *
	 * @return mixed
	 */
	function delete_event_meta( $post_id ) {
		if ( ! current_user_can( 'delete_posts' ) ) {
			return false;
		}

		return parent::_delete( array( 'post_id' => $post_id ), '%d' );
	}
}