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
#container {
	padding-left: 0px;
	padding-right: 0px;
	margin-top: 0px;
}

#bodyimg {
	background-image: url("images/jpg_014.jpg");
	max-width: 100%;
	min-height: 100%;
}

#title p {
	font-size: 25pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
	padding-left: 39%;
	padding-top: 240px;
}

#findpwd {
	padding-top: 20px;
	margin-left: 30%;
}

#form1 table {
	margin-left: 0px;
}

#password, #confirmed {
	font-size: 14pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
}

#password td input {
	width: 200px;
}

#confirmed td input {
	width: 200px;
}

#submit1 {
	text-align: right;
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

<!-- 检查用户的学号填写、密码确认、表单是否为空 -->
<script type="text/javascript" src="js/checkUser.js"></script>

</head>
<body>
	<div class="container-fluid" id="container">
		<div class="row">
			<div class="col-lg-12" id="bodyimg">
				<div id="bodyimg">
					<div id="title">
						<p>找回密码</p>
					</div>
					<div id="findpwd">
						<form action="userAction.do?action=8" method="post" name="form"
							onSubmit="return checkUser(form)">
							<table>
								<tr id="password">
									<td>新密码：</td>
									<td><input type="password" class="form-control"
										aria-label="提问" name="userPassword" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="confirmed">
									<td>确认密码：</td>
									<td><input type="password" class="form-control"
										aria-label="用户邮箱" name="confirmedPassword" /></td>
									<td><input type="hidden" name="userId" value="<%=request.getParameter("userId") %>" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr>
									<td colspan="2" id="submit1"><input type="submit"
										id="mySubmit" data-loading-text="Loading..."
										class="btn btn-primary" autocomplete="off" value="找回密码" /></td>
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

