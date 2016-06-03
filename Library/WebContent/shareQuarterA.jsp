<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<jsp:useBean id="countTime" class="cn.cumt.library.tool.CountTime"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>学习分享区_个人添加</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/userLeft.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
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
	font-size: 28pt;
	font-family: Arial;
	font-weight: bold;
	color: white;
}

#hrhead {
	margin-top: 5px;
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

#icon:hover {
	color: white;
}

#touxiang {
	text-align: center;
}

#touxiang img {
	margin-top: 50px;
	width: 144px;
	height: 144px;
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
	margin-top: 5%;
	margin-bottom: 0px;
	border-top: 2px solid #cfcfcf;
}

#info {
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 55px;
	background-color: white;
	height: 700px;
}

#tda label {
	font-size: 3vmin;
	font-weight: bold;
	font-family: 微软雅黑;
	color: black;
}

#mydate {
	font-size: 3vmin;
	font-weight: bold;
	font-family: 幼圆;
	color: black;
}

#description textarea {
	width: 100%;
	height: 100%;
}

#tdc img {
	width: 273px;
	height: 200px;
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
<script type="text/javascript" src="js/preview2.js"></script>
<script type="text/javascript" src="js/preview3.js"></script>
</head>
<body>

	<%
		UserForm form = (UserForm) session.getAttribute("form");
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
					class="col-xs-6 col-xs-offset-3  
						col-sm-6 col-sm-offset-3 
						col-md-6 col-md-offset-3 ">
					<label id="s">学 习 分 享 区</label>
				</div>
				<div
					class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
					<label id="r">SHARE QUARTER</label>
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
					<a href="#leftside" id="icon" onmousemove=""><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 左侧导航栏 -->
		<jsp:include page="userLeft.jsp" flush="true" />

		<div id="main" class="col-md-9 col-sm-12 col-xs-12">
			<div id="submain">
				<div>
					<hr id="divide" />
				</div>

				<div id="info" class="row">
					<form name="form" method="post" action="postAction.do?action=1"
						enctype="multipart/form-data" onSubmit="return checkEmpty(form)"
						class="col-md-10 col-md-offset-1">
						<div class="row" id="userid">
							<div id="tda" class="col-md-4">
								<input type="hidden" name="userId" value="<%=form.getUserId()%>" />
								<label id="">分享时间：</label>
							</div>
							<div class="col-md-8" id="mydate"><%=countTime.currentlyTime()%></div>
						</div>
						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>
						<div class="row" id="name">
							<div id="tda" class="col-md-4">
								<label id="">地点定位：</label>
							</div>
							<div class="col-md-8">
								<input type="text" name="postPosition" class="form-control"
									aria-label="地点定位" />
							</div>
						</div>
						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>
						<div class="row" id="stno">
							<div id="tda" class="col-md-4">
								<label id="">标&emsp;&emsp;题：</label>
							</div>
							<div class="col-md-8">
								<input type="text" name="postTitle" class="form-control"
									aria-label="标题" />
							</div>
						</div>
						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>
						<div class="row" id="content">
							<div id="tda" class="col-md-4">
								<label id="">描&emsp;&emsp;述：</label>
							</div>
							<div id="description" class="col-md-8" style="height: 150px;">
								<textarea name="postContent"></textarea>
							</div>
						</div>
						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>

						<div class="row" id="touxiang">
							<div id="tda" class="col-md-12 col-sm-12">
								<label style="float: left;">图&emsp;&emsp;片：</label>
							</div>
							<div class="col-md-4 col-sm-12">
								<div id="preview" class="col-md-4 col-sm-12">
									<img src="images/jpg_006.jpg" name="touxiang" id="imghead1" />
								</div>
								<input type="file" name="postFormFile1" id="postFormFile1"
									onchange="previewImage(this)" />
							</div>
							<div class="col-md-4 col-sm-12">
								<div id="preview2" class="col-md-4 col-sm-12">
									<img src="images/jpg_006.jpg" name="touxiang" id="imghead2" />
								</div>
								<input type="file" name="postFormFile2" id="postFormFile2"
									onchange="previewImage2(this)" />
							</div>
							<div class="col-md-4 col-sm-12">
								<div id="preview3" class="col-md-4 col-sm-12">
									<img src="images/jpg_006.jpg" name="touxiang" id="imghead3" />
								</div>
								<input type="file" name="postFormFile3" id="postFormFile3"
									onchange="previewImage3(this)" />
							</div>
						</div>

						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>
						<div class="row">
							<div classs="col-md-12">
								<br />
							</div>
						</div>
						<input type="submit" id="store" data-loading-text="Loading..."
							class="btn btn-primary" autocomplete="off" value="提&emsp;&emsp;交" />

					</form>
				</div>
			</div>
		</div>
	</div>


	<div id="footerword" class="row">
		<span class="col-md-12 col-sm-12 col-xs-12">Copyright &copy;
			2015.Company name All rights reserved.Sixth Team</span>
	</div>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>