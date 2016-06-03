<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

body {
	background: url("images/jpg_014.jpg") center no-repeat;
}

#top {
	margin-top: 5%;
}

#head {
	text-align: center;
}

#head p {
	padding-top: 20px;
	font-size: 32pt;
	font-family: 幼圆;
	font-weight: bold;
	color: white;
}

#spacebr {
	height: 6px;
}

#text_1 td {
	font-size: 14pt;
	font-size: 幼圆;
	font-weight: bold;
	color: white;
}

#findpwd {
	float: left;
	margin-left: 10%;
}

#login td {
	text-align: right;
	padding-left: 0px;
	padding-right: 12%;
}
</style>

<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>

</head>
<body>

	<!-- 存取COOKIE -->
	<%
		String flag = (String) session.getAttribute("flag") == null ? ""
				: (String) session.getAttribute("flag");
		String userId = "";
		String userPassword = "";
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("cookie_user")) {
						String value = cookies[i].getValue();
						if (value != null && !"".equals(value)) {
							userId = cookies[i].getValue().split("-")[0];
							if (cookies[i].getValue().split("-")[1] != null
									&& !cookies[i].getValue().split("-")[1]
											.equals("null")) {
								userPassword = cookies[i].getValue().split(
										"-")[1];
							}
						}
					}
					request.setAttribute("userId", userId);
					request.setAttribute("userPassward", userPassword);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

	<div class="row" id="top">
		<div class="col-md-12" id="head">
			<p>用户登录</p>
		</div>
		<div class="col-md-4 col-md-offset-4">
			<form name="form" method="post" action="userAction.do?action=6"
				onSubmit="return checkEmpty(form)">
				<table>
					<tr id="text_1">
						<td class="col-md-4">用户名：</td>
						<td class="col-md-8"><input type="text" name="userId"
							value="<%=userId%>" class="form-control" aria-label="用户名称" /></td>
						<td class="col-md-3"></td>
					</tr>
					<tr>
						<td colspan="3" id="spacebr"></td>
					</tr>
					<tr id="text_1">
						<td class="col-md-4">密&emsp;码：</td>
						<td class="col-md-8"><input type="password"
							name="userPassword" value="<%=userPassword%>"
							class="form-control" aria-label="用户密码" /></td>
						<td class="col-md-3"></td>
					</tr>
					<tr>
						<td colspan="3" id="spacebr"></td>
					</tr>
					<tr id="text_1">
						<td class="col-md-4">验证码：</td>
						<td class="col-md-8"><input type="text" name="input"
							maxlength=4 class="form-control" aria-label="验证码" /></td>
						<td class="col-md-3"><img
							border=0 src="dimensionCode.jsp"></td>
					</tr>
					<tr id="text_1">
						<td class="col-md-4">记住密码:</td>
						<td class="col-md-8"><input type="checkbox" name="flag" value="1"
							<%if (flag != null) {%> checked value="1" <%} else {%> value="0"
							<%}%> /></td>
						<td class="col-md-3"></td>	
					</tr>

					<tr id="login">
						<td id="findpwd"><a href="userFindPassword1.jsp"
							class="btn btn-primary">找回密码</a></td>
						<td colspan="2" class="col-md-3 col-md-offset-4"><input
							type="submit" id="myButton" value="登&emsp;录"
							class="btn btn-primary" autocomplete="off"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>