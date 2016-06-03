<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.OrderForm"%>
<%@page import="cn.cumt.library.form.OrderReactForm"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="user" scope="page" class="cn.cumt.library.dao.UserDao" />
<jsp:useBean id="order" scope="page"
	class="cn.cumt.library.dao.OrderDao" />
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
<title>学习分享区_评论展示</title>

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
	height: 1180px;
	background-color: #CFCFCF;
}

#submain {
	float: right;
	margin-right: 5%;
	background-color: white;
	height: 1130px;
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
	font-size: 15pt;
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
	background-color: #CFCFCF;
	margin-top: 0px;
	float: left;
	height: 85%;
	width: 72%;
}

#carousel-example-generic {
	margin-top: 15px;
	margin-left: 5px;
	width: 98%;
}

#content {
	margin: 0px auto;
}

#content p {
	font-size: 12pt;
	font-weight: bold;
	color: black;
	margin-top: 30px;
	margin-right: 5px;
	padding-left: 15px;
	padding-right: 30px;
}

#form1 table {
	margin-left: 6%;
	width: 90%;
}

#td1 {
	width: 385px;
}

#comment {
	font-size: 14pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: black;
}

#td2 textarea {
	width: 95%;
	margin-top: 25px;
	height: 160px;
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
}
</style>
<script Language="JavaScript">
	function deleteOrder(data) {
		if (confirm("确定要删除吗？")) {
			window.location = "orderAction.do?action=2&orderId=" + data;
		}
	}
	function deleteOrderReact(data) {
		if (confirm("确定要删除吗？")) {
			window.location = "orderReactAction.do?action=2&orderReactId="
					+ data;
		}
	}
</script>
</head>
<body>

	<%
		UserForm form = (UserForm) session.getAttribute("form");
		List<OrderForm> orderList = order.selectOrderUser(form.getUserId());
		List<OrderReactForm> orderReactList = orderReact
				.selectOrderReactUser(form.getUserId());
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
					<a href="#leftside" id="icon"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>

				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 左侧导航栏 -->
		<jsp:include page="userLeft.jsp" flush="true" />



		<div id="main" class="col-md-9 col-sm-12">
			<div id="submain">
				<div>
					<hr id="divide" />
				</div>

				<table class="table" id="table_1">
					<tr>
						<th>编号</th>
						<th>自习地址</th>
						<th>自习日期</th>
						<th>赴约状态</th>
						<th>删除约单</th>
						<th>操作</th>
					</tr>
					<%
						for (int i = 0; i < orderList.size(); i++) {
							OrderForm orderForm = (OrderForm) orderList.get(i);
					%>
					<tr>
						<td><%=i%></td>
						<td><%=orderForm.getOrderAddress()%></td>
						<td><%=orderForm.getOrderDate()%></td>
						<td><%=orderForm.getOrderStatus()%></td>
						<td><a
							href="javascript:deleteOrder('<%=orderForm.getOrderId()%>')"
							class="btn btn-primary btn-sm">删除</a></td>
						<td><a
							href="orderAction.do?action=4&orderId=<%=orderForm.getOrderId()%>"
							class="btn btn-primary btn-sm">查看详情</a></td>
					</tr>
					<%
						}
					%>
				</table>
				<table class="table" id="table_2">
					<tr>
						<th>编号</th>
						<th>订单座位</th>
						<th>约吧日期</th>
						<th>是否回应</th>
						<th>删除评论</th>
						<th>操作</th>
					</tr>
					<%
						for (int i = 0; i < orderReactList.size(); i++) {
							OrderReactForm orderReactForm = (OrderReactForm) orderReactList
									.get(i);
					%>
					<tr>
						<td><%=i%></td>
						<td><%=order.selectOrderAddress(orderReactForm.getOrderId())%></td>
						<td><%=orderReactForm.getOrderReactDate()%></td>
						<td><%=orderReactForm.getOrderReactStatus()%></td>
						<td><a
							href="javascript:deleteOrderReact('<%=orderReactForm.getOrderReactId()%>')"
							class="btn btn-primary btn-sm">删除</a></td>
						<td><a
							href="orderAction.do?action=4&orderId=<%=orderReactForm.getOrderId()%>"
							class="btn btn-primary btn-sm">查看详情</a></td>
					</tr>
					<%
						}
					%>
				</table>

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
