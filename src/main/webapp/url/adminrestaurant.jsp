<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản lý nhà hàng</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- MetisMenu CSS -->
<link href="<%=contextPath%>/lib/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="<%=contextPath%>/css/admin/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=contextPath%>/css/admin/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<%=contextPath%>/css/admin/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=contextPath%>/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/css/admin/admin.css" rel="stylesheet">
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Trần Việt Anh</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-fw"></i> New Comment <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-fw"></i> 3 New Followers <span
									class="pull-right text-muted small">12 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-fw"></i> Message Sent <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-fw"></i> New Task <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="#"><i class="fa fa-edit fa-fw"></i> Nhà hàng<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">Thực đơn</a></li>
							<li><a href="#">Giới thiệu</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i> Đặt bàn<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">Xem thông tin đăt bàn</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
		<!--===================================================-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<h1>Nhà hàng 306 - đường láng</h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="row"
				style="float: center; text-align: center; margin-bottom: 15px;">
				<div class="col-lg-8">
					<img
						src="http://offpeak.vn/assets/restaurant/512/banners/be271d1110be47fc3c9fa3a6646fd8ca.jpg"
						class="img-responsive" alt="">
				</div>
				<div class="col-lg-4" style="border-radius: 0">
					<div class="panel panel-default"
						style="margin-left: 50px; margin-right: 50px;">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Chỉnh sửa thông tin
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="list-group">
								<button href="#" class="list-group-item"
									style="text-align: left;" data-toggle="modal"
									data-target="#edit_info_restaurant">
									<i class=""></i>Cập nhật thông tin nhà hàng<span
										class="pull-right text-muted small"><em></em> </span>
								</button>
								<!-- Modal edit information restaurant -->
								<div class="modal fade" id="edit_info_restaurant" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Cập nhât
													thông tin</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<div class="row" style="padding: 15px; text-align: left;">
														<div class="col-lg-4">Tên nhà hàng</div>
														<div class="col-lg-7">
															<input type="text" class="form-control" id="usr"
																placeholder="Nhà hàng 306 - đường láng">
														</div>
														<div class="col-lg-4">Địa điểm</div>
														<div class="col-lg-7">
															<input type="text" class="form-control" id="usr"
																placeholder="Nhà hàng 306 - đường láng">
														</div>
														<div class="col-lg-4">Thông tin liên hệ</div>
														<div class="col-lg-7">
															<input type="text" class="form-control" id="usr"
																placeholder="Mr. Anh 01677826011">
														</div>
														<div class="col-lg-4">Cập nhập ảnh đại diện</div>
														<div class="col-lg-7">
															<label class="btn btn-default btn-file"> Browse <input
																type="file">
															</label>
														</div>

													</div>


												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary my-button">Save
													changes</button>
											</div>

										</div>
									</div>
								</div>
								<!-- End modal -->
								<button href="#" class="list-group-item"
									style="text-align: left;" data-toggle="modal"
									data-target="#edit_info_sale">
									Cập nhật thông tin giảm giá<span
										class="pull-right text-muted small"><em></em> </span>
								</button>
								<!-- Modal thông tin -->
								<div class="modal fade" id="edit_info_sale" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Cập nhật
													thông tin giảm giá</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<div class="row" style="padding: 15px; text-align: left;">
														<div class="col-lg-3">Từ</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control">
																	<option>1h</option>
																	<option>2h</option>
																	<option>3h</option>
																	<option>4h</option>
																	<option>5h</option>
																	<option>6h</option>
																	<option>7h</option>
																	<option>8h</option>
																	<option>9h</option>
																	<option>10h</option>
																	<option>11h</option>
																	<option>12h</option>
																</select>
															</div>
														</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control" id="sel1">
																	<option>00 m</option>
																	<option>30 m</option>
																</select>
															</div>
														</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control" id="sel1">
																	<option>AM</option>
																	<option>PM</option>
																</select>
															</div>
														</div>
													</div>
													<!-- to -->
													<div class="row" style="padding: 15px; text-align: left;">
														<div class="col-lg-3">Đến</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control">
																	<option>1h</option>
																	<option>2h</option>
																	<option>3h</option>
																	<option>4h</option>
																	<option>5h</option>
																	<option>6h</option>
																	<option>7h</option>
																	<option>8h</option>
																	<option>9h</option>
																	<option>10h</option>
																	<option>11h</option>
																	<option>12h</option>
																</select>
															</div>
														</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control" id="sel1">
																	<option>00 m</option>
																	<option>30 m</option>
																</select>
															</div>
														</div>
														<div class="col-lg-2">
															<div class="form-group">
																<select class="form-control" id="sel1">
																	<option>AM</option>
																	<option>PM</option>
																</select>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-lg-3">Chi tiết giảm giá</div>
														<div class="col-lg-6">
															<input type="text" class="form-control" id="usr"
																placeholder="%">
														</div>
													</div>
													<button class="btn btn-default btn-success"
														style="float: left; margin-bottom: 30px;"
														id="modal-button-add-sale">
														<i class="fa fa-plus-circle" aria-hidden="true"></i>
													</button>
													<div id="content-modal"></div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary my-button">Save
													changes</button>
											</div>

										</div>
									</div>
								</div>
								<!-- ./Modal -->
							</div>
							<!-- /.list-group -->
							<a href="#" class="btn btn-default btn-block my-button">Cập
								nhập</a>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>

			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Thông tin đặt chỗ
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="list-group" style="text-align: center;">
								<h5>Trong ngày</h5>
								<%
									for (int i = 0; i < 5; i++) {
								%>
								<button class="list-group-item" style="text-align: left;"
									onclick="loadReservation(<%=i%>)">
									<i class="fa fa-fw"></i>Anh Trần 2 ghế <span
										class="pull-right text-muted small"><em>9h 30 PM</em> </span>
								</button>
								<%
									}
								%>

							</div>
							<!-- /.list-group -->
							<h5 style="text-align: center;">Xem thêm ngày</h5>
							<a href="#" class="btn btn-default btn-block">View All Alerts</a>
						</div>
						<!-- /.panel-body -->
					</div>


					<!-- /.panel .chat-panel -->
				</div>
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Chi tiết đặt bàn
							<div class="pull-right">
								<div class="btn-group">
									<button type="button"
										class="btn btn-default btn-xs dropdown-toggle"
										data-toggle="dropdown">
										Actions <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><a href="#">Xác nhận</a></li>
										<li><a href="#">Hủy yêu cầu</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" id="content-reservation">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>Tên người đặt bàn</td>
										<td id="name_customer">Anh Trần</td>
									</tr>
									<tr>
										<td>Số ghế đặt</td>
										<td id="count_people_reservation">2 ghế</td>
									</tr>
									<tr>
										<td>Thời gian đặt</td>
										<td id="time_reservation">9h 30</td>
									</tr>
									<tr>
										<td>Email/Face liên hệ</td>
										<td><a href="#" id="email_reservation">tranvietanh.hust@gmail.com</a></td>
									</tr>
									<tr>
										<td>SDT liên hệ</td>
										<td id="phone_number_reservation">01677826011</td>
									</tr>
									<tr>
										<td>Trạng thái</td>
										<td id="status_reservation">Đã xác nhận</td>
									</tr>
								</tbody>
							</table>
							<button class="btn btn-default btn-success"
								style="border-radius: 0;">Xác nhận</button>
							<button class="btn btn-default btn-warning"
								style="border-radius: 0;">Hủy đơn</button>
							<button class="btn btn-default btn-danger"
								style="border-radius: 0;">Report</button>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

				</div>
				<!-- /.col-lg-8 -->

				<!-- /.col-lg-4 -->
			</div>

			<!-- Cập nhật thông tin nhà hàng -->
			<div class="row" style="background: #F7F7EF; padding: 10px;">
				<button class="btn btn-default btn-success my-button">Thêm
					món ăn</button>
				<h2 style="text-align: center;">Danh sách thực đơn</h2>
				<div class="col-lg-4" style="text-align: center;">
					<div style="background-color: #fff;" class="img-thumbnail">
						<img class="img-thumbnail" style="position: relative;"
							id="gallery-listing"
							src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
						<hr>
						<div style="padding: 10px;">
							Tên món ăn: <b>Gà hấp</b><br> Giá: <b>70k</b><br> Giới
							thiệu: gà tươi mạch hoạch được chế biến nguyên con<br>
							<button class="btn btn-default btn-success"
								style="float: center; padding-top: 10px;">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</button>
						</div>


					</div>
				</div>
				<div class="col-lg-4" style="text-align: center;">
					<div style="background-color: #fff;" class="img-thumbnail">

						<img class="img-thumbnail" style="position: relative;"
							id="gallery-listing"
							src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
						<hr>

						<div style="padding: 10px;">
							Tên món ăn: <b>Gà hấp</b><br> Giá: <b>70k</b><br> Giới
							thiệu: gà tươi mạch hoạch được chế biến nguyên con<br>
							<button class="btn btn-default btn-success"
								style="float: center; padding-top: 10px;">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</button>
						</div>


					</div>
				</div>
				<div class="col-lg-4" style="text-align: center;">
					<div style="background-color: #fff;" class="img-thumbnail">

						<img class="img-thumbnail" style="position: relative;"
							id="gallery-listing"
							src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
						<hr>

						<div style="padding: 10px;">
							Tên món ăn: <b>Gà hấp</b><br> Giá: <b>70k</b><br> Giới
							thiệu: gà tươi mạch hoạch được chế biến nguyên con<br>
							<button class="btn btn-default btn-success"
								style="float: center; padding-top: 10px;">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</button>
						</div>


					</div>
				</div>
				<div class="col-lg-4" style="text-align: center;">
					<div style="background-color: #fff;" class="img-thumbnail">

						<img class="img-thumbnail" style="position: relative;"
							id="gallery-listing"
							src="http://offpeak.vn/assets/restaurant/510/gallery/2c5145c7cd66c02354029bed925ce8c6_sq.jpg">
						<hr>

						<div style="padding: 10px;">
							Tên món ăn: <b>Gà hấp</b><br> Giá: <b>70k</b><br> Giới
							thiệu: gà tươi mạch hoạch được chế biến nguyên con<br>
							<button class="btn btn-default btn-success"
								style="float: center; padding-top: 10px;">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</button>
						</div>


					</div>
				</div>

			</div>
			<!-- /.row -->
			<!-- Giới thiệu row -->
			<div class="row" style="padding: 10px;">
				<h2>Giới thiệu nhà hàng</h2>
				<hr>
				<p>MUS*MUS Lẩu hấp mỹ nhân độc lạ duy nhất tại Việt Nam - Lẩu
					tươi ngon tinh khiết tốt cho sức khoẻ và làm đẹp da, đặc biệt ăn
					mãi cũng không tăng cân. Mus*Mus với không gian khiêm tốn nhưng chỉ
					một lần đến đây bạn sẽ cảm thấy một không gian ấm áp, sự phục vụ
					tận tình của nhân viên càng giúp bạn hiểu thêm về văn hóa của xứ sở
					hoa anh đào. Bên cạnh đó, các món ăn mang phong cách Nhật Bản đảm
					bảo tính "Healthy Food" cũng là cam kết mà nhà hàng chúng tôi sẽ
					làm hài lòng tất cả các thực khách. Lẩu hấp Mus Mus là loại lẩu
					được hấp cách thủy (nước hấp được hầm từ gà) đảm bảo vừa lạ, vừa
					ngon,đặc biệt rất tốt cho sức khoẻ vì lẩu hấp sử dụng nguyên liệu
					hoàn toàn tươi mới, không chất bảo quản, không dầu mỡ nên tất cả
					các chất dinh dưỡng và tinh túy của rau củ, hải sản sẽ được giữ
					nguyên Lẩu này kết hợp tuyệt vời với 1 loại nước chấm rất đặc biệt
					được làm từ mè và đậu phộng do đầu bếp Nhật đã nhiều năm sinh sống
					ở Việt Nam nên chắc chắn phù hợp với khẩu vị của người Việt Nam,
					đặc biệt là khách khó tính nhất. Nước chấm ngon cùng với lẩu hấp
					nóng được phục vụ bởi các nhân viên rất nhiệt tình và cởi mở. Vì
					đây là lẩu hấp nên chúng ta có thể order và ăn thỏa thích mà không
					bị giới hạn. Sau khi ăn xong các thức ăn hấp, nước hấp bên dưới
					được hòa quyện giữa nước hầm từ gà và nước soup được chiết xuất từ
					các loại thực phẩm rau củ trong quá trình hấp rất là ngọt, sẽ được
					dùng để chế biến món cơm trứng rất ngon và lạ dưới bàn tay khéo léo
					của nhân viên đã được huấn luyện rất kỹ càng chắc chắn sẽ làm hài
					lòng tất cả thực khách, khách có thể dùng soup chung với mì hay
					miến tùy thích. Giá cả rất là mềm, rất là phù hợp với túi tiền lại
					được ăn thoải mái đến khi nào thấy không thể ăn thêm được nữa. Với
					phương châm Healthy Food, MusMus đã và đang cố gắng mang đến cho
					thực khách những món ăn mang đậm phong cách Nhật với chất lượng tốt
					nhất, kết hợp với phong cách phục vụ chuyên nghiệp góp phần truyền
					bá ẩm thực và văn hóa Nhật Bản tới mỗi người Việt Nam.
				<p>
					<button class="btn btn-default btn-success"
						style="float: center; padding-top: 10px;">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					</button>
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=contextPath%>/lib/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=contextPath%>/lib/metisMenu/metisMenu.min.js"></script>



	<!-- Custom Theme JavaScript -->
	<script src="<%=contextPath%>/js/admin/sb-admin-2.js"></script>
	<!-- Load data with ajax -->
	<script type="text/javascript">
		function loadReservation(id){
			//id danh sách trả về theo mảng
			$('#name_customer').text("Trần Việt Anh");
			$('#count_people_reservation').text("2" + " người");
			$('#email_reservation').text("tranvietanh.hust@gmail.com");
			$('#time_reservation').text("11h 30 AM");
			$('#phone_number_reservation').text("01677826011");
			$('#status_reservation').text("Đã xác nhận");
			
		};
		
		
	</script>
</body>

</html>
