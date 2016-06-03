<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="cn.cumt.library.form.PostForm"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>学习分享区</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/userLeft.css" rel="stylesheet">

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

#listpic {
	color: white;
	font-size: 40px;
	padding-left: 5%;
	background-color: black;
}

#main {
	float: right;
	margin-top: 0px;
	height: 1080px;
	background-color: #CFCFCF;
}

#submain {
	background-color: white;
	height: 1020px;
	overflow: auto;
}

#subhead1 {
	float: left;
}
#subhead2 {
	margin-top: 28px;
	float: right;
}

#subheading {
	margin-top: 20px;
	margin-bottom: 0px;
	margin-left: 30px;
	font-size: 24pt;
	font-family: 微软雅黑;
	color: #CFCFCF;
}

#divide {
	height: 3px;
	float: left;
	width: 86%;
	border: none;
	margin-top: 20px;
	border-top: 2px solid #cfcfcf;
}

#flat1 {
	clear: both;
}

#flat1 table {
	margin-left: 50px;
}

#flat2 {
	clear: both;
}

#flat2 table {
	margin-left: 120px;
}

#tr_1, #tr_2 {
	height: 38px;
}

#blank {
	width: 15px;
	height: 166px;
}

#tr_3 {
	height: 86px;
}

#td_1 {
	width: 166px;
	height: 166px;
}

#td_1 img {
	width: 100%;
	height: 100%;
}

#td_2 {
	padding-top: 0px;
	padding-bottom: 0px;
}

#td_2 p {
	font-size: 20pt;
	font-family: Arial;
	margin-bottom: 0px;
}

#td_3 {
	padding-top: 0px;
	padding-bottom: 0px;
}

#td_3 p {
	font-size: 20pt;
	font-family: 微软雅黑;
	margin-bottom: 0px;
}

#td_4 {
	padding-top: 0px;
	padding-bottom: 0px;
	width: 386px;
	height: 86px;
}

#td_4 p {
	font-size: 10pt;
	font-family: Arial;
	margin-bottom: 0px;
}

#back {
	float: right;
	width: 50px;
	height: 34px;
}

#back span {
	font-size: 25pt;
}

#page,#pagenav {
	float: right;
	margin-left: 0px;
}

#page nav ul {
	margin-top: 0px;
}

#footerword {
	clear: both;
	background-color: black;
	width: 100%;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<%
		List list = (List) request.getAttribute("list");
		int number = Integer.parseInt((String) request
				.getAttribute("number"));
		int maxPage = Integer.parseInt((String) request
				.getAttribute("maxPage"));
		int pageNumber = Integer.parseInt((String) request
				.getAttribute("pageNumber"));
		int start = number * 4;//开始条数
		int over = (number + 1) * 4;//结束条数
		int count = pageNumber - over;//还剩多少条记录
		if (count <= 0) {
			over = pageNumber;
		}
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
				<div class="col-xs-6 col-xs-offset-3  
						col-sm-6 col-sm-offset-3 
						col-md-6 col-md-offset-3 ">
					<label id="s">学 习 分 享 区</label>
				</div>
				<div
					class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
					<label id="r">SHARE QUARTER</label>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 左侧导航 -->
		<jsp:include page="userLeft.jsp" flush="true" />

		<div id="submain" class="col-md-9 col-sm-12 col-xs-12">
			<div class="row">
				<div id="subhead1" class="col-md-8 col-sm-12 col-xs-12">
					<p id="subheading">学习分享</p>
				</div>
				<div id="subhead2" class="col-md-4 col-sm-12 col-xs-12">
					<a href="shareQuarterA.jsp" class="btn btn-primary">学习生活分享</a>
				</div>
			</div>
			<div><hr id="divide" /></div>
				<%
					for (int i = start; i < over; i++) {
						PostForm postForm = (PostForm) list.get(i);
						if (i % 2 == 0) {
				%>

				<div id="flat1">
					<table>
						<tr id="tr_1">
							<td id="td_1" rowspan="3">
								<img class="img-responsive" src="<%=postForm.getPostPicture1()%>" />
							</td>
							<td id="blank" rowspan="3"></td>
							<td id="td_2" colspan="2">
								<p>Date：<%=postForm.getPostDate()%></p>
							</td>
						</tr>
						<tr id="tr_2">
							<td id="td_3">
								<p><%=postForm.getPostTitle()%></p>
							</td>
							<td>&emsp;&emsp;<a
								href="postAction.do?action=4&postId=<%=postForm.getPostId()%>"
								class="btn btn-primary">More</a></td>
						</tr>
						<tr id="tr_3">
							<td id="td_4" colspan="2">
								<p><%=postForm.getPostContent()%></p>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<br /> <br />
				</div>

				<%
					} else {
				%>


				<div id="flat2">
					<table>
						<tr id="tr_1">
							<td id="td_2" colspan="2">
								<p>Date：<%=postForm.getPostDate()%></p>
							</td>
							<td id="blank" rowspan="3"></td>
							<td id="td_1" rowspan="3">
								<img class="img-responsive" src="<%=postForm.getPostPicture1()%>" />
							</td>
						</tr>
						<tr id="tr_2">
							<td id="td_3">
								<p><%=postForm.getPostTitle()%></p>
							</td>
							<td>&emsp;&emsp;<a
								href="postAction.do?action=4&postId=<%=postForm.getPostId()%>"
								class="btn btn-primary">More</a></td>
						</tr>
						<tr id="tr_3">
							<td id="td_4" colspan="2">
								<p><%=postForm.getPostContent()%></p>
							</td>
						</tr>
					</table>
				</div>
				<div id="br">
					<br /> <br />
				</div>
				<%
					}
				}
				%>

			<div id="page" class="col-sm-12 col-md-12">
				<nav id="pagenav">
					<ul class="pagination">
						<li>
							<%
								if ((number + 1) == 1) {
							%> <a><span aria-hidden="true">&laquo;</span></a> <%
	 						} else {
					 		%><a
							href="postAction.do?action=0&i=<%=number - 1%>"> <span
								aria-hidden="true">&laquo;</span></a>
							<%
								}
							%>
						</li>
	
						<%
							for (int i = 1; i <= maxPage; i++) {
								out.print("<li><a href=\"postAction.do?action=0&i=" + (i - 1)
										+ "\">" + i + "</a></li>");
							}
						%>
	
	
						<li>
							<%
								if (maxPage <= (number + 1)) {
							%> <span aria-hidden="true">&raquo;</span>
							<%
								} else {
							%> <a href="postAction.do?action=0&i=<%=number + 1%>"><span
								aria-hidden="true">&raquo;</span></a> <%
	 						}%>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<div id="back">
		<a href="#submain"><span class="glyphicon glyphicon-eject"
			aria-hidden="true"></span></a>
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