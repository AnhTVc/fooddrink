<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">
<link href="<%=contextPath%>/css/normalize.css" rel="stylesheet">
<link href="<%=contextPath%>/css/style.css" rel="stylesheet">
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

				<form action="/" method="post">

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
						</label> <input type="email" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Set A Password<span class="req">*</span>
						</label> <input type="password" required autocomplete="off" />
					</div>
					<div class="field-wrap">
						<label> Phone number<span class="req">*</span>
						</label> <input type="text" required autocomplete="off" />
					</div>


					<button type="submit" class="button button-block">Đăng ký
					</button>
					<div class="top-row" style="padding-top: 10px; padding-bottom:">
						<div class="field-wrap">
							<button type="submit" class="button button-block"
								style="font-size: 14px; background-color: #007095">Đăng
								ký với facebook</button>
						</div>
						<div class="field-wrap">
							<button type="submit" class="button button-block"
								style="font-size: 14px; background-color: #d73d32;">Đăng
								ký với google plus</button>
						</div>
					</div>
					<form>
						<div class="checkbox">
							<input type="checkbox" value=""
								style="text-align: right; float: right; margin-left: -50%;"><label
								class="checkbox"> Đăng ký với tư cách là nhà hàng</label>

						</div>
					</form>

				</form>

			</div>

			<div id="login">
				<h1>Xin chào</h1>

				<form action="/fooddrink/login" method="post">

					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input type="email" name="email" required autocomplete="off" id="email_login" />
					</div>

					<div class="field-wrap">
						<label> Password<span class="req">*</span>
						</label> <input type="password" name="password" required autocomplete="off"
							id="password_login" />
					</div>

					<p class="forgot">
						<a href="#">Forgot Password?</a>
					</p>

					<button class="button button-block" onclick="login()">
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

	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/login.js"></script>
	<script type="text/javascript">
		function login() {
			var email = $('#email_login').val();
			var password = $('#password_login').val();
			if (email == null || password == null) {
				alert("ok");
			}
		}
	</script>

</body>
</html>
