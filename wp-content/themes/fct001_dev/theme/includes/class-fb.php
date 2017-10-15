<?php
    class SDP_FB {

        static function get_open_graph_uri() {
            return 'https://graph.facebook.com';
        }

        static function get_access_token() {
            $app_id = 615347261977517;
            $app_secret = '533b1b36d117d2ace91552533f34e68e';

            return "$app_id|$app_secret";
        }

        public function get_og_object($uri) {
            // API call to https://graph.facebook.com/$uri
            // Example: https://graph.facebook.com/?ids=https://fbcontests.co.uk/contest/travel-to-caribbeans/
        }

        public function get_og_object_id($og_object) {
            return $og_object['og_object']['id'];
        }

        public function get_object_likes($uri) {
            // $og_object = get_og_object($uri);
            // $obj_id = get_og_object_id($og_object);
            // $access_token = get_access_token();
            // $fb_og_uri = get_open_graph_uri();
            // $url = $fb_og_uri/$obj_id/likes?access_token=$access_token;

            // API call to https://graph.facebook.com/v2.10/ (needs access token)
            // return API->GET($url)['data'];
        }
    }
?>