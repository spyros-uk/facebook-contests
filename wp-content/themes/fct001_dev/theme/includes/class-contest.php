<?php

class SDP_CONTEST {

    static function get_nominees($contest) {
        $permalink = get_the_permalink($contest->ID);
        $contest_likes = SDP_FB::get_object_likes($permalink);
        return $contest_likes;
    }

    static function pick_winner($nominees_list) {
        $rand_keys = array_rand($nominees_list, 1);
        $winner_fb_id = $nominees_list[$rand_keys]['id'];
        $winner = SDP_FB::get_user_data($winner_fb_id);

        return $winner;
    }

    static function notify_winner($winner_data, $contest) {
        $subject = SDP_MAIL::get_subject();
        $message = SDP_MAIL::get_populated_email_template($winner_data['winner_name'], $contest);

        SDP_MAIL::send_email(
            $winner_data['winner_email'],
            $subject,
            $message
        );
    }

    public static function get_winner($contest) {
        return get_field('winner', $contest->ID)[0];
    }

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

    public static function set_winner($contest) {
        $nominees_list = self::get_nominees($contest->ID);
        $winner = self::pick_winner($nominees_list);

        $winner_data = array(
            array(
                'winner_fb_id'	=> $winner['id'],
                'winner_name'	=> $winner['name'],
                'winner_email'	=> $winner['email']
            )
        );

        update_field('winner', $winner_data, $contest->ID);
        self::notify_winner($winner_data, $contest);
    }
}

?>
