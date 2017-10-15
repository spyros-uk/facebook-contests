<?php

class API
{

    public function get($url) {

        $c_id = curl_init();
        curl_setopt($c_id, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c_id, CURLOPT_URL, $url);
        $response = curl_exec($c_id);

        curl_close($c_id);

        return $response;
    }

    function CallAPI($method, $url, $data = false)
    {
        $curl = curl_init();

        switch ($method) {
            case "POST":
                curl_setopt($curl, CURLOPT_POST, 1);

                if ($data)
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                break;
            case "PUT":
                curl_setopt($curl, CURLOPT_PUT, 1);
                break;
            default:
                if ($data)
                    $url = sprintf("%s?%s", $url, http_build_query($data));
        }

        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        $response = curl_exec($curl);

        curl_close($curl);

        return $response;
    }
}

?>