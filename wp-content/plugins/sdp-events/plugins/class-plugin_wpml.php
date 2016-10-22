<?php



/**
 * Class Mevent_WPML
 *
 * WPML Plugin for Moz Events
 *
 * @extends Mevent_Plugin
 */
class Mevent_Plugin_WPML {

	/**
	 * Register Mevent Plugin
	 * hooks
	 */
	function __construct() {
		add_filter( 'mevent_eventmeta_columns', array( &$this, 'edit_eventmeta_columns' ) );

		add_filter( 'mevent_eventmeta_save', array( &$this, 'edit_eventmeta_saved' ), 10, 2 );

		add_filter( 'mevent_get_events_query_params', array( &$this, 'edit_eventmeta_query' ) );
	}


	/**
	 * Add lang code column to the
	 * eventmeta table
	 *
	 * @param $columns
	 *
	 * @return array
	 */
	function edit_eventmeta_columns( $columns ) {
		array_push( $columns, array(
			'label'   => 'lang_code',
			'type'    => 'VARCHAR(7)',
			'allowed' => 'NOT NULL'
		) );

		return $columns;
	}



	/**
	 * Save lang code to the database
	 *
	 * @param array $event_meta
	 * @param int   $post_id
	 *
	 * @returns array
	 */
	function edit_eventmeta_saved( $event_meta, $post_id ) {
		$event_meta['lang_code'] = icl_get_current_language();

		return $event_meta;
	}


	/**
	 * Add lang code query to the
	 * query params
	 *
	 * @param $query_params
	 *
	 * @return array
	 */
	function edit_eventmeta_query( $query_params ) {
		array_push( $query_params, array(
			'key'   => 'lang_code',
			'value' => icl_get_current_language()
		) );

		return $query_params;
	}
}