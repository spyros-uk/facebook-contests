<?php
class Component_Button {

    static function get_default_button_attrs() {
        return (object) array(
            'target' => '_self',
            'class' => 'button'
        );
    }

    static function get_button($href, $text) {
        ob_start(); ?>

        <a
            href="<?php echo $href ?>"
            target="<?php echo self::get_default_button_attrs()->target ?>"
            class="<?php echo self::get_default_button_attrs()->class ?>"
        >
            <?php echo $text ?>
        </a>
        <?php return ob_get_clean();
    }

    public static function the_login_button() {
        return self::get_button(
            wp_login_url(home_url()),
            'Login'
        );
    }

    public static function the_logout_button() {
        return self::get_button(
            wp_logout_url(home_url()),
            'Logout'
        );
    }

    public static function the_registration_button() {
        return self::get_button(
            home_url('/wp-login.php?action=register'),
            'Register'
        );
    }

    public static function the_dashboard_button() {
        return self::get_button(
            admin_url(),
            'Dashboard'
        );
    }
}
?>