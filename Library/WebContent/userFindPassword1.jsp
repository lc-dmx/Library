<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>找回密码</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#container{
	padding-left:0px;
}
#bodyimg {
	background-image: url("images/jpg_014.jpg");
	width: 100%;
	min-height: 100%;
	padding-right:0px;
}
#title p {
	font-size: 7vmin;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
	padding-top: 240px;
}
#email,#username{
	font-size:3vmin;
	font-family:微软雅黑;
	font-weight:bold;
	color:white;
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
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>
</head>
<body>
	<div class="container-fluid" id="container">
		<div class="row">
			<div class="col-lg-12" id="bodyimg">
				<div id="bodyimg" class="row">
					<div id="title" class="col-sm-offset-5 col-md-5 col-md-offset-5">
						<p>找回密码</p>
					</div>
					<div id="findpwd" class="col-md-8 col-md-offset-2">
						<form action="userAction.do?action=7" method="post" name="form"
							onSubmit="return checkEmpty(form)">
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-2 col-md-offset-2" id="username">用户名：</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												aria-label="用户名" name="userId" style="width:220px;"/>
										</div>
									</div>
								</div>
								<div class="col-md-12"><br /></div>
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-2 col-md-offset-2" id="email">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</div>
										<div class="col-md-7"><input type="text" class="form-control"
											aria-label="用户邮箱" name="userEmail" style="width:220px;"/></div>
									</div>
								</div>
								<div class="col-md-12"><br /></div>
								<div class="col-md-12">
									<div class="row">
										<div id="submit1" class="col-md-4 col-md-offset-6">
											<input type="submit" id="mySubmit"
												data-loading-text="Loading..." class="btn btn-primary"
												autocomplete="off" value="找回密码" />
										</div>
									</div>
								</div>
							</div>
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

