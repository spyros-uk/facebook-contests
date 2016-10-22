<?php



/**
 * Class Mlib_DBTable
 *
 *
 */
class Mlib_DBTable {

	/**
	 * @var string
	 */
	var $table_name;

	/**
	 * @var array
	 */
	var $columns = array();


	/**
	 * Get a safe select statement
	 * to be used with db query
	 * functions
	 *
	 * @param $select
	 *
	 * @return string
	 */
	protected static function _get_parsed_select( $select = null ) {
		if ( is_array( $select ) ) {
			return implode( ', ', $select );
		}
		if ( ! is_string( $select ) || empty( $select ) ) {
			return '*';
		}

		return $select;
	}


	/**
	 * DB Table constructor
	 *
	 * @param string $table_name
	 * @param array  $columns
	 */
	function __construct( $table_name, $columns = array() ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$this->table_name = "{$wpdb->prefix}$table_name";

		$this->columns = $columns;
	}


	/**
	 * Try and create the defined
	 * table in the WordPress
	 * Database
	 *
	 * @return array|WP_Error
	 */
	function create() {
		/** @var $wpdb WPDB */
		global $wpdb;

		if ( empty( $this->columns ) ) {
			return new WP_Error( 'Cannot have a table without columns!' );
		}

		if ( $this->table_exists() ) {
			return new WP_Error( 'table-exists', "Table \"$this->table_name\" already exists!" );
		}

		$charset_collate = $wpdb->get_charset_collate();

		// begin create query
		$create_query   = array();
		$create_query[] = "CREATE TABLE '{$this->table_name}' (\n id mediumint(9) NOT NULL AUTO_INCREMENT,\n";

		// set columns
		foreach ( $this->columns as $col ) {
			$create_query[] = "'{$col['label']}' {$col['type']}";

			if ( isset( $col['default'] ) && ! empty( $col['default'] ) ) {
				if ( is_array( $col['default'] ) ) {
					if ( isset( $col['default']['raw'] ) && isset( $col['default']['value'] ) && true === $col['default']['raw'] ) {
						$create_query[] = "DEFAULT {$col['default']['value']}";
					} else {
						return new WP_Error( 'invalid-default', 'Invalid default value for column', array( $this->columns ) );
					}
				} else if ( is_string( $col['default'] ) ) {
					$create_query[] = $wpdb->prepare( 'DEFAULT %s', $col['default'] );
				} else {
					return new WP_Error( 'invalid-default', 'Invalid default value for column', array( $this->columns ) );
				}
			}

			if ( isset( $col['allowed'] ) && ! empty( $col['allowed'] ) ) {
				$create_query[] = $col['allowed'];
			}

			$create_query[] = ",\n";
		}

		// end create query
		$create_query[] = "UNIQUE KEY id (id)\n ) $charset_collate;";

		$create_query = implode( ' ', $create_query );

		require_once(ABSPATH . 'wp-admin/includes/upgrade.php');

		return dbDelta( $create_query );
	}


	/**
	 * Delete the db table we
	 * created
	 *
	 * @return WP_Error|bool
	 */
	function destroy() {
		/** @var $wpdb WPDB */
		global $wpdb;

		if ( ! $this->table_exists() ) {
			return new WP_Error( "Cannot destroy table. Table \"{$this->table_name}\" doesn't exist!" );
		}

		return $wpdb->query( $wpdb->prepare(
			'DROP TABLE IF EXISTS %s', $this->table_name
		) );
	}


	/**
	 * Check if a table with the
	 * given name exists
	 * in the database
	 *
	 * @return bool
	 */
	function table_exists() {
		/** @var $wpdb WPDB */
		global $wpdb;

		return ( $this->table_name === $wpdb->get_var( $wpdb->prepare(
			'SHOW TABLES LIKE %s', $this->table_name
		) ) );
	}


	/**
	 * Construct the query
	 * for the table
	 *
	 * @param string $query_base
	 * @param array  $query_params
	 *
	 * @return string
	 */
	function _construct_query( $query_base = 'SELECT *', $query_params = array() ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		$query[] = $query_base;

		$query[] = "FROM {$this->table_name}";

		if ( ! empty( $query_params ) ) {
			$query[] = 'WHERE';
		}

		$i = 0;
		foreach ( $query_params as $key => $param ) {
			if ( is_string( $key ) ) {
				$param = array(
					'key'   => $key,
					'value' => $param
				);
			}

			if ( is_string( $param ) ) {
				$query[] = $param;

			} else if (	is_array( $param ) && isset( $param['key'] ) && isset( $param['value'] ) ) {
				$rel = ( isset( $param['rel'] ) && ! empty( $param['rel'] ) )
					? $param['rel']
					: 'AND';

				if ( 0 === $i ) {
					$rel = '';
				}

				$comparator = ( isset( $param['comparator'] ) && ! empty( $param['comparator'] ) )
					? $param['comparator']
					: '=';

				$query[] = $wpdb->prepare( "$rel `{$param['key']}` $comparator %s", $param['value'] );
			}

			$i++;
		}

		return implode( ' ', $query );
	}


	/**
	 * Update or Insert one or more
	 * rows in the the table
	 *
	 * @param array             $where
	 * @param array             $row_data
	 * @param array|string|null $format
	 *
	 * @return mixed
	 */
	function _update( $where, $row_data = array(), $format = null ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		return $wpdb->replace(
			$this->table_name,
			array_merge( $where, $row_data ),
			$format
		);
	}


	/**
	 * Remove a row from the
	 * table
	 *
	 * @param array             $where
	 * @param array|string|null $where_format
	 *
	 * @return mixed
	 */
	function _delete( $where, $where_format = null ) {
		/** @var $wpdb WPDB */
		global $wpdb;

		return $wpdb->delete( $this->table_name, $where, $where_format );
	}
}
