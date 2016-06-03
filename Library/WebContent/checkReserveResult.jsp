<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>座位预约</title>
</head>
<body>
	<div align="center">
		<p>
			<strong> 
			<%if (request.getAttribute("result") != null) {
				String result = (String) request.getAttribute("result"); %> 
				<script type="text/javascript">alert(" <%=result%> ");
				window.location.href = 'bookingSystemT.jsp';</script> 
				<%}else{%>
				<script type="text/javascript">window.location.href = 'bookingSystem.jsp';</script> 
				<%} %>
			</strong>
		</p>
	</div>
</body>
</html>
