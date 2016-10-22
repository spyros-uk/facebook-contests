<?php



/**
 * Class Mlib_Rewrites
 *
 * Rewrite Rule Builder
 * helper class
 */
class Mlib_Rewrites {

	/**
	 * @var array
	 */
	var $date_rules = array(
		'year'  => array(
			'rule'  => "([0-9]{4})",
			'vars'  => array( 'year' )
		),
		'month' => array(
			'rule'  => "([0-9]{4})/([0-9]{1,2})",
			'vars'  => array( 'year', 'monthnum' )
		),
		'day'   => array(
			'rule'  => "([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})",
			'vars'  => array( 'year', 'monthnum', 'day' )
		)
	);


	/**
	 *
	 *
	 * @param $post_type
	 *
	 * @return array|bool
	 */
	static function get_post_type_rule( $post_type ) {
		$post_type_obj = get_post_type_object( $post_type );
		$slug_archive  = $post_type_obj->has_archive;

		if ( false === $slug_archive ) {
			return false;
		}

		if ( true === $slug_archive ) {
			$slug_archive = isset( $post_type_obj->rewrite['slug'] ) && $post_type_obj->rewrite['slug']
				? $post_type_obj->rewrite['slug']
				: $post_type;
		}

		return array(
			'rule'  => $slug_archive,
			'query' => "index.php?post_type={$post_type_obj->query_var}"
		);
	}


	/**
	 *
	 *
	 * @param $rule
	 * @param $query
	 */
	static function register_rule( $rule, $query ) {
		add_rewrite_rule( "$rule/?$", $query, 'top' );
	}


	/**
	 *
	 *
	 * @param $base_rule
	 * @param $base_query
	 * @param $options
	 */
	function register_date_rules( $base_rule, $base_query, $options = array() ) {
		$dates = $this->date_rules;
		if ( isset( $options['archives'] ) && is_array( $options['archives'] ) ) {
			$dates = array_intersect_key( $this->date_rules, array_flip( $options['archives'] ) );
		}

		foreach ( array_values( $dates ) as $date ) {
			$query = $base_query;
			$rule  = "{$base_rule}/{$date['rule']}";

			$i = isset( $options['matches_index'] ) && is_int( $options['matches_index'] )
				? $options['matches_index']
				: 1;

			foreach ( $date['vars'] as $var ) {
				$query .= "&{$var}=\$matches[$i]";
				$i++;
			}

			add_rewrite_rule( "$rule/?$", $query, 'top' );

			if ( isset( $options['feed'] ) && $options['feed'] ) {
				self::register_feed_rules( $rule, $query, $i );
			}

			if ( isset( $options['paged'] ) && $options['paged'] ) {
				self::register_pages_rules( $rule, $query, $i );
			}
		}
	}


	/**
	 *
	 *
	 * @param     $base_rule
	 * @param     $base_query
	 * @param int $i
	 */
	static function register_feed_rules( $base_rule, $base_query, $i = 1 ) {
		add_rewrite_rule( "$base_rule/feed/(feed|rdf|rss|rss2|atom)/?$", "$base_query&feed=\$matches[$i]", 'top' );
		add_rewrite_rule( "$base_rule/(feed|rdf|rss|rss2|atom)/?$", "$base_query&feed=\$matches[$i]", 'top' );
	}


	/**
	 *
	 *
	 * @param     $base_rule
	 * @param     $base_query
	 * @param int $i
	 */
	static function register_pages_rules( $base_rule, $base_query, $i = 1 ) {
		add_rewrite_rule( "$base_rule/page/([0-9]{1,})/?$", "$base_query&paged=\$matches[$i]", 'top' );
	}
}