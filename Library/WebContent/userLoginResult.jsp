<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页_用户登录成功后</title>
</head>
<body>
	<div align="center">
		<p>
			<strong> 
			<%if (request.getAttribute("result") == null) {
 		UserForm form = (UserForm) request.getAttribute("userForm");
 		session.setAttribute("form", form); %> 
 		<script type="text/javascript">window.location.href='indexLogined.jsp';</script>
				<%} else {%> 
				<%String result = (String) request.getAttribute("result"); %> 
				<script type="text/javascript">alert(" <%=result%> ");
				window.location.href = 'userLogin.jsp';</script> 
				<%}%>
			</strong>
		</p>
	</div>
</body>
</html>
