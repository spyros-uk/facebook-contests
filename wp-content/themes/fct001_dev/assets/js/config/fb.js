/**
 * Facebook SDK
 */

document.addEventListener("DOMContentLoaded", function(event) {
    console.log("DOM fully loaded and parsed");
    // I don't quite get it...
    setTimeout(() => {
        if (window.FB && window.location.pathname.indexOf('active-contests')) init();
    }, 300);
});

function init() {
    console.log('FB exists');
    registerLikeListener();
}

function getLoginStatus() {
    return new Promise((resolve, reject) => {
        window.FB.getLoginStatus(function(response) {
            resolve(response);
        });
    });
}

function login() {
    return new Promise((resolve, reject) => {
        window.FB.login(function(response) {
            if (response.status === 'connected') {
                console.log('Succesfull login', response);
                return resolve(response);
            } else {
                console.log('Login Failed', response);
                reject(response);
            }
        }, {
            scope: 'public_profile,email,user_birthday'
        });
    });
}

function getMe() {
    window.FB.api(
        '/me',
        { fields: 'name,email,birthday' },
        function(response) {
            console.log('Good to see you, ' + response.name + '.');
        }
    );
}

function registerLikeListener() {
    window.FB.Event.subscribe('edge.create', likeEvent => {
        console.log(`Like event: ${likeEvent}`);
    });
}

function getObjectId(objUrl) {
    return new Promise((resolve, reject) => {
        window.FB.api(
            `?ids=${obj_url}`,
            function(response) {
                return response.og_object
                    ? resolve(response.og_object.id)
                    : reject(new Error(`Could not retrieve ID from object with URL: ${objUrl}`));
            }
        );
    });
}

function getObjectLikes(objId) {
    return new Promise((resolve, reject) => {
        window.FB.api(
            `${objId}/likes`,
            function(response) {
                return response.data
                    ? resolve(response.data)
                    : reject(new Error(`Could not retrieve likes from object with ID: ${objId}`));
            }
        );
    });
}