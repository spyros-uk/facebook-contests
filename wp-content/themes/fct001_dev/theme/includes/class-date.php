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
    private $SECONDS;
    private $MINUTE;
    private $HOUR;
    private $DAY;

    public function __construct() {
        $this->SECONDS = 1;
        $this->MINUTE = 60;
        $this->HOUR = 60 * $this->MINUTE;
        $this->DAY = 24 * $this->HOUR;
    }

    // Date format here must match the date format of ACF
    public static function get_date_diff($date) {
        $start_date = strtotime($date);
        $current_date = strtotime(date('Y-m-d H:i:s'));
        return $start_date - $current_date;
    }

    public function get_remaining_time_with_units($date) {
        $time_diff = self::get_date_diff($date);

        if (floor($time_diff / $this->DAY) > 0) {
            $remaining_time = self::get_remaining_time_in_days($time_diff);
        } elseif (floor($time_diff / $this->HOUR)) {
            $remaining_time = self::get_remaining_time_in_hours($time_diff);
        } elseif (floor($time_diff / $this->MINUTE)) {
            $remaining_time = self::get_remaining_time_in_minutes($time_diff);
        } else {
            $remaining_time = self::get_remaining_time_in_seconds($time_diff);
        }

        return $remaining_time;
    }

    public function get_remaining_time_in_days($time) {
        $rem_time = floor($time / $this->DAY );
        $units = $rem_time > 1 ? 'days' : 'day';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    public function get_remaining_time_in_hours($time) {
        $rem_time = floor($time / $this->HOUR );
        $units = $rem_time > 1 ? 'hours' : 'hours';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    public function get_remaining_time_in_minutes($time) {
        $rem_time = floor($time / $this->MINUTE );
        $units = $rem_time > 1 ? 'minutes' : 'minute';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }

    public function get_remaining_time_in_seconds($time) {
        $rem_time = floor($time / $this->SECONDS );
        $units = $rem_time > 1 ? 'seconds' : 'second';
        return (object) Array('time' => $rem_time, 'units' => $units);
    }
}
