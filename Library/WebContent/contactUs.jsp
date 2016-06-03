<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>联系我们</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
	#head{
		width:100%;
	}
	#icon:hover{
		color:white;
	}
	#header{
		background-color:black;
		width:100%;
		height:100px;
		margin-left:0px;
		margin-right:0px;
		filter:alpha(opacity=80);
	}
	#search{
		margin-left:6px;
		padding-top:6px;
		color:white;
		font-size:30px;
	}
	#searchpic{
		margin-left:6px;
		padding-top:6px;
		color:white;
		font-size:40px;
	}
	#heading{
		background-color:black;
		text-align:center;
		width:100%;
		margin-left:0px; 
		padding-top:0px;
	}
	#heading #s{
		font-size:36pt;
		font-family:微软雅黑;
		font-weight:bold;
		color:white;
	}
	#heading #r{
		padding-top:10px;
		margin-bottom:0px;
		font-size:24pt;
		font-family:Arial;
		font-weight:bold;
		color:white;
	}
	#hrhead{
		margin-top:5px;
		margin-bottom:0px;
		width:650px;
		size:10pt;
		height:1px;
		border:none;
		border-top:5px solid white;
	}
	#listpic{
		color:white;
		font-size:40px;
		padding-left:5%;
		background-color:black;
	}
	.row{
		margin:0px;
	}
	#main{
		height:800px;
		background-color:#CFCFCF;
	}
	#submain{
		background-color:white;
		margin-left:7%;
		margin-right:6%;
		margin-top:40px;
		width:87%;
		height:730px;
	}
	#divide{
		height:3px;
		float:left;
		width:86%;
		border:none;
		margin-top:80px;
		margin-bottom:0px;
		border-top:2px solid #cfcfcf;
	}
	#send{
		float:right;
		margin-right:10px;
	}
	
	#footerword{
		clear:both;
		background-color:black;
		width:100%;;
		color:white;
		text-align:center;
		padding-top:6px;
	}
</style>
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>

</head>
<body>

<%  UserForm form=(UserForm)session.getAttribute("form");
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
			<div class="col-xs-6 col-xs-offset-2  
						col-sm-4 col-sm-offset-2 
						col-md-3 col-md-offset-2 
						col-lg-4 col-lg-offset-4">
				<label id="s">联系我们</label>
			</div>
			<div class="col-xs-8 col-xs-offset-1 
						col-sm-6 col-xs-offset-1
						col-md-6 col-xs-offset-1
						col-lg-6 col-lg-offset-3">
				<label id="r">CONTACT US</label>
			</div>
		</div>
	</div>
	<div id="listpic">
		<div class="row">
			<div class="col-xs-1 col-xs-offset-1  
						col-sm-1 col-sm-offset-1
						col-md-1 col-md-offset-2 
						col-lg-1 col-lg-offset-1">
				<a href="#leftside"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>
			</div>
		</div>
	</div>
</div>

<div class="row">
<!-- 左侧导航栏 -->
	<jsp:include page="userLeft.jsp" flush="true" />

	<div id="main" class="col-md-9 col-sm-12 col-xs-12">
		<div class="row">	
			<div id="submain">	
				<div><hr id="divide"/></div>
				<div class="row"><br /></div>
				<div class="row">
					<form class="col-md-12 col-sm-12 col-xs-12 form-horizontal" name="form" method="post" action="mailboxAction.do?action=1"
							onSubmit="return checkEmpty(form)">
						<input type="hidden" name="receiver" class="form-control" aria-label="用户名称" value="admin1"/>
						<input type="hidden" name="sender" class="form-control" aria-label="用户名称" value="<%=form.getUserId() %>"/>
						<input type="hidden" name="email" class="form-control" aria-label="邮箱" value="<%=form.getUserEmail() %>" />
					<!-- first line -->
						<div class="form-group">
							<label class="col-md-2 col-sm-12 col-xs-12 control-label">用户名称：</label>
							<div class="col-md-10 col-sm-12 col-xs-12">
								<label class="control-label"><%=form.getUserId() %></label>
							</div>
						</div>					
					<!-- second line -->
						<div class="form-group">
							<label class="col-md-2 col-sm-12 col-xs-12 control-label">邮&emsp;&emsp;箱：</label>
							<div class="col-md-10 col-sm-12 col-xs-12">
								<label class="control-label"><%=form.getUserEmail() %></label>
							</div>
						</div>										
					<!-- third line -->
						<div class="form-group">
							<label class="col-md-2 col-sm-12 col-xs-12 control-label">标&emsp;&emsp;题：</label>
							<div class="col-md-10 col-sm-12 col-xs-12">
								<input type="text" name="title" class="form-control" aria-label="标题">
							</div>
						</div>										
					<!-- fourth line -->
						<div class="form-group">
							<label class="col-md-2 col-sm-12 col-xs-12 control-label">内&emsp;&emsp;容：</label>
							<div class="col-md-10 col-sm-12 col-xs-12">
								<textarea name="comment" class="form-control" rows="17"></textarea>
							</div>
						</div>
						<input type="submit" id="send" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" value="发送给我们"/>	
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
