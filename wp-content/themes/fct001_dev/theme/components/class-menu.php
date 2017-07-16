<?php

/**
 * Class Component_Header
 *
 */
class Component_Menu {

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
            'menu_class'          => "$menu_type-menu",
            'show_header_class'   => false,
            'add_submenu_toggles' => true,
            'walker'              => new SDP_Walker_Nav_Menu
        ) );
    }
}
