var URL = "http://localhost:8080/fooddrink/";

$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

window.fbAsyncInit = function() {
	FB.init({
		appId : '531914290330969',
		status : true,
		cookie : true,
		xfbml : true
	});
};

// Load the SDK asynchronously
(function(d) {
	var js, id = 'facebook-jssdk', ref = d
			.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/en_US/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

function login() {
	FB.login(function(response) {
	}, {
		scope : 'email,user_photos,publish_actions'
	});

	var status = FB.getLoginStatus();
	console.log(status);

/*	FB.Event.subscribe('auth.authResponseChange', function(response) {
		if (response.status === 'connected') {
			alert("Successfully connected to Facebook!"
					+ response.authResponse.userID);
			FB.api('/me', function(fbUser) {
				alert("Open the pod bay doors, " + fbUser.name + ".");
			});

		} else if (response.status === 'not_authorized') {
			alert("Login failed!");
		} else {
			//The user isn't logged in to Facebook.
			alert("Unknown error!");
		}
	});*/

	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			// the user is logged in and has authenticated your
			// app, and response.authResponse supplies
			// the user's ID, a valid access token, a signed
			// request, and the time the access token 
			// and signed request each expire
			var uid = response.authResponse.userID;
			var accessToken = response.authResponse.accessToken;
			FB.api('/me', function(fbUser) {
				/*
				 * Post data to server!
				 */
				alert(uid);
				$.ajax({
			        url: URL + "login",
			        type: "post",
			        data: 'name=' + fbUser.name + '&userId=' + uid + '&status=1',
			        success: function (response) {
			           // you will get response from your php page (what you echo or print)                 
			        	if(response.authen == "true"){
			        		window.location.replace("http://localhost:8080/fooddrink");
			        	}else{
			        		window.location.reload();
			        	}
			        },
			        error: function(jqXHR, textStatus, errorThrown) {
			           alert(textStatus, errorThrown);
			           window.location.reload();
			        }
			    });
			});
			
		} else if (response.status === 'not_authorized') {
			// the user is logged in to Facebook, 
			// but has not authenticated your app
			alert("Rất tiếc, bạn đã không tin tưởng fooddink bằng facebook")
		} else {
			//The user isn't logged in to Facebook.
		}
	});

}

function logout() {
	FB.logout(function(response) {
		// user is now logged out
	});
}

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail());
	}

//==============================
