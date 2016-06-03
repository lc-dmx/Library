<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.cumt.library.form.ReserveForm"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邀请小伙伴一起自习</title>
</head>
<body>
	<div align="center">
		<p>
			<strong> 
			<%if (request.getAttribute("result") == null) {
   %> <script type="text/javascript">
				window.location.href = 'stuAppointmentA.jsp';</script> 
				<%} else {%> 
				<%String result = (String) request.getAttribute("result"); %> 
				<script type="text/javascript">alert(" <%=result%> ");
				window.location.href = 'bookingSystem.jsp';</script> 
				<%}%>
			</strong>
		</p>
	</div>
</body>
</html>
