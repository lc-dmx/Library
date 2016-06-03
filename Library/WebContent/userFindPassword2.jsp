<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
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

#question, #answer {
	font-size: 14pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
}

#question td input {
	width: 200px;
}

#answer td input {
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
<!-- 检查表单是否为空和验证答案是否正确 -->
<script type="text/javascript">
function checkQuestion(form) {
		for (i = 0; i < form.length; i++) {
			if (form.elements[i].value == "") {
				alert("表单信息不能为空");
				return false;
			}
		}
			if (document.form.userAnswer.value != document.form.confirmedAnswer.value) {
				window.alert("您输入的问题答案错误");
				return false;
			}
	}
</script>

</head>

<%UserForm form=(UserForm)request.getAttribute("userForm"); %>

<body>
	<div class="container-fluid" id="container">
		<div class="row">
			<div class="col-lg-12" id="bodyimg">
				<div id="bodyimg">
					<div id="title">
						<p>找回密码</p>
					</div>
					<div id="findpwd">
						<form action="userFindPassword3.jsp" method="post" name="form"
							onSubmit="return checkQuestion(form)">
							<table>
								<tr id="question">
									<td>提&emsp;问：</td>
									<td><%=form.getUserQuestion()%></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="answer">
									<td>回&emsp;答：</td>
									<!-- 答案验证、传递用户ID给下一个界面 -->
									<td><input type="hidden" name="userId"
										value="<%=form.getUserId() %>" /></td>
									<td><input type="hidden" name="confirmedAnswer"
										value="<%=form.getUserAnswer() %>" /></td>
									<td><input type="text" class="form-control"
										aria-label="用户邮箱" name="userAnswer" /></td>
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

