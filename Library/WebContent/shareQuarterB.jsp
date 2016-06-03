<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.PostForm"%>
<%@page import="cn.cumt.library.form.CommentForm"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="user" scope="page" class="cn.cumt.library.dao.UserDao"/>
<jsp:useBean id="comment" scope="page" class="cn.cumt.library.dao.CommentDao"/>
<jsp:useBean id="countTime" class="cn.cumt.library.tool.CountTime" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学习分享区_具体内容展示</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/userLeft.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="css/sider.css" />
<style type="text/css">
	#icon:hover{
		color:white;
	}
	#main{
		float:right;
		height:1180px;
		background-color:#CFCFCF;
	}
	#submain{
		float:right;
		margin-right:5%;
		background-color:white;
		height:1130px;
		width:90%;
	}
	#submain img{
		margin-top:5px;
		margin-left:8px;
		float:left;
	}
	#divide{
		height:0px;
		float:left;
		width:89%;
		border:none;
		margin-top:0px;
		margin-bottom:0px;
		border-top:2px solid #cfcfcf;
	}
	#date{
		margin-right:50px;
	}
	#date p{
		font-size:25pt;
		font-family:Arial;
		padding-left:80px;
		padding-top:30px;
		margin-bottom:0px;
	}
	#place{
		clear:both;
	}
	#place p{
		clear:both;
		font-size:25pt;
		font-family:微软雅黑;
		padding-left:80px;
		margin-bottom:0px;
	}
	#subleft{
		background-color:white;
		margin-top:0px;
		float:left;
		height:40%;
		width:25%;
	}
	#subuser{
		height:100px;
	}
	#subuser img{
		width:64%;
		height:100%;
		margin-top:20px;
		margin-left:18%;
	}
	#subusername,#subusername3{
		height:20px;
		width:64%
		background-color:black;
	}
	#subusername3{
		padding-top:18px;
	}
	#subusername p{
		text-align:center;
		font-size:15pt;
		font-family:Arail;
		font-weight:bold;
	}
	#subusername3 p{
		text-align:center;
		font-size:11pt;
		font-family:Arail;
		font-weight:bold;
	}
	#subright{
		background-color:#CFCFCF;
		margin-top:0px;
		float:left;
		height:85%;
		width:72%;
	}
	#carousel-example-generic{
		margin-top:15px;
		margin-left:5px;
		width:98%;
	}
	#content{
		margin:0px auto;
	}
	#content p{
		font-size:12pt;
		font-weight:bold;
		color:black;
		margin-top:30px;
		margin-right:5px;
		padding-left:15px;
		padding-right:30px;
	}
	#form1 table{
   		margin-left:6%;
   		width:90%;
   	}
   	#td1{
   		width:385px;
   	}
	#comment{
   		font-size:14pt;
   		font-family:微软雅黑;
   		font-weight:bold;
   		color:black;
   	}
   	#td2 textarea{
   		width:95%;
   		margin-top:25px;
   		height:160px;
   	}
   	#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
	#footerword{
		clear:both;
		background-color:black;
		width:100%;
		color:white;
		text-align:center;
		
	}
</style>
<!-- <script type="text/javascript" src="js/preview.js"></script> -->
</head>
<body>

<%
	PostForm postForm = (PostForm) request.getAttribute("postForm");
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
			<div class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
				<label id="r">SHARE QUARTER</label>
			</div>
		</div>
	</div>
	<div id="listpic">
		<div class="row">
			<div class="col-xs-1 col-xs-offset-1  
						col-sm-1 col-sm-offset-1
						col-md-1 col-md-offset-2 
						col-lg-1 col-lg-offset-1">
				<a href="#leftside" id="icon"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>

			</div>
		</div>
	</div>
</div>

<div class="row">
<!-- 左侧导航栏 -->
<jsp:include page="userLeft.jsp" flush="true" />
<%
	List<CommentForm> commentList = comment.selectCommentPost(postForm.getPostId());
%>	
	
	

	<div id="main" class="col-md-9 col-sm-12 col-xs-12">	
		<div id="submain">
			<div id="date"><p>当前日期：<%=countTime.currentlyTime()%></p></div>
			<div>
				<hr id="divide"/>
			</div>
			<div id="place"><p><%=postForm.getPostTitle() %></p></div>
			<div id="subleft">
				<div id="subuser">
					<img src="<%=user.selectUserPicture(postForm.getUserId()) %>" />
				</div>
				<br />
				<div id="subusername">
					<p><%=user.selectUserNickName(postForm.getUserId()) %></p>
				</div>
				<br />
				<div id="subusername">
					<p>分享时间：</p>
				</div>
				<div id="subusername3">
					<p><%=postForm.getPostDate() %></p>
				</div>
			</div>
			<div id="subright">
				  	<div id="show">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>
<!-- 三张图片上传显示 -->
						  <div class="carousel-inner" role="listbox" id="show">
						    <div class="item active">
						      <img src="<%=postForm.getPostPicture1() %>" alt="...">
						      <div class="carousel-caption">
						      	。。。
			   				  </div>
						    </div>
						    <div class="item">
						      <img src="<%=postForm.getPostPicture2() %>" alt="...">
						      <div class="carousel-caption">
			   				  </div>						   
						    </div>
						  	<div class="item">
						      <img src="<%=postForm.getPostPicture3() %>" alt="...">
						      <div class="carousel-caption">
			   				  </div>						      
						    </div>
						  </div>

						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>			
					</div>
					<div id="content">
    						<p><%=postForm.getPostContent() %>
    						</p>
					</div>
					
					
					<div id="content">
    						<p>小伙伴们的看法:
    						</p>
					</div>	
<div class="row" style="overflow:auto;height:100px;width:99.9%;">
					<%for (int commentNumber = 0; commentNumber < commentList.size(); commentNumber++) {
						CommentForm commentForm = (CommentForm)commentList.get(commentNumber); %>									
					<div id="content">
    						<p>评论时间：<%=commentForm.getCommentDate() %>
    						</p>
    						<p>小伙伴昵称：<%=user.selectUserNickName(commentForm.getUserId()) %>
    						</p>
    						<p>小伙伴看法：<%=commentForm.getCommentContent() %>
    						</p>
					</div>			
					<%} %>
</div>							
					<div><br /></div>
					<div id="title">
						<form action="commentAction.do?action=1" method="post"  name="form" id="form1">
							<table>
								<tr id="comment">
									<td id="td1">评&emsp;&emsp;论：</td>
									<td id="tdbutton">
										<button type="submit" id="mySubmit" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
	  											提&emsp;&emsp;交
										</button>
									</td>
								</tr>
								<tr>
									<td colspan="2"><br /></td>
								</tr>
								<tr id="comment">
									<td id="td2" colspan="2">
										<textarea  name="commentContent"></textarea>
										<input type="hidden" name="postId" value="<%=postForm.getPostId() %>">
										<input type="hidden" name="userId" value="<%=postForm.getUserId() %>">
									</td>
								</tr>
								
<!-- 						<tr >
							<td >评论照片</td>
							<td >
								<div id="preview">
									<img id="imghead" width="100" height="100" border="0"
										src="images/jpg_006.jpg" alt="评论照片" />
								</div> <input type="file" name="commentFormFile"  id="commentFormFile"
								onchange="previewImage(this)" />
							</td>
						</tr>	 -->							
								
							</table>
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
