<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%
	UserForm form = (UserForm) request.getAttribute("form");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人信息管理</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/userLeft.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script language="javascript">
	function quit() {
		if (confirm("确认注销吗？")) {
			window.location.href = "loginOut.jsp";
		}
	}
</script>
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>
<style type="text/css">
#navcon {
	margin-right: 0px;
}

#list_00 img {
	margin-top: 50px;
	width: 144px;
	height: 144px;
}

.jianxi {
	padding-top: 10px;
	padding-bottom: 10px;
}

.xiala {
	color: #B5CAA0;
}

a {
	color: white;
	font-size: 15pt;
	font-family: 宋体;
}

a:hover {
	color: #81C7D4;
}

.row {
	margin: 0px;
}

#header {
	background-color: black;
	width: 100%;
	height: 100px;
	margin-left: 0px;
	margin-right: 0px;
	filter: alpha(opacity = 80);
}

#search {
	margin-left: 6px;
	padding-top: 6px;
	color: white;
	font-size: 30px;
}

#searchpic {
	margin-left: 6px;
	padding-top: 6px;
	color: white;
	font-size: 40px;
}

#heading {
	background-color: black;
	text-align: center;
	width: 100%;
	margin-left: 0px;
	padding-top: 0px;
}

#heading #s {
	font-size: 36pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
}

#heading #r {
	padding-top: 10px;
	margin-bottom: 0px;
	font-size: 24pt;
	font-family: Arial;
	font-weight: bold;
	color: white;
}

#hrhead {
	margin-top: 5px;
	margin-bottom: 0px;
	width: 650px;
	size: 10pt;
	height: 1px;
	border: none;
	border-top: 5px solid white;
}

#listpic {
	color: white;
	font-size: 40px;
	padding-left: 5%;
	background-color: black;
}

#leftside {
	background-color: black;
	border-top: 2px solid #CFCFCF;
	width: 27%;
	margin-left: 1%;
	height: 800px;
	float: left;
}

#touxiang {
	text-align: center;
}

#touxiang img {
	margin-top: 50px;
	width: 144px;
	height: 144px;
}

#username {
	text-align: center;
	margin: 0px auto;
	width: 180px;
	background-color: black;
}

#username p {
	margin-top: 10px;
	color: white;
	font-size: 12pt;
}

#list_01, #list_02, #list_03, #list_04, #list_05, #list_06 {
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: #CFCFCF;
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
	overflow: auto;
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
	height: 700px;
}

#info form {
	padding-top: 25px;
	padding-left: 30px;
}

#info form tr {
	height: 42px;
}

#tda {
	font-size: 15pt;
	font-family: 微软雅黑;
}

#tdb {
	font-size: 13pt;
	font-weight: bold;
	font-family: 微软雅黑;
}

#tdc img {
	width: 190px;
	height: 190px;
	margin-top: 10px;
	float: left;
}

#tdc input {
	clear: left;
	float: left;
}

#store {
	float: right;
	margin-right: 60px;
}

#preview {
	width: 200px;
	height: 200px;
	padding-top: 10px;
	overflow: hidden;
	font-size: 12pt;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}

#footerword {
	clear: both;
	background-color: black;
	width: 100%;
	height: 30px;
	color: white;
	text-align: center;
	padding-top: 6px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/date.css" />
<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.date_input.pack.js"></script>
<!-- 照片预览 -->
<script type="text/javascript" src="js/preview.js"></script>
<script type="text/javascript">
	$(function() {
		$('#date_picker').date_input();
	})
