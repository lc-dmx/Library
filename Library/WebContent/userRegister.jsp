<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户注册</title>

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
	padding-left: 41%;
	padding-top: 130px;
}

#findpwd {
	padding-top: 20px;
	padding-left: 30%;
}

#form1 table {
	margin-left: 30%;
}

#reg, #rega {
	font-size: 14pt;
	font-family: 微软雅黑;
	font-weight: bold;
	color: white;
}

#text_1 select {
	font-size: 14pt;
	font-family: 幼圆;
	font-weight: bold;
	color: black;
}

#reg td input {
	width: 260px;
}

#rega td input {
	width: 80px;
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

#img {
	visibility: hidden;
}
</style>
<!-- 检查用户的学号填写、密码确认、表单是否为空 -->
<script type="text/javascript" src="js/checkUser.js"></script>

<script type="text/javascript">
 
	var inv = false;	//身份证验证是否成功
	var unv = false;	//用户名验证是否成功

	function validate(item, value) {
		var ctl = $("#" + item);
		ctl.next().css("visibility", "visible");
		$.get(
			"Register", 
			{ item: item, value: value }, 
			function(sv){
				ctl.next().css("visibility", "hidden");
				ctl.css("border-color", !sv.Success ? "red" : "gray");
				if (item == "userId") unv = sv.Success;
				if (!sv.Success) {
					alert(sv.Message);
				}
			}
		);
	}

	$(document).ready(function(){
			$("#userId").blur(function(){
				validate(this.id, $(this).val());
			});
		}		
	);
</script>

</head>
<body>
	<div class="container-fluid" id="container">
		<div class="row">
			<div class="col-lg-12" id="bodyimg">
				<div id="bodyimg">
					<div id="title">
						<p>用户注册</p>
					</div>
					<div id="findpwd">
						<form name="form" method="post" action="userAction.do?action=1"
							onSubmit="return checkUser(form)">
							<table>
								<tr id="reg">
									<td>用户名：</td>
									<td><input type="text" class="form-control"
										aria-label="用户名" name="userId" id="userId" /></td>
								</tr>
								<tr>
									<td colspan="2"><img src="images/roller.gif"
										alt="processing" id="img" /></td>
								</tr>
								<tr id="rega">
									<td>性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
									<td><input type="radio" name="userSex" value="1" />男 <input
										type="radio" name="userSex" value="0" />女</td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
									<td><input type="text" class="form-control"
										aria-label="昵称" name="userNickName" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>


								<tr id="reg">
									<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
									<td><input type="password" class="form-control"
										aria-label="密码" name="userPassword" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>确认密码：</td>
									<td><input type="password" class="form-control"
										aria-label="确认密码" name="confirmedPassword" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
									<td><input type="text" class="form-control"
										aria-label="用户邮箱" name="userEmail" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>提&nbsp;&nbsp;&nbsp;&nbsp;问：</td>
									<td id="text_1"><select class="span3" name="userQuestion">
											<option value="你的高中母校？">你的高中母校？</option>
											<option value="记得你亲妈的手机号吗？">记得你亲妈的手机号吗？</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>回&nbsp;&nbsp;&nbsp;&nbsp;答：</td>
									<td><input type="text" class="form-control"
										aria-label="密保回答" name="userAnswer" /></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="reg">
									<td>学&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
									<td><input type="text" class="form-control"
										aria-label="学生学号" name="userNumber" /> <!-- 开号状态启动 --> <input
										type="hidden" name="userStatus" value="正常"> <!-- 积分开始为5 -->
										<input type="hidden" name="userScore" value="5"></td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr>
									<td colspan="2" id="submit1"><input type="submit"
										id="mySubmit" data-loading- class="btn btn-primary"
										autocomplete="off" value="注&emsp;册" /></td>
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

