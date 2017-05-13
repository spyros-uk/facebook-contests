<?php
/**
 * Theme Functions &
 * Functionality
 *
 */


/* =========================================
		ACTION HOOKS & FILTERS
   ========================================= */

/**--- Actions ---**/

add_action( 'after_setup_theme',  'theme_setup' );

add_action( 'wp_enqueue_scripts', 'theme_styles' );

add_action( 'wp_enqueue_scripts', 'theme_scripts' );

add_action( 'login_enqueue_scripts', 'admin_css' ); // Adds custom css to admin page

add_filter( 'login_headerurl', 'login_logo_url' ); // Add custom logo title

add_filter( 'login_headertitle', 'login_logo_url_title' ); // Add custom logo title

// expose php variables to js. just uncomment line
// below and see function theme_scripts_localize
// add_action( 'wp_enqueue_scripts', 'theme_scripts_localize', 20 );

/**--- Filters ---**/



/* =========================================
		HOOKED Functions
   ========================================= */

/**--- Actions ---**/


/**
 * Setup the theme
 *
 * @since 1.0
 */
if ( ! function_exists( 'theme_setup' ) ) {
	function theme_setup() {

		// Let wp know we want to use html5 for content
		add_theme_support( 'html5', array(
			'comment-list',
			'comment-form',
			'search-form',
			'gallery',
			'caption'
		) );


		// Let wp know we want to use post thumbnails
		add_theme_support( 'post-thumbnails' );

        // Add Custom Logo Support.
		/*
		add_theme_support( 'custom-logo', array(
			'width'       => 181, // Example Width Size
			'height'      => 42,  // Example Height Size
			'flex-width'  => true,
		) );
		*/

		// Register navigation menus for theme

		register_nav_menus( array(
			'primary' => 'Main Menu',
			'footer'  => 'Footer Menu'
		) );



		// Let wp know we are going to handle styling galleries
		/*
		add_filter( 'use_default_gallery_style', '__return_false' );
		*/


		// Stop WP from printing emoji service on the front
		remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
		remove_action( 'wp_print_styles', 'print_emoji_styles' );


		// Remove toolbar for all users in front end
		show_admin_bar( false );


		// Add Custom Image Sizes
		/*
		add_image_size( 'ExampleImageSize', 1200, 450, true ); // Example Image Size
		...
		*/


		// WPML configuration
		// disable plugin from printing styles and js
		// we are going to handle all that ourselves.
		if ( ! is_admin() ) {
			define( 'ICL_DONT_LOAD_NAVIGATION_CSS', true );
			define( 'ICL_DONT_LOAD_LANGUAGE_SELECTOR_CSS', true );
			define( 'ICL_DONT_LOAD_LANGUAGES_JS', true );
		}


		// Contact Form 7 Configuration needs to be done
		// in wp-config.php. add the following snippet
		// under the line:
		// define( 'WP_DEBUG', false );
		/*
		//Contact Form 7 Plugin Configuration
		define ( 'WPCF7_LOAD_JS',  false ); // Added to disable JS loading
		define ( 'WPCF7_LOAD_CSS', false ); // Added to disable CSS loading
		define ( 'WPCF7_AUTOP',    false ); // Added to disable adding <p> & <br> in form output
		*/


		// Sets defau;ts time zone
        date_default_timezone_set('Europe/Athens');

		// Register Autoloaders Loader
		$theme_dir = get_template_directory();
		include "$theme_dir/library/library-loader.php";
		include "$theme_dir/includes/includes-loader.php";
		include "$theme_dir/components/components-loader.php";
	}
}


/**
 * Register and/or Enqueue
 * Styles for the theme
 *
 * @since 1.0
 */
if ( ! function_exists( 'theme_styles' ) ) {
	function theme_styles() {
		$theme_dir = get_stylesheet_directory_uri();

		wp_enqueue_style( 'main', "$theme_dir/assets/css/main.css", array(), null, 'all' );
	}
}

/**
 * Sets logo url
 *
 * @since 1.0
 */
if ( ! function_exists( 'login_logo_url' ) ) {
    function login_logo_url() {
        return home_url();
    }
}


/**
 * Sets logo
 * url title
 *
 * @since 1.0
 */
