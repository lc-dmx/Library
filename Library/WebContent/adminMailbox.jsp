<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="cn.cumt.library.form.MailboxForm"%>
<%@page import="cn.cumt.library.form.AdminForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>后台管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

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

#navcon{
	margin-right:0px;
}
#list_00,#list_01{
	width:100%;
	text-align:center;
}
#list_00 img {
	margin-top: 50px;
	width: 144px;
	height: 144px;
}
#list_01 a{
	font-size:3vmin;
	font-weight:bold;
	font-family:幼圆;
	color:white;
}
#list_01 a:hover{
	font-size:3vmin;
	font-weight:bold;
	font-family:幼圆;
	color:#0077CC;
}
#submain{
	float:right;
}

#footerword {
	clear: both;
	background-color: black;
	height: 30px;
	color: white;
	text-align: center;
}
</style>

<link rel="stylesheet" type="text/css"
	href="EasyUI/themes/default/easyui.css">
<script type="text/javascript" src="EasyUI/jquery.min.js"></script>
<script type="text/javascript" src="EasyUI/jquery.easyui.min.js"></script>

</head>
<body>
<%
	AdminForm form = (AdminForm) session.getAttribute("admin");
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
					<label id="s">后台管理系统</label>
				</div>
				<div
					class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
					<label id="r">MANAGER SYSTEM</label>
				</div>
			</div>
		</div>
	</div>


	<!-- 左侧导航栏 -->
	<div id="leftside" class="row">
		<div class="navbar navbar-inverse col-md-3 col-xs-12 col-sm-12" role="navigation">
			<div class="container" id="navcon">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">导航条</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse row">
				<ul class="nav nav-pills nav-stacked col-md-3 col-xs-12 col-sm-12">
					<li id="list_00" ><a href="adminLogined.jsp"><img src="images/jpg_013.jpg" class="img-circle" /></a><br /></li>
					<li id="list_01" ><a href="adminLogined.jsp"><%=form.getAdminName() %></a><br /></li>
					<li id="list_01"><a href="adminLogined3.jsp">学习分享区</a><br /></li>
					<li id="list_01"><a href="adminLogined.jsp">相约自习区</a><br /></li>
					<li id="list_01"><a href="adminLogined2.jsp">后台管理系统</a><br /></li>
					<li id="list_01" ><a href="mailboxAction.do?action=0&receiver=<%=form.getAdminName()%>">收件箱</a><br /></li>
					<li id="list_01" ><a href="index.jsp">注销退出</a><br /></li>
				</ul>
				</div>
			</div>
		</div>
		
		<div id="submain" class="col-md-8 col-sm-12 col-xs-12">
			<div>
				<hr id="divide" />
			</div>

			<div class="row">

				<!-- 各种表格的查看 -->
				<div class="col-md-8 col-md-offset-1 col-sm-8 col-sm-offset-1">
					<table class="table" id="table_2">
						<tr>
							<th>发件人</th>
							<th>标题</th>
							<th>内容摘要</th>
							<th>时间</th>
							<th>发件人邮箱</th>
							<th>是否删除</th>
						</tr>
						<%
							List<MailboxForm> list = (List) request.getAttribute("list");
							int number = Integer.parseInt((String) request
									.getAttribute("number"));
							int maxPage = Integer.parseInt((String) request
									.getAttribute("maxPage"));
							int pageNumber = Integer.parseInt((String) request
									.getAttribute("pageNumber"));
							int start = number * 14;//开始条数
							int over = (number + 1) * 14;//结束条数
							int count = pageNumber - over;//还剩多少条记录
							if (count <= 0) {
								over = pageNumber;
							}

							for (int i = start; i < over; i++) {
								MailboxForm mailboxForm = (MailboxForm) list.get(i);
						%>
						<tr>
							<td><%=mailboxForm.getSender()%></td>
							<td><%=mailboxForm.getTitle()%></td>
							<td><%=mailboxForm.getComment()%></td>
							<td><%=mailboxForm.getDate()%></td>
							<td><%=mailboxForm.getEmail()%></td>
							<td><button type="button" class="btn btn-primary btn-xs">删除</button></td>
						</tr>


						<%
							}
						%>

					</table>
					<table width="90%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr align="center">
							<td width="13%">共<%=maxPage%>页
							</td>
							<td width="16%">共<%=pageNumber%>条记录
							</td>
							<td width="14%">当前第<%=number + 1%>页
							</td>
							<td width="19%">
								<%
									if ((number + 1) == 1) {
								%> 上一页 <%
									} else {
								%> <a
								href="mailboxAction.do?action=0&i=<%=number - 1%>"> 上一页</a>
							</td>
							<%
								}
							%>
							<td width="18%">
								<%
									if (maxPage <= (number + 1)) {
								%> 下一页 <%
									} else {
								%> <a
								href="mailboxAction.do?action=0&i=<%=number + 1%>">下一页</a> <%
 	}
 %>
							</td>

						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div id="footerword">
		<span>Copyright &copy; 2015.Company name All rights
			reserved.Sixth Team</span>
	</div>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>


</body>
</html>
