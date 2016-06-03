<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
<%
	AdminForm form = (AdminForm) session.getAttribute("admin");
%>
<body>
	<div id="head"  class="row">
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
				<div class="col-md-2 col-sm-2">
					<div style="padding: 15px;font-szie:13pt;">
						<ul id="files" class="easyui-tree" style="width:130px;">
							<li data-options="state:'closed'"><span><a href="javascript:void(0);">预约订单管理</a></span>
								<ul>
									<li><span><a href="adminLogined.jsp" id="cart" target="_self">当日预约订单</a></span></li>
									<li><span><a href="adminLogined2.jsp" id="room" target="_self">自习室情况</a></span></li>
								</ul>
							</li>
							<li data-options="state:'closed'"><span><a href="javascript:void(0);">用户信息管理</a></span>
								<ul>
									<li><span><a href="adminLogined3.jsp" id="message" target="_self">用户信息</a></span></li>
								</ul>
							</li>

						</ul>
					</div>
				</div>
				
				<!-- 各种表格的查看 -->
				<div class="col-md-8 col-md-offset-1 col-sm-8 col-sm-offset-1">
				<script type="text/javascript">
					function getData() {
						var page=$('#page').val()-1;
						$.get("query.do", { page: page }, function(m){
							$("#table_1 tr:gt(0)").remove();
							var html = "";
							$("#total").html(m.total);
							
							for (var i=0; i < m.rows.length; i++) {
								var r = m.rows[i];			
								html += "<tr><td>" + r.reserveId + "</td>";
								html += "<td>" + r.userId + "</td>";
								html += "<td>" + r.roomId + "</td>";
								html += "<td>" + r.reserveSeat + "</td>";
								html += "<td><a href=\"servlet/cn.cumt.library.tool.deletedata\" class=\"btn btn-primary\">删除</a></td></tr>";
							}
							$("#table_1").append(html);
							$('#pageCount').html(m.total%10==0?m.total/10:parseInt(m.total/10+1));
						});
					}
					$(document).ready(function(){
				
							$('#page').val(1);
							getData();
				
					});	
					function previous(){
						if($('#page').val()>=2){
							$('#page').val(parseInt($('#page').val())-1);
							getData();
						}else{
						}		
					}
					function next(){
						if(parseInt($('#page').val())<parseInt($('#pageCount').html())){		
							$('#page').val(parseInt($('#page').val())+1);
							getData();
						}		
					}
					function first(){
						$('#page').val(1);
						getData();
					}
					function last(){
						$('#page').val($('#pageCount').html());
						getData();
					}
				</script>
					<table class="table" id="table_1">
						<tr>
							<th>订单编号</th>
							<th>用户编号</th>
							<th>自习室编号</th>
							<th>预约座位数</th>
							<th>操作</th>
						</tr>						
					</table>
					<div id="div1">
						<input type="button" onclick="first()" value="首页"/>
						<input type="button" id="previous" onclick="previous()" value="上一页"/>
						第<input type="text" id="page" size="3"/>页
						<input type="button" id="next" onclick="next()"  value="下一页"/>
						<input type="button" onclick="last()" value="尾页"/>
						共<label id="total">0</label>条记录
						共<label id="pageCount">0</label>页	
					</div>			
				</div>
			</div>	
		</div>
</div>
	
	
	<!-- Footer -->
	<div id="footerword" class="row">
		<span>Copyright &copy; 2015.Company name All rights
			reserved.Sixth Team</span>
	</div>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
