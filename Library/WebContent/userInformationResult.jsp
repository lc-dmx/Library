<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新信息结果</title>
</head>
<body>
<%  UserForm form=(UserForm)session.getAttribute("form");
 String userLink="userAction.do?action=4&userId="+form.getUserId(); %>
	<div align="center">
		<p>
			<strong> 
				<%String result = (String) request.getAttribute("result"); %> 
				<script type="text/javascript">alert("<%=result%>");
				window.location.href = '<%=userLink%>';</script> 
			</strong>
		</p>
	</div>



</body>
</html>