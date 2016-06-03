<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.cumt.library.form.PostForm" %>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="cn.cumt.library.form.OrderForm"%>
<%@page import="cn.cumt.library.tool.SessionCounter"%>
<jsp:useBean id="post" scope="page" class="cn.cumt.library.dao.PostDao" />
<jsp:useBean id="order" scope="page" class="cn.cumt.library.dao.OrderDao" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>图书馆系统</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#head {
	/*background-image:url("images/jpg_009.jpg");*/
	FILTER: progid:DXImageTransform.Microsoft.gradient(GradientType=1,
		startColorstr='#CCFFCC', endColorstr='#99CCFF');
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#CCCFCC),
		to(#99CCFF));
	background: -moz-linear-gradient(top, #CCFFCC, #99CCFF);
	background-size: 100% 100%;
	margin-left: 0px;
	margin-right: 0px;
	width: 100%;
	min-height: 720px;
}

#heading {
	padding-left: 0px;
	padding-top: 260px;
	text-align: center;
}

#heading h1 {
	font-size: 15vmin;
	font-weight: bold;
	font-family: 微软雅黑;
	color: white;
}

#heading div {
	text-align: center;
	font-size: 72pt;
	font-family: 微软雅黑;
	font-weight: solid;
	color: white;
}

#headbutton {
	margin-top: 4%;
}

#myButton {
	
}

#a {
	font-size: 12pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: black;
}

#nav {
	font-weight: bolder;
}

#hrtop {
	height: 3px;
	float: left;
	width: 86%;
	border: none;
	border-top: 2px solid #cfcfcf;
}

#hrbottom {
	height: 3px;
	float: right;
	width: 86%;
	border: none;
	border-top: 2px solid #cfcfcf;
}

#heading2 {
	font-size: 28pt;
	font-family: Arial;
	font-weight: bold;
	color: #CFCFCF;
}

#quarter1, #quarter2, #quarter3 {
	clear: both;
}

#descr {
	clear: both;
	width: 84%;
}

#backtotop {
	position: fixed;
	right: 60px;
	bottom: 60px;
	coloe: black;
	font-size: 22pt;
}

#footer {
	clear: both;
	background-color: black;
	width: 100%;
	height: 50%;
}

#footerword {
	clear: both;
	background-color: black;
	width: 100%;
	height: 40px;
	color: white;
	text-align: center;
}

#footerleft, #footerright {
	margin-top: 50px;
	margin-left: 80px;
}

#footerleft, #title {
	font-size: 4vmin;
	font-weight: bold;
	font-family: Arial;
	color: white;
}

#footerright #para {
	font-size: 3vmin;
	font-family: Arial;
	color: white;
}
</style>
</head>
<body>
<!-- 点击链接载入相关资料信息 -->
<%
		String userLink = "userConnection.jsp";
		String shareLink = "userConnection.jsp";
		String stuLink = "userConnection.jsp";
		String bookLink="userConnection.jsp";
		String contactLink="userConnection.jsp";
		UserForm form = null;
		if (session.getAttribute("form") != null) {
			form = (UserForm) session.getAttribute("form");
			userLink = "userAction.do?action=4&userId=" + form.getUserId();
			shareLink="postAction.do?action=0";
			stuLink="orderAction.do?action=0";
			bookLink="bookingSystem.jsp";
			contactLink="contactUs.jsp";
			
		}
	%>

	<div class="row">
		<div id="head" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div id="heading" class="row">
				<h1>初&nbsp;刻&nbsp;图&nbsp;书&nbsp;馆</h1>
			</div>
			<div class="row" id="headbutton">
				<div class="col-xs-6 col-sm-6 col-md-6" style="text-align: right">
					<a href="userLogin.jsp" class="btn btn-primary btn-lg">登&emsp;录</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<a href="userRegister.jsp" class="btn btn-primary btn-lg">注&emsp;册</a>
				</div>
			</div>
		</div>
	</div>

	<!--正文内容  -->

	<div id="lead">
		<nav class="navbar navbar-default navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">初&emsp;刻</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active" id="nav"><a href="#">首&emsp;页</a></li>
					<li id="nav"><a href="<%=shareLink%>">学习分享区</a></li>
					<li id="nav"><a href="<%=stuLink%>">相约自习区</a></li>
					<li id="nav"><a href="<%=bookLink%>">自习室预约系统</a></li>
					<li id="nav"><a href="<%=userLink%>">个人信息中心</a></li>
					<li class="dropdown" id="nav"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">关于我们 <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="adminLogin.jsp">后台管理系统</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=contactLink%>">联系我们</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="dataCenter.jsp">学习资料分享中心</a></li>
						</ul></li>
					<li id="nav"><a href="#">在线人数:<%=SessionCounter.getActivesessions()%>人</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>




	<div id="quarter1">
		<p>
			&emsp;&emsp;&emsp;&emsp;<a href="<%=shareLink%>" id="heading2">学习分享区</a>
		</p>
		<hr id="hrtop" />
		<p id="descr">学习分享区是中国矿业大学师生交流分享学习经验的展示区，您可以点击图片查看详细信息，也可以从导航栏位置进入，分享您的学习经验！</p>
		<div class="row">

			<%
	List postList = post.selectPost();
	PostForm postForm1 = (PostForm) postList.get(0);
			%>

			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse1" aria-expanded="false"
					aria-controls="collapseExample"> <img
					src="<%=postForm1.getPostPicture1() %>" alt="照片分享">
				</a>
				<div class="collapse" id="collapse1">
					<div class="well">
						<p>
							<a><%=postForm1.getPostTitle() %></a>
						</p>
					</div>
				</div>
			</div>
			<%	PostForm postForm2 = (PostForm) postList.get(1); %>
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse2" aria-expanded="false"
					aria-controls="collapseExample"> <img
					src="<%=postForm2.getPostPicture1() %>" alt="...">
				</a>
				<div class="collapse" id="collapse2">
					<div class="well">
						<p>
							<a><%=postForm2.getPostTitle() %></a>
						</p>
					</div>
				</div>
			</div>
			
			<%	PostForm postForm3 = (PostForm) postList.get(2); %>			
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse3" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=postForm3.getPostPicture1() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse3">
					<div class="well">
						<p>
							<a><%=postForm3.getPostTitle() %></a>
						</p>
					</div>
				</div>
			</div>
			
			<%	PostForm postForm4 = (PostForm) postList.get(3); %>	
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse4" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=postForm4.getPostPicture1() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse4">
					<div class="well">
						<p>
							<a><%=postForm4.getPostTitle() %></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<hr id="hrbottom" />
		<br />
	</div>

	<div id="quarter2">
		<p>
			&emsp;&emsp;&emsp;&emsp;<a href="<%=stuLink%>" id="heading2">相约自习区</a>
		</p>
		<hr id="hrtop" />
		<p id="descr">在相约自习区中，您可以预定在图书馆订座系统中多订几个座位，发出自习相约邀请，让自习不再孤单，让问题不再独自面对，根据学科科目寻找有共同学习目的的小伙伴，说不定，你还能找到兴趣相投的她呢！</p>
		<div class="row">
					<%
	List orderList = order.selectOrder();
	OrderForm orderForm1 = (OrderForm) orderList.get(0);
			%>
		
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse21" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=orderForm1.getOrderPicture() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse21">
					<div class="well">
						<p>
							<a><%=orderForm1.getOrderSubject() %></a>
						</p>
					</div>
				</div>
			</div>
