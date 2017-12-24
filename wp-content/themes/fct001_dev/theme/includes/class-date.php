<?php
/**
 * DATE
 * Helpers to manipulate date objects
 */

class SDP_DATE {

    static function get_time_contants() {
        return (object) Array(
            'second' => 1,
            'minute' => 60,
            'hour'   => 3600,
            'day'    => 86400,
        );
    }

    // Date format here must match the date format of ACF
    static function get_date_diff_in_seconds($date) {
        $expiration_date = strtotime($date);
        $current_date = strtotime(date('Y-m-d H:i:s'));
        return $expiration_date - $current_date;
    }

    public static function is_outdated($date) {
        return self::get_date_diff_in_seconds($date) > 0;
    }

    public static function is_not_outdated($date) {
        return self::get_date_diff_in_seconds($date) > 0;
    }

    public static function get_remaining_time_with_units($date) {
        $time_constants = self::get_time_contants();
        $time_diff = self::get_date_diff_in_seconds($date);

        if (floor($time_diff / $time_constants->day) > 0) {
            $remaining_time = self::get_remaining_time_in_days($time_diff);
        } elseif (floor($time_diff / $time_constants->hour)) {
            $remaining_time = self::get_remaining_time_in_hours($time_diff);
        } elseif (floor($time_diff / $time_constants->minute)) {
            $remaining_time = self::get_remaining_time_in_minutes($time_diff);
        } else {
            $remaining_time = self::get_remaining_time_in_seconds($time_diff);
        }

        return $remaining_time;
    }

    static function get_remaining_time_in_days($time) {
        $rem_time = floor($time / self::get_time_contants()->day );
        $units = $rem_time > 1 ? 'days' : 'day';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    static function get_remaining_time_in_hours($time) {
        $rem_time = floor($time / self::get_time_contants()->hour);
        $units = $rem_time > 1 ? 'hours' : 'hours';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    static function get_remaining_time_in_minutes($time) {
        $rem_time = floor($time / self::get_time_contants()->minute );
        $units = $rem_time > 1 ? 'minutes' : 'minute';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    static function get_remaining_time_in_seconds($time) {
        $rem_time = floor($time / self::get_time_contants()->second );
        $units = $rem_time > 1 ? 'seconds' : 'second';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }
}
