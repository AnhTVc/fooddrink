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
		style="background-color: #A3410D; background-image: url(https://startbootstrap.com/img/bg.png);">

		<form action="/fooddrink/UpdateInfoRestaurant" method="post"
			style="padding-bottom: 30px;">
			<h2 style="color: #fff; text-align: center; margin-bottom: 30px;">Cập
				nhật thông tin nhà hàng</h2>
			<div class="field-wrap">
				<label>Tên nhà hàng<span class="req">*</span>
				</label> <input type="text" required autocomplete="off"
					name="name_restaurant" />
			</div>
			<div class="field-wrap row"
				style="padding-left: 15px; padding-right: 15px;">
				<div class="col-sm-3">
					<select id="state">
						<option>Brazil</option>
						<option>Ghana</option>
					</select>
				</div>
				<div class="col-sm-3">
					<select id="city">
						<option>Brazil-city1</option>
						<option>Brazil-city2</option>
						<option>Brazil-city3</option>
						<option>Brazil-city3</option>
						<option>Brazil-city3</option>
						<option>Brazil-city3</option>
						<option>Ghana-city1</option>
						<option>Ghana-city2</option>
						</select>
				</div>
				<div class="col-sm-6">
					<label>Địa điểm chi tiết<span class="req">*</span>
					</label> <input type="text" required autocomplete="off" name="" />
				</div>
			</div>

			<div class="field-wrap">
				<label>Thông tin liên hệ<span class="req">*</span>
				</label> <input type="text" required autocomplete="off"
					name="contact_restaurant" />
			</div>
			<div class="field-wrap">
				<input id="input-1" type="file" class="file"
					name="avatar_restaurant" style="border-radius: 0">
			</div>
			<button class="button button-block">Cập nhật</button>

			<!-- tab-content -->

		</form>
	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="<%=contextPath%>/js/fileinput.js"></script>
	<script type="text/javascript">
		$(function() {

			var showCity = function(selectedState) {
				$('#city option').hide();
				$('#city').find('option').filter(function() {
					var city = $(this).text();
					return city.indexOf(selectedState) != -1;
				}).show();
				//set default value
				var defaultCity = $('#city option:visible:first').text();
				$('#city').val(defaultCity);
			};

			//set default state
			var state = $('#state').val();
			showCity(state);
			$('#state').change(function() {
				showCity($(this).val());
			});
		});
	</script>
</body>
</html>
