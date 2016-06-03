<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请重新输入用户名和邮箱</title>
</head>
<body>

	<%String result=(String)request.getAttribute("result");%>
	<script language='javascript'>alert("<%=result%>");window.location.href='userFindPassword1.jsp';</script>

</body>
</html>