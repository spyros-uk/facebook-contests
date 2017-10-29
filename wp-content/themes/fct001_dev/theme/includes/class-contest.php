<?php

class SDP_CONTEST {

    public static function get_nominees($contest_id) {
        $permalink = get_the_permalink($contest_id);
        $contest_likes = SDP_FB::get_object_likes($permalink);

        return $contest_likes;
    }

    public static function pick_winner($nominees_list) {
        $rand_keys = array_rand($nominees_list, 1);
        $winner_fb_id = $nominees_list[$rand_keys[0]]->id;
        $winner = SDP_FB::get_user_data($winner_fb_id);

        return $winner;
    }

    public static function get_winner($contest_id) {
        return get_field('winner', $contest_id)[0];
    }

    public static function set_winner($contest_id) {
        $nominees_list = self::get_nominees($contest_id);
        $winner = self::pick_winner($nominees_list);

        $winner_data = array(
            array(
                "winner_fb_id"	=> $winner->id,
                "winner_name"	=> $winner->name,
                "winner_email"	=> $winner->email
            )
        );

        update_field('winner', $winner_data, $contest_id);
    }

    public static function notify_winner() {

    }
}

?>