<%	OrderForm orderForm2 = (OrderForm) orderList.get(1); %>
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse22" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=orderForm2.getOrderPicture() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse22">
					<div class="well">
						<p>
							<a><%=orderForm2.getOrderSubject() %></a>
						</p>
					</div>
				</div>
			</div>
			<%	OrderForm orderForm3 = (OrderForm) orderList.get(2); %>
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse23" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=orderForm3.getOrderPicture() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse23">
					<div class="well">
						<p>
							<a><%=orderForm3.getOrderSubject() %></a>
						</p>
					</div>
				</div>
			</div>
			<%	OrderForm orderForm4 = (OrderForm) orderList.get(3); %>
			<div class="col-xs-6 col-md-3">
				<a class="thumbnail" role="button" data-toggle="collapse"
					href="#collapse24" aria-expanded="false"
					aria-controls="collapseExample"> <img src="<%=orderForm4.getOrderPicture() %>"
					alt="...">
				</a>
				<div class="collapse" id="collapse24">
					<div class="well">
						<p>
							<a><%=orderForm4.getOrderSubject() %></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<hr id="hrbottom" />
		<br />
	</div>

	<div id="quarter3">
		<p>
			&emsp;&emsp;&emsp;&emsp;<a href="<%=bookLink%>" id="heading2">自习室预约系统</a>
		</p>
		<hr id="hrtop" />
		<p id="descr">自习室预约系统是本服务的王牌产品，该服务将接入图书馆数据信息管理系统，同学们可以动态方便的查看图书馆的座位情况，缩短找座位的时间，大大提高学习效率。另一方面，这将更加利于图书馆的优化与建设，将会使图书馆向智能化方向发展。</p>
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="images/1.jpg" alt="...">
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="images/2.jpg" alt="...">
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="images/3.jpg" alt="...">
				</div>
			</div>
		</div>
		<hr id="hrbottom" />
	</div>

	<div id="footer">
		<div class="row">

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div id="footerleft">
					<p>&emsp;&emsp;&emsp;&emsp;More Information</p>
					<p>
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&emsp;www.libraryhome.com.cn
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&emsp;lbraryhome@163.com
					</p>
					<p>
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&emsp;China
						University of Mining &Technology
					</p>
					<p>
						<span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>&emsp;http://pan.baidu.com/s/1dGSGD1
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div id="footerright">
					<p id="title">友情链接</p>
					<p id="para"><a href="http://www.cumt.edu.cn/" target="_blank"> 中国矿业大学官网</a></p>
					<p id="para"><a href="http://lib.cumt.edu.cn/" target="_blank"> 中国矿业大学图书馆</a></p>
					<p id="para"><a href="http://jwchu.cumt.edu.cn/DWWZ/DWWZQianTai/JWB/Index.aspx" target="_blank"> 中国矿业大学教务处</a></p>
					<p id="para"><a href="http://sm.cumt.edu.cn/" target="_blank"> 中国矿业大学管理学院</a></p>
				</div>
			</div>

		</div>
	</div>
	<div id="backtotop">
		<a href="#lead"><span class="glyphicon glyphicon-chevron-up"
			aria-hidden="true"></span></a>
	</div>
	<div class="row">
		<div id="footerword" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<span>Copyright &copy; 2015.Company name All rights
				reserved.Sixth Team</span>
		</div>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>