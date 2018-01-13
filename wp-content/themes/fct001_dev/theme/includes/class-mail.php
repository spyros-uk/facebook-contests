<?php
class SDP_MAIL {

    public static function get_subject() {
        return 'You are a winner!';
    }

    public static function get_populated_email_template($name, $contest) {
        return "Dear $name,
        
        Congratulations! You are the winner of the contest '$contest->post_title'!
        We will soon contact you again, to let you know how to claim your prize!
        
        Sincerely,
        Facebook Contests team";
    }

    public static function send_email($to, $subject, $message) {
        wp_mail($to, $subject, $message);
    }
}
?>