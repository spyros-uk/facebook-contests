<?php
/**
 * DATE
 * Helpers to manipulate date objects
 */


/**
 * Class SDP_BEM
 *
 */
class SDP_DATE {

    // Date format here must match the date format of ACF
    public static function get_date_diff($date) {
        $start_date = strtotime($date);
        $current_date = strtotime(date('Y-m-d H:i:s'));
        return $start_date - $current_date;
    }
}
