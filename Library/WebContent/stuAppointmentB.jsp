<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.OrderForm"%>
<%@page import="cn.cumt.library.form.OrderReactForm"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="user" scope="page" class="cn.cumt.library.dao.UserDao" />
<jsp:useBean id="orderReact" scope="page"
	class="cn.cumt.library.dao.OrderReactDao" />
<jsp:useBean id="countTime" class="cn.cumt.library.tool.CountTime"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>相约自习区_具体内容展示</title>

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
<style type="text/css">
#icon:hover {
	color: white;
}

#main {
	float: right;
	height: 1020px;
	background-color: #CFCFCF;
}

#submain {
	float: right;
	margin-right: 5%;
	background-color: white;
	height: 990px;
	width: 90%;
}

#submain img {
	margin-top: 5px;
	margin-left: 8px;
	float: left;
}

#divide {
	height: 0px;
	float: left;
	width: 89%;
	border: none;
	margin-top: 0px;
	margin-bottom: 0px;
	border-top: 2px solid #cfcfcf;
}

#date {
	margin-right: 50px;
}

#date p {
	font-size: 25pt;
	font-family: Arial;
	padding-left: 80px;
	padding-top: 30px;
	margin-bottom: 0px;
}

#place {
	clear: both;
}

#place p {
	clear: both;
	font-size: 25pt;
	font-family: 微软雅黑;
	padding-left: 80px;
	margin-bottom: 0px;
}

#subleft {
	background-color: white;
	margin-top: 0px;
	float: left;
	height: 40%;
	width: 25%;
}

#subuser {
	height: 100px;
}

#subuser img {
	width: 64%;
	height: 100%;
	margin-top: 20px;
	margin-left: 18%;
}

#subusername, #subusername3 {
	height: 20px;
	width: 64% background-color:black;
}

#subusername3 {
	padding-top: 18px;
}

#subusername p {
	text-align: center;
	font-size: 11pt;
	font-family: Arail;
	font-weight: bold;
}

#subusername3 p {
	text-align: center;
	font-size: 11pt;
	font-family: Arail;
	font-weight: bold;
}

#subright {
	background-color: #EAEAEA;
	margin-top: 0px;
	float: left;
	width: 72%;
	overflow:auto;
}

#carousel-example-generic {
	margin-top: 15px;
	margin-left: 5px;
	width: 98%;
}

#content {
	margin-top: 5px;
}

#tbl {
	margin-left: 13px;
	width: 96.7%;
}

#trhead td {
	background-color: black;
	padding-top: 5px;
	height: 35px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: white;
}

#trele td {
	background-color: white;
	padding-top: 5px;
	height: 55px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: black;
}

#order {
	margin-top: 30px;
	padding-top: 35px;
	background-color: #CFCFCF;
	height: 270px;
	margin-left: 13px;
	width: 96.7%;
}

#tbl2 {
	margin-left: 0px;
	width: 100%;
}

#trele1 td {
	background-color: black;
	padding-top: 5px;
	height: 35px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: white;
}

#trele1 input {
	width: 70%;
	margin-bottom: 4px;
}

#trele2 input {
	width: 70%;
	margin-bottom: 4px;
}

#trele2 td {
	background-color: white;
	padding-top: 5px;
	height: 55px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: black;
}

#trele3 td {
	background-color: white;
	padding-top: 5px;
	height: 105px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: black;
}

#trele3 td textarea {
	float: left;
	width: 96%;
	height: 80px;
}

#trele4 td {
	background-color: white;
	padding-top: 5px;
	height: 55px;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;
	color: black;
}

#trele4 td input {
	float: right;
	margin-right: 15px;
}

#footerword {
	clear: both;
	background-color: black;
	width: 100%;
	height: 30px;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<%
		UserForm form = (UserForm) session.getAttribute("form");
		OrderForm orderForm = (OrderForm) request.getAttribute("orderForm");
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



		<div id="main" class="col-md-9 col-sm-12 col-xs-12">
			<div id="submain" class="row">
				<div id="date" class="col-md-12 col-sm-12 col-xs-12">
					<p>
						当前日期：<%=countTime.currentlyTime()%></p>
				</div>
				<div>
					<hr id="divide" />
				</div>
				<div id="place">
					<p><%=orderForm.getOrderAddress()%><%=orderForm.getOrderMajor()%>学习<%=orderForm.getOrderSubject()%></p>
				</div>
				<div id="subleft">
					<div id="subuser">
						<img src="<%=user.selectUserPicture(orderForm.getUserId())%>" />
					</div>
					<br />
					<div id="subusername">
						<p><%=user.selectUserNickName(orderForm.getUserId())%></p>
					</div>
					<br />
					<div id="subusername">
						<p>订单时间：</p>
					</div>
					<div id="subusername3">
						<p><%=orderForm.getOrderDate()%></p>
					</div>
				</div>
				<div id="subright">
					<div id="show">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>

							<div class="carousel-inner" role="listbox" id="show">
								<div class="item active">
									<img src="<%=orderForm.getOrderPicture()%>" alt="...">
									<div class="carousel-caption">。。。</div>
								</div>
								<div class="item">
									<img src="images/jpg_005.jpg" alt="...">
									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img src="images/jpg_004.jpg" alt="...">
									<div class="carousel-caption"></div>
								</div>
							</div>

							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div id="content">
						<table id="tbl">
							<tr id="trhead">
								<td>自习室位置</td>
								<td>预约座位数</td>
							</tr>
							<tr id="trele">
								<td><%=orderForm.getOrderAddress()%></td>
								<td><%=orderForm.getOrderSeat()%></td>
							</tr>
						</table>
					</div>
					<div id="order">
						<form action="orderReactAction.do?action=1" method="post"
							name="form" id="form1">
							<table id="tbl2">
								<tr id="trele1">
									<td>用户ID：</td>
									<td><input type="hidden" name="userId"
										value="<%=form.getUserId()%>" class="form-control"
										aria-label="用户ID"> <input type="hidden" name="orderId"
										value="<%=orderForm.getOrderId()%>" class="form-control"
										aria-label="用户ID"> <%=form.getUserId()%></td>
									<td>&emsp;&emsp;&emsp;&emsp;</td>
								</tr>
								<tr id="trele2">
									<td>用户电话：</td>
									<td><input type="text" name="orderPhone"
										class="form-control" aria-label="用户密码"></td>
									<td>&emsp;&emsp;&emsp;&emsp;</td>
								</tr>
								<tr id="trele3">
									<td>用户留言：</td>
									<td colspan="2"><textarea name="orderReactContent"></textarea></td>
								</tr>
								<tr id="trele4">
									<td colspan="3"><input type="submit" id="store"
										data-loading-text="Loading..." class="btn btn-primary"
										autocomplete="off" value="提交" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footerword">
		<span>Copyright &copy; 2015.Company name All rights
			reserved.Sixth Team</span>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
