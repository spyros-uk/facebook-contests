<?php

/**
 * Class Component_Menu
 *
 */
class Component_Header {

    /**
     * Renders the header
     * according to specified type
     *
     * @param $header_type
     * @return *
     */

    public static function the_header ($header_type) {
        ob_start(); ?>

        <header class="header">
            <?php  self::the_menu($header_type); ?>
        </header>

        <?php return ob_get_clean();
    }

    /**
     * Renders the nav menu
     * according to specified type
     *
     * @param $menu_type
     *
     */
    public static function the_menu( $menu_type ) {
        SDP_Menu::nav_menu( $menu_type, array(
            'depth'               => 1,
            'menu_class'          => 'main-menu',
            'show_header_class'   => false,
            'add_submenu_toggles' => true,
            'walker'              => new SDP_Walker_Nav_Menu
        ) );
    }
}
