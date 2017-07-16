<?php

/**
 * Class Component_Fb
 * Provides FB SDK
 */
class Component_Fb {

    public static function include_fb_sdk() {
        ob_start(); ?>

        <script>
            window.fbAsyncInit = function() {
                FB.init({
                    appId      : '615347261977517',
                    cookie     : true,
                    xfbml      : true,
                    version    : 'v2.8'
                });
                FB.AppEvents.logPageView();
            };

            (function(d, s, id){
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>

     <?php return ob_get_clean();
    }
}
