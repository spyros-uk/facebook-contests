<?php



/**
 * Class MLikes_Content
 *
 */
class MLikes_Content {

	/**
	 * @var array
	 */
	var $INVALID_CONTENTS = array();

	/**
	 * @var array
	 */
	var $VALID_CONTENT_TYPES = array(
		'singular',
		'pt_archive',
		'term'
	);

	/**
	 * @var bool|array
	 */
	var $content_details = false;

	/**
	 * @var bool
	 */
	var $is_valid = false;


	/**
	 * Get gathered details
	 * for the current content
	 *
	 * @param null $field
	 *
	 * @return array|bool
	 */
	function get_current( $field = null ) {
		if ( empty( $field ) ) {
			return $this->content_details;
		}

		if ( isset( $this->content_details[ $field ] ) ) {
			return $this->content_details[ $field ];
		}

		return false;
	}


	/**
	 * Get a hash of the content
	 * details to quickly identify
	 * it
	 *
	 * @param array $content_details
	 *
	 * @return string
	 */
	function get_hash( $content_details ) {
		return md5( implode( '', array(
			$content_details['type'],
			$content_details['id'],
			$content_details['meta']
		) ) );
	}


	/**
	 * Hook into WordPress
	 *
	 */
	function __construct() {
		add_action( 'init', array( &$this, 'set_invalid_contents' ) );

		if ( ! is_admin() ) {
			add_action( 'wp', array( &$this, 'set_current_content_details' ) );
		}
	}


	/**
	 * Set any contents that are not
	 * like-able
	 *
	 */
	function set_invalid_contents() {
		if ( $likes_page = mlikes()->admin->get_likes_page() ) {
			array_push( $this->INVALID_CONTENTS, self::get_singular_details( $likes_page ) );
		}
	}


	/**
	 * Set content details about the
	 * current route
	 *
	 */
	function set_current_content_details() {
		$content = self::gather_current_content_details();

		if ( $content ) {
			$this->content_details = $content;
			$this->is_valid        = true;
		}
	}


	/**
	 * Gather content details about
	 * the current context
	 *
	 */
	function gather_current_content_details() {
		$type = $id = $meta = false;

		if ( is_singular() ) {
			$type = 'singular';
			$id   = get_the_ID();
			$meta = get_post_type( $id );

		} else if ( is_post_type_archive() ) {
			/** @var $wp_query WP_Query */
			global $wp_query;

			$post_type     = $wp_query->query['post_type'];
			$post_type_obj = get_post_type_object( $post_type );

			if ( ! is_array( $post_type ) && $post_type_obj->has_archive ) {
				$type = 'pt_archive';
				$id   = $post_type;
			}

		} else if ( is_archive() ) {
			$queried_object = get_queried_object();

			$type = 'term';
			$id   = $queried_object->term_id;
			$meta = $queried_object->taxonomy;
		}

		if ( ! $type || ! $id ) {
			return false;
		}

		return self::get_content_details( $type, $id, $meta );
	}


	/**
	 * Return a correct content
	 * identification array
	 *
	 * @param $type
	 * @param $id
	 * @param $meta
	 *
	 * @return array
	 */
	function get_content_details( $type = null, $id = null, $meta = null ) {
		return apply_filters( 'mlikes_content_details', array(
			'type' => $type,
			'id'   => $id,
			'meta' => $meta
		) );
	}


	/**
	 * Determine whether a given
	 * content is valid
	 *
	 * @param array $content_details
	 *
	 * @return bool
	 */
	function is_valid_content( $content_details ) {
		if ( ! is_array( $content_details ) ) {
			return false;
		}

		if ( ! self::is_valid_type( $content_details['type'] ) ) {
			return false;
		}

		if ( ! self::is_valid_id( $content_details['id'] ) ) {
			return false;
		}

		if ( ! self::is_valid_meta( $content_details['type'], $content_details['meta'] ) ) {
			return false;
		}

		if ( in_array( $content_details, $this->INVALID_CONTENTS ) ) {
			return false;
		}

		return true;
	}


	/**
	 * Determine whether a given
	 * content type is valid
	 *
	 * @param $content_type
	 *
	 * @return bool
	 */
	function is_valid_type( $content_type ) {
		return in_array( $content_type, $this->VALID_CONTENT_TYPES );
	}


	/**
	 * Determine whether a given
	 * content id is valid
	 *
	 * @param $content_id
	 *
	 * @return bool
	 */
	function is_valid_id( $content_id ) {
		return is_string( $content_id ) || is_int( $content_id );
	}


	/**
	 * Determine whether a given
	 * content meta is valid
	 *
	 * @param $content_type
	 * @param $content_meta
	 *
	 * @return bool
	 */
	function is_valid_meta( $content_type, $content_meta ) {
		if ( ! in_array( $content_type, array( 'singular', 'term' ) ) ) {
			return true;
		}

		$valid_meta = array();

		if ( 'singular' === $content_type ) {
			$valid_meta = get_post_types( array( 'public' => true ) );
		}

		if ( 'term' === $content_type ) {
			$valid_meta = get_taxonomies( array( 'public' => true ) );
		}

		return in_array( $content_meta, array_values( $valid_meta ) );
	}


