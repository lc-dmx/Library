<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.CommentForm"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论结果</title>
</head>
<body>

	<div align="center">
		<p>
			<strong> 
				<%CommentForm form = (CommentForm) request.getAttribute("commentForm");
				String result = (String) request.getAttribute("result"); %> 
				<script type="text/javascript">
				window.location.href = "postAction.do?action=4&postId=<%=form.getPostId() %>";</script> 
			</strong>
		</p>
	</div>



</body>
</html>