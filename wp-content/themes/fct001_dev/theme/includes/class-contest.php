<?php

class SDP_CONTEST {
    public function get_winner($contest_id) {
        // Select * FROM NOMINEES WHERE CONTEST_ID = $contest_id AND IS_WINNER = 1;
    }

    public function set_winner($contest_id, $nominee_id) {
        // UPDATE NOMINEES SET IS_WINNER = 1 WHERE CONTEST_ID = $contest_id AND NOMINEE_ID = $nominee_id;
    }

    public function update_nominees() {
        // uses get_object_likes to collect likes data
        // Iterate over array of objects
        // uses $wpdb to update the table for every entry
    }

    public function get_nominees($contest_id) {
        // Uses $wpdb to get nominees
    }

    public function pick_winner($nominees_list) {
        // Randomlly choose an entry from the array
        // Uses $wpdb to se this randomly picked nominee
        //
    }

    public function notify_winner() {

    }
}

?>