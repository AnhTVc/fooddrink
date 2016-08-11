<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Cập nhật thông tin nhà hàng</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">
<link href="<%=contextPath%>/css/normalize.css" rel="stylesheet">
<link href="<%=contextPath%>/css/style.css" rel="stylesheet">
<link href="<%=contextPath%>/css/inputfile.min.css" rel="stylesheet">
</head>

<body>
	<div class="form"
		style="background-image: url(http://localhost:8080/fooddrink/img/restaurant.jpeg)">

		<div>
			<h2 style="color: #fff; text-align: center; margin-bottom: 30px;">Cập
				nhật thông tin nhà hàng</h2>
			<div class="field-wrap">
				<label>Tên nhà hàng<span class="req">*</span>
				</label> <input type="text" required autocomplete="off" />
			</div>
			<div class="field-wrap">
				<label>Địa điểm<span class="req">*</span>
				</label> <input type="text" required autocomplete="off" />
			</div>
			<div class="field-wrap">
				<label>Thông tin liên hệ<span class="req">*</span>
				</label> <input type="text" required autocomplete="off" />
			</div>
			<div class="field-wrap">
				<input id="input-1" type="file" class="file" style="border-radius: 0">
			</div>
			<button class="button button-block" onclick="login()">Cập
				nhật</button>
		</div>
		<!-- tab-content -->

	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="<%=contextPath%>/js/login.js"></script>
	<script src="<%=contextPath%>/js/fileinput.js"></script>
</body>
</html>
