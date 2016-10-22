<?php

class MSoc_Core {

    function __construct(){
        new MSoc_Register_Settings();
        new MSoc_Social_Feed_Controller();
    }


}