if ( ! function_exists( 'login_logo_url_title' ) ) {
    function login_logo_url_title() {
        return get_bloginfo('name');
    }
}

/**
 * Register and/or Enqueue
 * Styles for the admin page
 *
 * @since 1.0
 */
if ( ! function_exists( 'admin_css' ) ) {
	function admin_css() { ?>

        <style type="text/css">
            body {
                position: relative;
            }

            body:before {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;

                z-index: -2;
                pointer-events: none;
                user-select: none;

                background: url('<?php echo get_stylesheet_directory_uri(); ?>/assets/img/concert_confeti.jpg') no-repeat !important;
                background-size: cover !important;
            }

            body:after {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;

                z-index: -1;
                pointer-events: none;
                user-select: none;
                opacity: .6;

                background-color: black;
            }

            body.login div#login h1 a {
                position: relative;
                width: 100px;
                height: 107px;
                margin-bottom: 20px;

                background: url("<?php echo get_stylesheet_directory_uri(); ?>/assets/img/logo_white_bg.png") no-repeat center center;
                background-size: 100%;
            }

            .message {
                border-radius: 22px;
                border-left-width: 0 !important;

                color: white;
                font-size: 18px;
                text-align: center;

                background-color: transparent !important;
            }

            .login form {
                border-radius: 22px;
                box-shadow: none !important;
                background-color: transparent !important;
            }

            @media (max-width: 600px) {
                .login form {
                    padding-bottom: 6px !important;
                }
            }

            @media (min-width: 1200px) {
                .login form {
                    padding-bottom: 15vh !important;
                }
            }

            #loginform h3 {
                margin: 20px 0;
                color: white !important;
            }

            .login label {
                font-size: 18px !important;
                color: white !important;
            }

            .login input {
                border-radius: 22px;
                padding: 0 0 3px 14px !important;
            }

            .newsociallogins {
                position: relative;
                left: 10px;
            }

            .new-fb-1-1 {
                position: relative;
            }

            .button--login.new-fb-btn {
                position: relative;
                top: -20px;
                border: 0 !important;

                box-shadow: none !important;

                background: none !important;
            }

            .new-fb-1-1:before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 20px;
                height: 42px;
                transform: translateX(-100%);

                background: url('http://localhost/fct001/wp-content/plugins/nextend-facebook-connect/buttons/facebook-btn.png') no-repeat 0 0;
            }

            .forgetmenot label {
                position: relative;
                top: 6px;

                font-size: 12px !important;
                text-transform: uppercase;
            }

            input#rememberme {
                background-color: transparent !important;
            }

            .submit input#wp-submit {
                border: 1px solid white;
                border-radius: 22px;
                padding: 0 25px !important;
                box-sizing: content-box;
                background-color: transparent !important;
            }

            #nav a {
                color: white !important;
            }

            #backtoblog a {
                color: white !important;
            }
        </style>

        <?php
	}
}


/**
 * Register and/or Enqueue
 * Scripts for the theme
 *
 * @since 1.0
 */
if ( ! function_exists( 'theme_scripts' ) ) {
	function theme_scripts() {
		$theme_dir = get_stylesheet_directory_uri();

		wp_enqueue_script( 'main', "$theme_dir/assets/js/main.js", array(), null, true );
	}
}


/**
 * Attach variables we want
 * to expose to our JS
 *
 * @since 3.12.0
 */
if ( ! function_exists( 'theme_scripts_localize' ) ) {
	function theme_scripts_localize() {
		$ajax_url_params = array();

		// You can remove this block if you don't use WPML
		if ( function_exists( 'wpml_object_id' ) ) {
			/** @var $sitepress SitePress */
			global $sitepress;

			$current_lang = $sitepress->get_current_language();
			wp_localize_script( 'main', 'i18n', array(
				'lang' => $current_lang
			) );

			$ajax_url_params['lang'] = $current_lang;
		}

		wp_localize_script( 'main', 'urls', array(
			'home'  => home_url(),
			'theme' => get_stylesheet_directory_uri(),
			'ajax'  => add_query_arg( $ajax_url_params, admin_url( 'admin-ajax.php' ) )
		) );
	}
}
