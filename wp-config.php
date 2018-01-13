<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'fct001');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', 'utf8_general_ci');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'CJ9LwT#+LB.7]x&LC4B8{=DZ*,iIYir;|=Bw3l%d2&BnnAYtRP{sSP2z1V=8Zmk3');
define('SECURE_AUTH_KEY',  'Uv017/zG>W=ZZl4$-h9>U(+5Eh++16nB4xw-bT}N-Q(TBae3DR<*chpCiZDTF~4D');
define('LOGGED_IN_KEY',    '8Yl[CNSf-+>5K<a:d__E.+$c9V|B./bm%+wP, )Xh3x=|>s3~ Vl3:JfjEbc(0aU');
define('NONCE_KEY',        '!x$i@szB}!%6FwjPpTd$E[|kKO_lpZwK)eP2Y1csJb>l(!yP{~)8yVb2Yq^+w~Qp');
define('AUTH_SALT',        '+M0fxF+8$Ax`cC|G1fP;~|`+mVHVO-$Vlv(oBUxL82X,=DJEZ&2euuO0pgsGS{#n');
define('SECURE_AUTH_SALT', 'wBjSOKcnbc|.%*@3L~J3--e2&zO(g>v>F4&TRYw`p-)*$l+:VD3VxP5}V7M|Q3u!');
define('LOGGED_IN_SALT',   ';rSolz =b+Fq/e1MBb^aqBH)#z?;SFcQ_m_/>*e1NUN6pUBVJR,g?2KvDXby,R@,');
define('NONCE_SALT',       'uba{>!.->|e,zG,EE4lb<#,dJ^ZKUqUS$ i!aJ4~WOW0oln#sVO_yxw%qo>WOUuz');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'fct001_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', true);

define( 'SMTP_USER',   'info@fbcontests.co.uk' );    // Username to use for SMTP authentication
define( 'SMTP_PASS',   'Spyros06!' );       // Password to use for SMTP authentication
define( 'SMTP_HOST',   'a2plcpnl0103.prod.iad2.secureserver.net' );    // The hostname of the mail server
define( 'SMTP_FROM',   'info@fbcontests.co.uk' ); // SMTP From email address
define( 'SMTP_NAME',   'Facebook Contests' );    // SMTP From name
define( 'SMTP_PORT',   '465' );                  // SMTP port number - likely to be 25, 465 or 587
define( 'SMTP_SECURE', 'ssl' );                 // Encryption system to use - ssl or tls
define( 'SMTP_AUTH',    true );                 // Use SMTP authentication (true|false)
define( 'SMTP_DEBUG',   2 );                    // for debugging purposes only set to 1 or 2

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
