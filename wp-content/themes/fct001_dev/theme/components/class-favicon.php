<?php

/**
 * Class Component_Favicon
 *
 */
class Component_Favicon {

    /**
     * Renders the ful favicon tags
     *
     * @return *
     */

    public static function the_favicon () {
        $theme_dir = get_stylesheet_directory_uri();
        ob_start(); ?>

        <link rel="apple-touch-icon" sizes="76x76"href="<?php echo $theme_dir ?>/assets/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32"href="<?php echo $theme_dir ?>/assets/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16"href="<?php echo $theme_dir ?>/assets/favicon/favicon-16x16.png">
        <link rel="manifest"href="<?php echo $theme_dir ?>/assets/favicon/manifest.json">
        <link rel="mask-icon"href="<?php echo $theme_dir ?>/assets/favicon/safari-pinned-tab.svg" color="#fff">
        <meta name="theme-color" content="#ffffff">

        <?php return ob_get_clean();
    }
}
