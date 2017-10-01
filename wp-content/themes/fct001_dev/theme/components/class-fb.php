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

    public static function insert_fb_meta_data() {
        ob_start(); ?>

        <meta property="og:url"           content="http://www.your-domain.com/your-page.html" />
        <meta property="og:type"          content="website" />
        <meta property="og:title"         content="Your Website Title" />
        <meta property="og:description"   content="Your description" />
        <meta property="og:image"         content="http://www.your-domain.com/path/image.jpg" />

        <?php return ob_get_clean();
    }
}
