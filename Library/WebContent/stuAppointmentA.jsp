<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@ page import="cn.cumt.library.form.ReserveForm"%>
<%@ page import="cn.cumt.library.form.SeatForm"%>
<%@ page import="cn.cumt.library.form.RoomForm"%>
<%@ page import="cn.cumt.library.form.OrderForm"%>
<jsp:useBean id="seatDao" scope="page"
	class="cn.cumt.library.dao.SeatDao" />
<jsp:useBean id="roomDao" scope="page"
	class="cn.cumt.library.dao.RoomDao" />
<jsp:useBean id="reserveDao" scope="page"
	class="cn.cumt.library.dao.ReserveDao" />
<jsp:useBean id="orderDao" scope="page"
	class="cn.cumt.library.dao.OrderDao" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>相约自习区_个人添加</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/userLeft.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="css/sider.css" />
<link href="css/userLeft.css" rel="stylesheet">
<style type="text/css">
#icon:hover {
	color: white;
}

#main {
	float: right;
	height: 800px;
	background-color: #CFCFCF;
}

#submain {
	float: right;
	margin-right: 5%;
	background-color: white;
	height: 800px;
	width: 90%;
}

#divide {
	height: 3px;
	float: left;
	width: 86%;
	border: none;
	margin-top: 50px;
	margin-bottom: 0px;
	border-top: 2px solid #cfcfcf;
}

#info {
	margin-left: 5%;
	margin-right: 0px;
	margin-top: 55px;
	background-color: white;
	width: 92%;
	height: auto;
}

#info form {
	padding-top: 25px;
	padding-left: 20px;
}
#store {
	float: right;
}

#footerword {
	clear: both;
	background-color: black;
	width: 100%;
	color: white;
	text-align: center;
	padding-top: 6px;
}
</style>
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>
<!-- 照片预览 -->
<script type="text/javascript" src="js/preview.js"></script>
</head>
<body>




	<div id="head">
		<div id="header" class="row">
			<div id="searchpic" class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</div>
			<div id="search" class="col-xs-8 col-sm-7 col-md-6 col-lg-4">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">Go!</button>
					</span>
				</div>
			</div>
		</div>
		<div id="heading">
			<div class="row">
				<div
					class="col-xs-6 col-xs-offset-3  
						col-sm-6 col-sm-offset-3 
						col-md-6 col-md-offset-3 ">
					<label id="s">相 约 自 习 区</label>
				</div>
				<div
					class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
					<label id="r">APPOINTMENT QUARTER</label>
				</div>
			</div>
		</div>
		<div id="listpic">
			<div class="row">
				<div
					class="col-xs-1 col-xs-offset-1  
						col-sm-1 col-sm-offset-1
						col-md-1 col-md-offset-2 
						col-lg-1 col-lg-offset-1">
					<a href="#leftside" id="icon"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
	<!-- 左侧导航栏 -->
	<jsp:include page="userLeft.jsp" flush="true" />


	<%  UserForm form=(UserForm)session.getAttribute("form");
	List<SeatForm> seatList = seatDao.selectSeatUserId(form.getUserId());	
	SeatForm seatForm = (SeatForm) seatList.get(0);
%>
	<div id="main" class="col-md-9 col-sm-12 col-xs-12">
		<div class="row">
			<div id="submain">
				<div>
					<hr id="divide" />
				</div>
				
				<div id="info" class="row">
					<form action="orderAction.do?action=1" method="post" name="form"
						enctype="multipart/form-data" class="col-md-12 col-sm-12 col-xs-12 form-horizontal">
						<input type="hidden" name="userId" value="<%=form.getUserId()%>" />
						<input type="hidden" name="orderDate" value="<%=seatForm.getReserveUseTime() %>">
						<input type="hidden" name="orderAddress" class="form-control"
							   value="<%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%>
							          第<%=seatForm.getRows() %>排，第<%=seatForm.getCols() %>列">
						<input type="hidden" name="orderSeat" class="form-control" value="<%=reserveDao.selectReserveSeat(form.getUserId()) %>" />	       
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">预约时间：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
								<label class="control-label"><%=seatForm.getReserveUseTime() %></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">地点定位：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
								<label class="control-label">
									<%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%>
									第<%=seatForm.getRows() %>排，第<%=seatForm.getCols() %>列
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">预约座位数量：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
								<label class="control-label"><%=reserveDao.selectReserveSeat(form.getUserId()) %></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">所学专业：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
								<input type="text" name="orderMajor" class="form-control" aria-label="所学专业"  />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">自习学科：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
								<input type="text" name="orderSubject" class="form-control" aria-label="自习学科"  />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 col-sm-12 col-xs-12 control-label">图&emsp;&emsp;片：</label>
							<div class="col-md-9 col-sm-12 col-xs-12">
							<div id="preview" class="col-md-4 col-sm-12"><img id="imghead" border="0" src="images/jpg_006.jpg" alt="头像上传" class="img-responsive"/></div>
								<input type="file" name="orderFormFile"  id="orderFormFile" onchange="previewImage(this)" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<input type="submit" id="store" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" value="提&emsp;&emsp;交">
							</div>
						</div>																																						          
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	<div id="footerword" class="row">
		<span class="col-md-12 col-sm-12 col-xs-12">Copyright &copy; 2015.Company name All rights reserved.Sixth Team</span>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

