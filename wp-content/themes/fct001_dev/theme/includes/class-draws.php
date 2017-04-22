<?php
/**
 * DRAWS
 *
 */


/**
 * Class SDP_BEM
 *
 */
class SDP_DRAWS {

    public static function is_draw_active($date) {
        return self::get_draw_status($date) === 'active';
    }

    public static function get_draw_status($date) {
        return SDP_DATE::get_date_diff($date) > 0
            ? 'active'
            : 'inactive';
    }

    public static function the_draw_status($date) {
        echo self::get_draw_status($date);
    }
}
