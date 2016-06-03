<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="cn.cumt.library.tool.SessionCounter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>导航栏部分</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">

	#heading{
		padding-left:0px;
		padding-top:260px;
		text-align:center;
	}
	#heading div{
		text-align:center;
		font-size: 72pt;
		font-family:微软雅黑;
		font-weight:solid;
		color:white;
	}
	#headbutton{
		margin-top:4%;	
	}
	#myButton{
		
	}
	#a{
		font-size: 12pt;
		font-family:微软雅黑;
		font-weight:bold;
		color:black;
	}
	#nav{
		font-weight:bolder;
	}
	#hrtop{
		height:3px;
		float:left;
		width:86%;
		border:none;
		border-top:2px solid #cfcfcf;
	}
	#hrbottom{
		height:3px;
		float:right;
		width:86%;
		border:none;
		border-top:2px solid #cfcfcf;
	}	
	#heading2{
		font-size:28pt;
		font-family:Arial;
		font-weight:bold;
		color:#CFCFCF;
	}
	#quarter1,#quarter2,#quarter3{
		clear:both;
	}
	#descr{
		clear:both;
		width:84%;
	}
	#backtotop{
		position:fixed;
		right:60px;
		bottom:60px;
		coloe:black;
		font-size:22pt;
	}
	#footer{
		clear:both;
		background-color:black;
		width:100%;
		height:50%;
	}
	#footerword{
		clear:both;
		background-color:black;
		width:100%;
		height:30px;
		color:white;
		text-align:center;
	}	
	#footerleft,#footerright{
		margin-top:50px;
		margin-left:80px;
	}
	#footerleft,#title{
		font-size:14pt;
		font-weight:bold;
		font-family:Arial;
		color:white;
	}
	#footerright #para{
		font-size:11pt;
		font-family:Arial;
		color:white;
	}
</style>
<script language="javascript">
	function quit() {
		if (confirm("确认注销吗？")) {
			window.location.href = "loginOut.jsp";
		}
	}
</script>
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
			bookLink="reserveAction.do?action=1&userId=" + form.getUserId();
			contactLink="contactUs.jsp";
			
		}
	%>
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
							<li><a href="<%=contactLink%>">联系我们</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="dataCenter.jsp">学习资料分享中心</a></li>
						</ul></li>
					<li id="nav"><a href="javascript:quit()">注销退出</a></li>
					<li id="nav"><a href="#">在线人数:<%=SessionCounter.getActivesessions()%>人</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	


</body>
</html>