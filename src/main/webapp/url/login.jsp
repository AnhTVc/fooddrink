<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<meta
	name="670792160571-fb0b0akjjs8m312vphh5os6g521cbf5m.apps.googleusercontent.com">
<title>Sign-Up/Login Form</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">
<link href="<%=contextPath%>/css/normalize.css" rel="stylesheet">
<link href="<%=contextPath%>/css/style.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<%=contextPath%>/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
	var googleUser = {};
	var startApp = function() {
		gapi
				.load(
						'auth2',
						function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2
									.init({
										client_id : '670792160571-fb0b0akjjs8m312vphh5os6g521cbf5m.apps.googleusercontent.com',
										cookiepolicy : 'single_host_origin',
									// Request scopes in addition to 'profile' and 'email'
									//scope: 'additional_scope'
									});
							attachSignin(document.getElementById('customBtn'));
						});
	};

	function attachSignin(element) {
		console.log(element.id);
		auth2.attachClickHandler(element, {}, function(googleUser) {
			/* document.getElementById('name').innerText = "Signed in: " +
			    googleUser.getBasicProfile().getName(); */
			var googleName = googleUser.getBasicProfile().getName();
			var googleEmail = googleUser.getBasicProfile().getEmail();
			
			alert(googleEmail);
			$.ajax({
		        url: URL + "login",
		        type: "post",
		        data: 'name=' + googleName + '&email=' + googleEmail + '&status=2',
		        success: function (response) {
		        	alert(response.authen);
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
		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
		});
	}
</script>

</head>

<body>
	<div class="form">
		<ul class="tab-group">
			<li class="tab active"><a href="#signup">Đăng ký</a></li>
			<li class="tab"><a href="#login">Đăng nhập</a></li>
		</ul>

		<div class="tab-content">
			<div id="signup">
				<h2 style="text-align: center; color: #fff;">Đăng ký miễn phí</h2>

				<form action="/fooddrink/Register" method="post">

					<!-- <div class="top-row">
						<div class="field-wrap">
							<label> Full name<span class="req">*</span>
							</label> <input type="text" required autocomplete="off" />
						</div>

						<div class="field-wrap">
							<label> Last Name<span class="req">*</span>
							</label> <input type="text" required autocomplete="off" />
						</div>
					</div> -->
					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input type="email" name="email_register" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Set A Password<span class="req">*</span>
						</label> <input type="password" name="password_register" required autocomplete="off" />
					</div>
					<div class="field-wrap">
						<label> Phone number<span class="req">*</span>
						</label> <input type="phonenumber" name="phonenumber" required autocomplete="off" />
					</div>

					<button type="submit" class="button button-block">Đăng ký
					</button>

					<div class="checkbox">
						<input type="checkbox" value=""
							style="text-align: right; float: right; margin-left: -50%;" name="checkbox_register"><label
							class="checkbox"> Đăng ký với tư cách là nhà hàng</label>

					</div>
				</form>
			</div>

			<div id="login">
				<h1>Xin chào</h1>

				<form action="/fooddrink/login" method="post">

					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input type="email" name="email" required autocomplete="off"
							id="email_login" />
					</div>

					<div class="field-wrap">
						<label> Password<span class="req">*</span>
						</label> <input type="password" name="password" required
							autocomplete="off" id="password_login" />
					</div>

					<p class="forgot">
						<a href="#">Forgot Password?</a>
					</p>

					<button class="button button-block" >
						Đăng nhập</button>


					<div class="checkbox">
						<input type="checkbox" value="" name="checkbox"
							style="text-align: right; float: right; margin-left: -50%;"><label
							class="checkbox"> Đăng ký với tư cách là nhà hàng</label>
					</div>
				</form>
			</div>

		</div>
		<!-- tab-content -->
		<div class="tab-group">
			<div class="top-row" style="padding-top: 30px;">
				<div class="field-wrap">
					<button type="submit" class="button button-block"
						style="font-size: 14px; background-color: #007095"
						onclick="javascript:login();">
						<i class="fa fa-facebook" aria-hidden="true"></i> Đăng nhập với
						facebook
					</button>
				</div>
				<div class="field-wrap">
					<div id="customBtn">
						<button id="loginGoogleBtn" class="button button-block"
							style="font-size: 14px; background-color: #d73d32;"
							data-onsuccess="onSignIn">
							<i class="fa fa-google-plus" aria-hidden="true"></i> Đăng nhập với
							google
						</button>
					</div>
				</div>
			</div>
			<p style="color: #fff;">Chú ý: Chức năng đăng nhập với facebook và google không dành cho nhà hàng</p>
		</div>
	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/login.js"></script>

	<script>
		startApp();
	</script>

</body>
</html>
