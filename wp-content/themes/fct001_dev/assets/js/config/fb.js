/**
 * Facebook SDK
 */

if (window.FB) {
    FB.ui({
        method: 'pagetab',
        redirect_uri: 'YOUR_URL'
    }, function(response){});
}


window.FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});


/*


 {
 status: 'connected',
 authResponse: {
 accessToken: '...',
 expiresIn:'...',
 signedRequest:'...',
 userID:'...'
 }
 }


 <fb:login-button
 scope="public_profile,email"
 onlogin="checkLoginState();">
 </fb:login-button>



 function checkLoginState() {
 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 }


 FB.api('/me', function(response) {
 console.log(JSON.stringify(response));
 });



*/
/*

<script>
window.fbAsyncInit = function() {
    FB.init({
        appId      : '775901495916688',
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

*/
