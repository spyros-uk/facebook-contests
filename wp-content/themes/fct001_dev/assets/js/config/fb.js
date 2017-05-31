/**
 * Facebook SDK
 */

if (window.FB) {
    FB.ui({
        method: 'pagetab',
        redirect_uri: 'YOUR_URL'
    }, function(response){});
}