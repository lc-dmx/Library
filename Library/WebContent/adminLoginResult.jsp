<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录结果</title>
</head>
<body>
<%if(request.getAttribute("result")==null){%>
  <%
    session.setAttribute("admin",request.getAttribute("admin"));
  %>
	<script type="text/javascript">window.location.href='userAction.do?action=0';</script>
	<%}else{%>
	<script type="text/javascript">alert('<%=request.getAttribute("result")%>');window.location.href = 'adminLogin.jsp';</script>
	<%}%>
</body>
</html>