</script>
</head>
<body>
	<%
		String userLink = "userAction.do?action=4&userId="
				+ form.getUserId();
	%>
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
					class="col-xs-6 col-xs-offset-2  
						col-sm-4 col-sm-offset-2 
						col-md-3 col-md-offset-2 
						col-lg-4 col-lg-offset-4">
					<label id="s">个 人 信 息</label>
				</div>
				<div
					class="col-xs-8 col-xs-offset-1 
						col-sm-8 col-xs-offset-1
						col-md-6 col-xs-offset-1
						col-lg-6 col-lg-offset-3">
					<label id="r">SELF INFORMATION</label>
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
					<a href="#leftside"><span class="glyphicon glyphicon-th-list"
						aria-hidden="true"></span></a>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 左侧导航栏 -->
		<div class="navbar navbar-inverse col-md-3 col-xs-12 col-sm-12"
			role="navigation"
			style="float: left; padding-right: 0px; padding-left: 0px;">
			<div class="container" id="navcon">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">导航条</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse row">
					<div class=" col-md-3 col-xs-12 col-sm-12">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="">
								<div class="text-right jianxi" role="tab">
									<a href="#" id="list_00" data-toggle="modal"
										data-target=".bs-example-modal-sm"><img
										src="<%=form.getUserPicture()%>" class="img-circle" /></a><span>&emsp;</span>

								</div>

								<!-- 图像 -->
								<form action="userAction.do?action=9" method="post"
									enctype="multipart/form-data" name="form"
									onSubmit="return checkEmpty(form)">
									<div class="modal fade bs-example-modal-sm" tabindex="-1"
										role="dialog" aria-labelledby="myLargeModalLabel">
										<div class="modal-dialog modal-sm">
											<div class="modal-content" class="text-center">
												<div id="preview" class="row">
													<div class="col-md-12 col-xs-12 col-sm-12">
														<img id="imghead" width="150" height="150" border="0"
															src="<%=form.getUserPicture()%>" alt="头像上传" />
													</div>
												</div>
												<div class="row">
													<div class="col-md-9 col-xs-9 col-sm-9">
														<input type="file" name="userFormFile" id="userFormFile"
															onchange="previewImage(this)" /> <input
															type="hidden" name="userId" value="<%=form.getUserId()%>" />
													</div>
													<div class="col-md-3 col-xs-3 col-sm-3">
														<input type="submit" id="store1"
															data-loading-text="Loading..." class="btn btn-primary"
															autocomplete="off" value="保存" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>

							</div>
							<div class="">
								<div class="text-right jianxi" role="tab" id="headingOne">
									<a href="<%=userLink%>"><%=form.getUserNickName()%></a><span>&emsp;</span>
								</div>
							</div>
							<div class="">
								<div class="text-right jianxi" role="tab" id="headingOne">
									<a href="indexLogined.jsp">首页</a><span>&emsp;</span>
								</div>
							</div>

							<div class="">
								<div class="panel-heading text-right" role="tab" id="headingOne">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="false" aria-controls="collapseOne"> 学习分享 <span
										class="caret"></span>
									</a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse text-right"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<a href="postAction.do?action=0" id="share" class="xiala">学习分享区</a>
									</div>
									<div class="panel-body">
										<a href="shareQuarterC.jsp" id="mycomment" class="xiala">个人分享</a>
									</div>
								</div>
							</div>

							<div class="">
								<div class="panel-heading text-right" role="tab" id="headingTwo">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo"> 相约自习 <span
										class="caret"></span>
									</a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse text-right"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<a href="orderAction.do?action=0" id="study" class="xiala">相约自习区</a>
									</div>
									<div class="panel-body">
										<a href="stuAppointmentC.jsp" id="mymessage" class="xiala">相约消息</a>
									</div>
								</div>
							</div>

							<div class="">
								<div class="panel-heading text-right" role="tab"
									id="headingThree">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										自习室预约系统 <span class="caret"></span>
									</a>
								</div>
								<div id="collapseThree"
									class="panel-collapse collapse text-right" role="tabpanel"
									aria-labelledby="headingThree">
									<div class="panel-body">
										<a
											href="reserveAction.do?action=1&userId=<%=form.getUserId()%>"
											id="booking" class="xiala">预订自习座位</a>
									</div>
									<div class="panel-body">
										<a href="bookingSystemT.jsp" id="myorder" class="xiala">我的预订</a>
									</div>
								</div>
							</div>
							<div class="">
								<div class="text-right jianxi" role="tab" id="headingOne">
									<a href="contactUs.jsp">联系我们</a><span>&emsp;</span>
								</div>
							</div>
							<div class="">
								<div class="text-right jianxi" role="tab" id="headingOne">
									<a href="javascript:quit()">注销退出</a><span>&emsp;</span>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>

		<div id="main" class="col-md-9 col-xs-12 col-sm-12">
			<div id="submain">
				<div>
					<hr id="divide" />
				</div>
				<div id="info">
					<form action="userAction.do?action=3" method="post" name="form">
						<div class="section">
							<div id="userId" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label id="">用户Id：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12"><%=form.getUserId()%>
									<input type="hidden" name="userId"
										value="<%=form.getUserId()%>" />
								</div>
							</div>
							<div id="userNumber" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>学&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userNumber"
										value="<%=form.getUserNumber()%>" class="form-control"
										aria-label="学号">
								</div>
							</div>
							<div id="userNickName" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userNickName"
										value="<%=form.getUserNickName()%>" class="form-control"
										aria-label="用户名称">
								</div>
							</div>
							<div id="userEmail" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userEmail"
										value="<%=form.getUserEmail()%>" class="form-control"
										aria-label="邮箱">
								</div>
							</div>
							<div id="userSex" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
								</div>
								<div id="tdb" class="col-md-9 col-xs-12 col-sm-12">
									<%
										if (form.getUserSex().equals(1)) {
									%>
									<input type="radio" name="userSex" value="1" checked />男生 <input
										type="radio" name="userSex" value="2" />女生
									<%
										} else {
									%>
									<input type="radio" name="userSex" value="1" />男生 <input
										type="radio" name="userSex" value="2" checked />女生
									<%
										}
									%>

								</div>
							</div>

							<div id="userBirthday" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>生&nbsp;&nbsp;&nbsp;&nbsp;日：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userBirthday"
										value="<%=form.getUserBirthday()%>" id="date_picker"
										class="form-control" aria-label="生日" />
								</div>
							</div>


							<div id="userPhone" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>电&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userPhone"
										value="<%=form.getUserPhone()%>" id="form-control"
										class="form-control" aria-label="电话" />
								</div>
							</div>
							<div id="userQuestion" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>密保问题：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userQuestion"
										value="<%=form.getUserQuestion()%>" id="form-control"
										class="form-control" aria-label="密保问题" />
								</div>
							</div>

							<div id="userAnswer" class="row">
								<div id="tda" class="col-md-3 col-xs-12 col-sm-12">
									<label>密保答案：</label>
								</div>
								<div class="col-md-9 col-xs-12 col-sm-12">
									<input type="text" name="userAnswer"
										value="<%=form.getUserAnswer()%>" id="form-control"
										class="form-control" aria-label="密保答案" />
								</div>
							</div>
						</div>
						<input type="submit" id="store" data-loading-text="Loading..."
							class="btn btn-primary" autocomplete="off" value="保存个人信息" />
					</form>



				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div id="footerword">
				<span>Copyright &copy; 2015.Company name All rights
					reserved.Sixth Team</span>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>