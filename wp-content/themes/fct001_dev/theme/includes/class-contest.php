<?php

class SDP_CONTEST {

    public static function is_winner_set($contest) {
        $winner_data = self::get_winner($contest);
        $is_winner = null;

        foreach ($winner_data as $data) {
            $is_winner = (
                $data !== null &&
                $data !== ''
            );
        }

        return $is_winner;
    }

    public static function get_winner($contest) {
        return get_field('winner', $contest->ID)[0];
    }

    public static function get_winner_name($contest) {
        return (
            self::is_winner_set($contest)
                ? self::get_winner($contest)['winner_name']
                : 'no winner'
        );
    }

    public static function the_winner_name($contest) {
        echo self::get_winner_name($contest);
    }

    static function get_nominees($contest) {
        $permalink = get_the_permalink($contest->ID);
        $contest_likes = SDP_FB::get_object_likes($permalink);
        return $contest_likes;
    }

    static function pick_random_person($nominees_list) {
        $rand_keys = 0;
        if (sizeof($nominees_list) > 1)
            $rand_keys = array_rand($nominees_list, 1);

        return $nominees_list[$rand_keys];
    }

    static function get_normalized_winner($winner_data) {
        return array(
            array(
                'winner_fb_id'	=> $winner_data['id'],
                'winner_name'	=> $winner_data['name'],
                'winner_email'	=> $winner_data['email']
            )
        );
    }

    static function pick_winner($nominees_list) {
        $winner_data = [];

        if(!empty($nominees_list)) {
            $winner_fb_info = self::pick_random_person($nominees_list);
            $winner_fb_id = $winner_fb_info['id'];
            $winner_data = SDP_FB::get_user_data($winner_fb_id);
        }

        return $winner_data;
    }

    static function notify_winner($winner_data, $contest) {
        $subject = SDP_MAIL::get_subject();
        $message = SDP_MAIL::get_populated_email_template($winner_data['name'], $contest);

        SDP_MAIL::send_email(
            $winner_data['email'],
            $subject,
            $message
        );
    }

    public static function set_winner($contest) {
        $nominees_list = self::get_nominees($contest);
        $winner_data = self::pick_winner($nominees_list);

        if (!empty($winner_data)) {
            $normalized_winner = self::get_normalized_winner($winner_data);
            update_field('winner', $normalized_winner, $contest->ID);
            self::notify_winner($winner_data, $contest);
        }
    }
}

?>
