<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="vi">
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Thông tin nhà hàng</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- Theme CSS -->
<link href="<%=contextPath%>/css/agency.min.css" rel="stylesheet">
<link href="<%=contextPath%>/css/component.css" rel="stylesheet">
<link href="<%=contextPath%>/css/customer.css" rel="stylesheet">
</head>
<body id="page-top" class="index bg-light-gray">
	<!--  -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top"
		style="background-color: #98A81E">
	<div class="container">
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<div class="navbar-brand page-scroll"
				style="padding: 0; width: 13em; margin: 0; margin-top: 5px;">
				<div id="custom-search-input">
					<div class="input-group col-md-12">
						<input type="text" class="form-control input-lg navbar-default"
							placeholder="Tìm kiếm món ăn" style="background: none" /> <span
							class="input-group-btn">
							<button class="btn btn-info btn-lg" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<!-- 				<li><a class="page-scroll" href="#portfolio">Ưu đãi đặc
						biệt</a></li>
				<li><a class="page-scroll" href="#lastsafe">Ưu đãi mới nhất</a></li>
				<li><a class="page-scroll" href="#interested">Quan tâm nhất</a></li> -->
				<li><a class="page-scroll" href="#contact">Đăng nhập</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<div class="container">
		<div class="intro-text">
			<div class="row">
				<nav class="navbar navbar-default" style="margin-top: 100px;">
				<div class="container-fluid" style="width: 100%;">
					<ul class="nav navbar-nav"
						style="width: 100%; margin-right: auto; margin-left: 0px;">
						<li class="col-sm-1"></li>
						<li class="col-sm-3"><select class="dropbtn"
							style="text-align: center;">
								<option value="BADINH">Chọn địa điểm</option>
								<option value="BADINH">Ba Đình</option>

								<option value="DONGDA">Đống Đa</option>

								<option value="HAIBATRUNG">Hai Bà Trưng</option>

								<option value="HOANGMAI">Hoàng Mai</option>

								<option value="TAYHO">Tây Hồ</option>

								<option value="BAVI">Ba Vì</option>

								<option value="DANPHUONG">Đan Phượng</option>

								<option value="GIALAM">Gia Lâm</option>

								<option value="MELINH">Mê Linh</option>

								<option value="PHUXUYEN">Phú Xuyên</option>

								<option value="QUOCOAI">Quốc Oai</option>

								<option value="THACHTHAT">Thạch Thất</option>

								<option value="THANHTRI">Thanh Trì</option>

								<option value="TULIEM">Từ Liêm</option>

								<option value="SONTAY">Sơn Tây</option>

								<option value="CAUGIAY">Cầu Giấy</option>

								<option value="HADONG">Hà Đông</option>

								<option value="HOANKIEM">Hoàn Kiếm</option>

								<option value="LONGBIEN">Long Biên</option>

								<option value="THANHXUAN">Thanh Xuân</option>

								<option value="CHUONGMY">Chương Mỹ</option>

								<option value="DONGANH">Đông Anh</option>

								<option value="HOAIDUC">Hoài Đức</option>

								<option value="MYDUC">Mỹ Đức</option>

								<option value="PHUCTHO">Phúc Thọ</option>

								<option value="SOCSON">Sóc Sơn</option>

								<option value="THANHOAI">Thanh Oai</option>

								<option value="THUONGTIN">Thường Tín</option>

						</select></li>
						<li class="col-sm-3"><select class="dropbtn"
							style="text-align: center;">
								<option value="">Chọn ngày</option>
								<%
									for (int i = 15; i < 31; i += 1) {
								%>
								<option value="date">Ngày
									<%=i%></option>
								<%
									}
								%>
						</select></li>
						<li class="col-sm-3"><select class="dropbtn"
							style="text-align: center;">
								<option value="" class="dropdown-header">Chọn khung giờ</option>
								<%
									Date date = new SimpleDateFormat("hh:mm").parse("05:30");
									SimpleDateFormat ft = new SimpleDateFormat("hh:mm");
									Calendar cal = Calendar.getInstance();
									cal.setTime(date);
									for (int i = 0; i <= 12; ++i) {
										cal.add(Calendar.MINUTE, 30);
										Date tempDate = cal.getTime();
								%>
								<option value="time"><%=ft.format(tempDate)%> AM
								</option>
								<%
									}
								%>
						</select></li>
						<li class="col-sm-1">
							<form style="width: 100%; height: 7vh;">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"></span>
							</form>
						</li>
						<li class="col-sm-1"></li>
					</ul>
				</div>
				</nav>
			</div>

		</div>
	</div>

	<!-- Content -->
	<div class="container">
		<div class="row">

			<div class="col-sm-8 col-md-8 col-lg-8 col-xs-12">
				<h3 style="text-align: center;">Hideaway Restaurant Bar</h3>
				<div class="restaurant-info">
					<div>

						<span class="label label-danger noty-safe">10% OFF</span> <img
							src="https://media.foody.vn/reservation_res_info/s800x350/foody-800x350-tablenow-black-635997101560474360.jpg"
							class="img-responsive" alt="">
						<div class="row"
							style="text-align: center; position: inherit; padding: 10px;">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<span class="label label-success">Từ 10:00 AM đến 12:30
									AM</span>
							</div>
							<div class="col-sm-6 col-md-6 col-xs-6">
								<span class="label label-success">Từ 10:00 AM đến 12:30
									AM</span>
							</div>
						</div>
					</div>
					<div class="item-list" style="margin-top: 5vh; margin-bottom: 5vh;">
						<div class="row" style="width: 100%; text-align: center;">
							<div class="col-sm-6 col-md-4">
								<a target="_blank" href="http://hideawaysaigon.com/"><span
									class="item-url" style="text-align: left;">Hideaway.com</span></a>

							</div>
							<div class="col-sm-6 col-md-4">
								<span class="item-tel" style="text-align: left;">01677826011</span>
							</div>
							<div class="col-sm-6 col-md-4" style="float: right;">
								<span class="item-type" style="text-align: left;">Số 3 Lý
									thái tổ</span>
							</div>
						</div>
					</div>
				</div>
				<div>
					<nav class="navbar navbar-default">
					<div class="container-fluid">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#"
								onclick="toggle_visibility('image_restaurant');">Hình ảnh</a></li>
							<li><a href="#"
								onclick="toggle_visibility('menu_restaurant');">Thực đơn</a></li>
							<li><a href="#" id=""
								class="intro_restaurant"
								onclick="toggle_visibility('restaurant_intro');">Thông tin</a></li>
						</ul>
					</div>
					<div class="info_restaurant" style="margin: 30px;">
						<div id="image_restaurant">
							<div class="row">
								<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4"
									style="margin-bottom: 10px;">
									<div style="position: relative;" id="gallery-listing">
										<div class="img">
											<img style="height: 33vh"
												src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
										</div>
									</div>
									<!--//END:gallery-listing-->
									<div
										style="margin: 5px 11px; line-height: 14px; font-size: 14px; height: 28px; overflow: hidden;"
										class="gallery-caption"></div>
								</div>
								<div style="margin-bottom: 10px;"
									class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
									<div style="position: relative;" id="gallery-listing">
										<img style="height: 33vh"
											src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
									</div>
									<!--//END:gallery-listing-->
									<div
										style="margin: 5px 11px; line-height: 14px; font-size: 14px; height: 28px; overflow: hidden;"
										class="gallery-caption"></div>
								</div>
								<div style="margin-bottom: 10px;"
									class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
									<div style="position: relative;" id="gallery-listing">
										<img style="height: 33vh"
											src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
									</div>
									<!--//END:gallery-listing-->
									<div
										style="margin: 5px 11px; line-height: 14px; font-size: 14px; height: 28px; overflow: hidden;"
										class="gallery-caption"></div>
								</div>
							</div>
						</div>
						<div id="menu_restaurant" style="padding: 30px; display: none;">
							<img alt=""
								src="http://offpeak.vn/assets/restaurant/510/menu/856398329efb1c58c85fc4cef23bb6e9.jpg">
						</div>
						<div id="restaurant_intro"
							class="r-tabs-panel r-tabs-state-active" style="display: none;">
							<p>MUS*MUS Lẩu hấp mỹ nhân độc lạ duy nhất tại Việt Nam - Lẩu
								tươi ngon tinh khiết tốt cho sức khoẻ và làm đẹp da, đặc biệt ăn
								mãi cũng không tăng cân.</p>
							<p>Mus*Mus với không gian khiêm tốn nhưng chỉ một lần đến đây
								bạn sẽ cảm thấy một không gian ấm áp, sự phục vụ tận tình của
								nhân viên càng giúp bạn hiểu thêm về văn hóa của xứ sở hoa anh
								đào. Bên cạnh đó, các món ăn mang phong cách Nhật Bản đảm bảo
								tính "Healthy Food" cũng là cam kết mà nhà hàng chúng tôi sẽ làm
								hài lòng tất cả các thực khách.</p>
							<p>Lẩu hấp Mus Mus là loại lẩu được hấp cách thủy (nước hấp
								được hầm từ gà) đảm bảo vừa lạ, vừa ngon,đặc biệt rất tốt cho
								sức khoẻ vì lẩu hấp sử dụng nguyên liệu hoàn toàn tươi mới,
								không chất bảo quản, không dầu mỡ nên tất cả các chất dinh dưỡng
								và tinh túy của rau củ, hải sản sẽ được giữ nguyên</p>
							<p>
								Lẩu này kết hợp tuyệt vời với 1 loại nước chấm rất đặc biệt được
								làm từ mè và đậu phộng do đầu bếp Nhật đã nhiều năm sinh sống ở
								Việt Nam nên chắc chắn phù hợp với khẩu vị của người Việt Nam,
								đặc biệt là khách khó tính nhất.<br>Nước chấm ngon cùng với
								lẩu hấp nóng được phục vụ bởi các nhân viên rất nhiệt tình và
								cởi mở. Vì đây là lẩu hấp nên chúng ta có thể order và ăn thỏa
								thích mà không bị giới hạn.
							</p>
							<p>Sau khi ăn xong các thức ăn hấp, nước hấp bên dưới được
								hòa quyện giữa nước hầm từ gà và nước soup được chiết xuất từ
								các loại thực phẩm rau củ trong quá trình hấp rất là ngọt, sẽ
								được dùng để chế biến món cơm trứng rất ngon và lạ dưới bàn tay
								khéo léo của nhân viên đã được huấn luyện rất kỹ càng chắc chắn
								sẽ làm hài lòng tất cả thực khách, khách có thể dùng soup chung
								với mì hay miến tùy thích.</p>
							<p>Giá cả rất là mềm, rất là phù hợp với túi tiền lại được ăn
								thoải mái đến khi nào thấy không thể ăn thêm được nữa.</p>
							<p>Với phương châm Healthy Food, MusMus đã và đang cố gắng
								mang đến cho thực khách những món ăn mang đậm phong cách Nhật
								với chất lượng tốt nhất, kết hợp với phong cách phục vụ chuyên
								nghiệp góp phần truyền bá ẩm thực và văn hóa Nhật Bản tới mỗi
								người Việt Nam.</p>
						</div>
					</div>
					</nav>
				</div>


			</div>
			<div class="col-sm-4 col-md-4 col-lg-4 col-xs-12">
				<div class="booking-form">
					<div class="form-title">
						<small style="font-size: 15px;">Giảm giá <span
							style="color: #ed1c24; font-weight: bold;">20%</span>
					</div>
					<hr class="dotted-reverse">
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase;">Số
								người</label>
							<div class="col-right">
								<select name="pax" class="form-control">
									<option selected="selected" value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase;">Ngày</label>
							<div class="col-right">
								<select class="dropbtn"
									style="text-align: center; height: 5.5vh;">
									<option value="">Chọn ngày</option>
									<%
										for (int i = 15; i < 31; i += 1) {
									%>
									<option value="date">Ngày
										<%=i%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase;">Khung
								giờ</label>
							<div class="col-right">
								<select class="dropbtn"
									style="text-align: center; height: 5.5vh;">
									<option value="" class="dropdown-header">Chọn giờ</option>
									<%
										Calendar tem = Calendar.getInstance();
										tem.setTime(date);
										for (int i = 0; i <= 12; ++i) {
											tem.add(Calendar.MINUTE, 30);
											Date tempDate = cal.getTime();
									%>
									<option value="time"><%=ft.format(tempDate)%> AM
									</option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<button id="btn-book" class="btn btn-default login-required"
							type="submit">Tiếp tục</button>
					</div>
				</div>
				<!-- Khuyen cao -->
				<div class="booking-remark">
					<div class="remark-title">QUY ĐỊNH</div>
					<p>
						<strong>Thời gian khuyến mãi:</strong>
					</p>
					<ul>
						<li>Giảm 15% Thứ 2 - Chủ nhật từ 10:00 - 21:30</li>
					</ul>
					<p>
						<strong>Điều kiện áp dụng:</strong>
					</p>
					<ul>
						<li>Áp dụng cho menu chính</li>
						<li>Chương trình ưu đãi không bao gồm thức uống có cồn</li>
						<li>Không áp dụng cho đơn hàng mang về.</li>
						<li>Không bao gồm các hình thức khuyến mãi khác.</li>
						<li>Áp dụng cho cả ngày lễ, tết</li>
						<li>Nhà hàng sẽ giữ chỗ trước và sau thời điểm đặt bàn 15
							phút.</li>
						<li>Khách hàng vui lòng cung cấp xác nhận đặt bàn trước khi
							gọi món.</li>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function toggle_visibility(id) {
			var e = document.getElementById(id);
			document.getElementById('image_restaurant').style.display = 'none';
			document.getElementById('menu_restaurant').style.display = 'none';
			document.getElementById('restaurant_intro').style.display = 'none';
			if (e.style.display == 'block')
				e.style.display = 'none';
			else
				e.style.display = 'block';
		}
	</script>
	<!-- The end Content -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</body>
</html>