	/**
	 * Return the content type
	 * and id of a given post
	 *
	 * @param int|object $post
	 *
	 * @return array|WP_Error
	 */
	function get_singular_details( $post = 0 ) {
		if ( ! ( $post = get_post( $post ) ) ) {
			return new WP_Error( 'not-post', 'Given parameter is not a post' );
		}

		return self::get_content_details( 'singular', $post->ID, $post->post_type );
	}


	/**
	 * Return the content type
	 * and id of a given term
	 *
	 * @param int|object $term
	 * @param string     $taxonomy
	 *
	 * @return array|WP_Error
	 */
	function get_term_details( $term, $taxonomy ) {
		if ( ! ( $term = get_term( $term, $taxonomy ) ) ) {
			return new WP_Error( 'not-term', 'Given parameter is not a term' );
		}

		return self::get_content_details( 'term', $term->term_id, $term->taxonomy );
	}


	/**
	 * Return likes grouped
	 * by content type
	 *
	 * @param $contents
	 *
	 * @return array
	 */
	function group_content_by_type( $contents ) {
		$grouped_contents = array();

		foreach ( $contents as $key => $content ) {
			$grouped_contents[ $content['type'] ][ $key ] = $content;
		}

		return $grouped_contents;
	}


	/**
	 * Get the normalized content data
	 * for the given contents
	 *
	 * @param array $contents
	 *
	 * @return array
	 */
	function get_content_data( $contents ) {
		$content_data = array();

		foreach ( self::group_content_by_type( $contents ) as $content_type => $content_details ) {
			$data_method = "get_{$content_type}_data";
			if ( method_exists( $this, $data_method ) ) {
				$content_data = array_merge( $content_data, call_user_func( array( &$this, $data_method ), $content_details ) );
			}
		}

		return $content_data;
	}


	/**
	 * Return a normalized array
	 * of data
	 *
	 * @param array  $details
	 * @param string $title
	 * @param string $excerpt
	 * @param string $permalink
	 * @param object $all_data
	 *
	 * @return mixed|void
	 */
	function normal_content_data( $details, $title, $excerpt, $permalink, $all_data ) {
		return apply_filters( 'mlikes_normal_content_data', array(
			'details'   => $details,
			'title'     => $title,
			'excerpt'   => wp_trim_words( $excerpt ),
			'permalink' => $permalink,
			'raw'       => $all_data
		) );
	}


	/**
	 * Get normalized data for
	 * Posts
	 *
	 * @param array $content_details
	 *
	 * @return array
	 */
	function get_singular_data( $content_details ) {
		$posts = get_posts( array(
			'posts_per_page'   => - 1,
			'post_type'        => array_values( get_post_types( array( 'public' => true ) ) ),
			'post_status'      => array( 'publish', 'archive-only' ),
			'post__in'         => wp_list_pluck( $content_details, 'id' ),
			'orderby'          => 'post__in',
			'suppress_filters' => false
		) );

		$contents = array();
		foreach ( $posts as $post ) {
			/** @var $post WP_Post */

			$excerpt = empty( $post->post_excerpt )
				? $post->post_content
				: $post->post_excerpt;

			$contents[] = self::normal_content_data(
				self::get_singular_details( $post ),
				$post->post_title,
				$excerpt,
				get_permalink( $post->ID ),
				$post
			);
		}

		return $contents;
	}


	/**
	 * Get normalized data for
	 * Taxonomy Terms
	 *
	 * @param array $content_details
	 *
	 * @return array
	 */
	function get_term_data( $content_details ) {
		$taxonomies = wp_list_pluck( $content_details, 'meta' );
		$term_ids   = wp_list_pluck( $content_details, 'id' );

		$terms = get_terms( $taxonomies, array(
			'include' => $term_ids,
			'orderby' => 'include'
		) );

		$contents = array();
		foreach ( $terms as $term ) {
			$contents[] = self::normal_content_data(
				self::get_term_details( $term, $term->taxonomy ),
				$term->name,
				$term->description,
				get_term_link( $term ),
				$term
			);
		}

		return $contents;
	}


	/**
	 * Get normalized data for
	 * Post Type Archives
	 *
	 * @param array $content_details
	 *
	 * @return array
	 */
	function get_pt_archive_data( $content_details ) {
		$contents = array();
		foreach ( $content_details as $details ) {
			$post_type     = $details['id'];
			$post_type_obj = get_post_type_object( $post_type );

			$contents[] = self::normal_content_data(
				self::get_content_details( $details['type'], $post_type ),
				$post_type_obj->label,
				$post_type_obj->description,
				get_post_type_archive_link( $post_type ),
				$post_type_obj
			);
		}

		return $contents;
	}


	/**
	 * Get a label for
	 * the given content
	 *
	 * @param $content_details
	 *
	 * @return mixed
	 */
	function get_content_label( $content_details ) {
		switch ( $content_details['type'] ) {
			case 'term':
				return get_term( $content_details['id'], $content_details['meta'] )->name;
			case 'singular':
				return get_the_title( $content_details['id'] );
			case 'pt_archive':
				return apply_filters( 'post_type_archive_title', get_post_type_object( $content_details['id'] )->labels->name, $content_details['id'] );
		}

		return '';
	}
}