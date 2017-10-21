<?php

class SDP_API
{

    public static function GET($url) {
        $c_id = curl_init();
        curl_setopt($c_id, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c_id, CURLOPT_URL, $url);
        $response = curl_exec($c_id);
        curl_close($c_id);

        return json_decode($response, true);
    }
}

?>