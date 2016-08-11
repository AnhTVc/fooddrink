<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<html lang="vi">
<%@ page pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Solution for restaurant</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- Theme CSS -->
<link href="<%=contextPath%>/css/agency.min.css" rel="stylesheet">
<link href="<%=contextPath%>/css/component.css" rel="stylesheet">
<link href="<%=contextPath%>/css/customer.css" rel="stylesheet">
<link href="<%=contextPath%>/css/bootstrap-modal.css" rel="stylesheet">
</head>
<body>
<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top">
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
					<li><a class="page-scroll" href="#portfolio"
						style="text-transform: uppercase;">Ưu đãi đặc biệt</a></li>
					<li><a class="page-scroll" href="#lastsafe"
						style="text-transform: uppercase;">Ưu đãi mới nhất</a></li>
					<li><a class="page-scroll" href="#interested"
						style="text-transform: uppercase;">Quan tâm nhất</a></li>
					<li><a class="page-scroll" href="login"
						style="text-transform: uppercase;">Đăng nhập/Đăng ký</a></li>
					<!-- Modal login/register -->

					<!-- ./ -->

					<li><a class="page-scroll" href="#contact"
						style="text-transform: uppercase;">Liên hệ</a></li>

				</ul>
			</div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Header -->
	<header>
		<div class="container">
			<div class="intro-text">
				<div class="row">
					<nav class="navbar navbar-default" style="margin-top: 80px;">
						<div class="container-fluid" style="width: 100%;">
							<ul class="nav navbar-nav"
								style="width: 100%; margin-right: auto; margin-left: 0px;">
								<li class="col-sm-3"></li>
								<li class="col-sm-2" style="text-align: center;"><select
									class="dropbtn" style="text-align: center;">
										<option>Chọn địa điểm</option>
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
								<li class="col-sm-2"><select class="dropbtn"
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
								<li class="col-sm-2"><select class="dropbtn"
									style="text-align: center;">
										<option value="" class="dropdown-header">Chọn khung
											giờ</option>
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
									<form style="width: 100%; height: 9vh;">
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
	</header>

	<!-- Portfolio Grid Section -->
	<section id="portfolio" class="bg-light-gray">
		<div class="container">
			<div class="row">
				<div class="col-sm-1 col-md-1 col-xs-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-xs-2 col-lg-2"
					style="text-align: center;">
					<img alt="" src="img/search.png" class=" img-responsive"
						style="height: 6vh; width: 6vh; float: center; display: block; margin: 0 auto;">
					<p style="font-size: 13px;">Tìm kiếm ưu đãi</p>
				</div>
				<div class="col-sm-2 col-md-2 col-xs-2 col-lg-2"></div>
				<div class="col-sm-2 col-md-2 col-xs-2 col-lg-2"
					style="text-align: center;">
					<img alt="" src="img/menu.png" class="img-responsive"
						style="height: 6vh; width: 6vh; float: center; display: block; margin: 0 auto;">
					<p style="font-size: 13px;">Đặt bàn nhanh chóng</p>
				</div>
				<div class="col-sm-2 col-md-2 col-xs-2 col-lg-2"></div>
				<div class="col-sm-2 col-md-2 col-xs-2 col-lg-2"
					style="text-align: center;">
					<img alt="" src="img/piggy-bank.png" class=" img-responsive"
						style="height: 6vh; width: 6vh; float: center; display: block; margin: 0 auto;">
					<p style="font-size: 13px;">Tiết kiệm thả ga</p>
				</div>
				<div class="col-sm-1 col-md-1 col-xs-1 col-lg-1"></div>

			</div>
			<div class="row" style="margin-top: 50px; margin-bottom: 30px;">
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
				<div class="col-lg-10 text-center col-xs-8 col-sm-10">
					<h2 class="section-heading">Ưu đãi đặc biệt</h2>
				</div>
				<div class="col-lg-1 col-xs-3 col-sm-1" style="margin-top: 10vh;">
					<a href="#">Xem thêm</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-800x350_black-stone-bbq-635979749774097616-636051255363594458.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-tung-bung-khai-truong-buffet-dimsum-kem-lau-hong-kong-kowloon%20(15)-636051255528798749.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-dishes-french-grill-restaurant-hanoi-636051255674503004.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-mobile-640x400_sashi-mi2-jp-744-635693574210667013-636051255828475275.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- lastsafe Section -->
	<section id="lastsafe" class="">
		<div class="container">
			<div class="row" style="margin: 5vh">
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
				<div class="col-lg-10 text-center col-xs-10 col-sm-10">
					<h2 class="section-heading">Ưu đãi mới nhất</h2>
				</div>
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-800x350_black-stone-bbq-635979749774097616-636051255363594458.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-tung-bung-khai-truong-buffet-dimsum-kem-lau-hong-kong-kowloon%20(15)-636051255528798749.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-dishes-french-grill-restaurant-hanoi-636051255674503004.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-mobile-640x400_sashi-mi2-jp-744-635693574210667013-636051255828475275.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ==================#interested selection ============= -->
	<section id="interested" class="bg-light-gray">
		<div class="container">
			<div class="row" style="margin: 5vh">
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
				<div class="col-lg-10 text-center col-xs-10 col-sm-10">
					<h2 class="section-heading">Quan tâm nhất</h2>
				</div>
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-800x350_black-stone-bbq-635979749774097616-636051255363594458.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-tung-bung-khai-truong-buffet-dimsum-kem-lau-hong-kong-kowloon%20(15)-636051255528798749.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-dishes-french-grill-restaurant-hanoi-636051255674503004.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 portfolio-item"
					style="padding: 5px; border: 1px solid #ddd; border-radius: 2px;">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <span class="label label-danger noty-safe">10% OFF</span> <img
						src="https://media.foody.vn/biz_banner/foody-foody-mobile-640x400_sashi-mi2-jp-744-635693574210667013-636051255828475275.jpg"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="color: #4B8706">Quán nướng</h4>
						<p
							style="font-style: normal; font-size: 14px; margin-bottom: 10px; color: #56380E">100
							Lý thái tổ / Hai bà trưng</p>
						<span class="label label-success label-time-safe">Từ 10:00
							AM đến 12:30 AM</span>

						<p
							style="font-style: normal; font-size: 13px; margin-top: 25px; color: #D6BE08">Áp
							dụng tất cả các ngày trong tuần</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Clients Aside -->
	<aside class="clients">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img src="img/logos/envato.jpg"
						class="img-responsive img-centered" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img src="img/logos/designmodo.jpg"
						class="img-responsive img-centered" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img src="img/logos/themeforest.jpg"
						class="img-responsive img-centered" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img src="img/logos/creative-market.jpg"
						class="img-responsive img-centered" alt="">
					</a>
				</div>
			</div>
		</div>
	</aside>

	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">Contact Us</h2>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Your Name *" id="name" required
										data-validation-required-message="Please enter your name.">
									<p class="help-block text-danger"></p>
								</div>
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" id="email" required
										data-validation-required-message="Please enter your email address.">
									<p class="help-block text-danger"></p>
								</div>
								<div class="form-group">
									<input type="tel" class="form-control"
										placeholder="Your Phone *" id="phone" required
										data-validation-required-message="Please enter your phone number.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<textarea class="form-control" placeholder="Your Message *"
										id="message" required
										data-validation-required-message="Please enter a message."></textarea>
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-12 text-center">
								<div id="success"></div>
								<button type="submit" class="btn btn-xl">Send Message</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Your Website 2016</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap -->

	<!-- jQuery -->
	<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
	<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=contextPath%>/lib/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="<%=contextPath%>/lib/jquery/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>
	<script src="js/customer.js"></script>
	<!-- Theme JavaScript -->
	<script src="<%=contextPath%>/js/agency.min.js"></script>

</body>
</html>