<%@ page language="java" contentType="text/html; charset=UTF-8" import="javax.servlet.jsp.jstl.fmt.*,java.sql.*,
java.text.SimpleDateFormat,java.util.Calendar,java.util.Date" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.cumt.library.form.UserForm"%>      
<%@ page import="cn.cumt.library.form.ReserveForm"%>
<%@ page import="cn.cumt.library.form.SeatForm"%>
<%@ page import="cn.cumt.library.form.RoomForm"%>
<%@ page import="cn.cumt.library.form.OrderForm"%>
<jsp:useBean id="seatDao" scope="page" class="cn.cumt.library.dao.SeatDao"/>
<jsp:useBean id="roomDao" scope="page" class="cn.cumt.library.dao.RoomDao"/>
<jsp:useBean id="reserveDao" scope="page" class="cn.cumt.library.dao.ReserveDao"/>
<jsp:useBean id="orderDao" scope="page" class="cn.cumt.library.dao.OrderDao" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>自习室预约系统</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/userLeft.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/date.css" />
	<link rel="stylesheet" type="text/css" href="css/seat.css" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
	
	.login-box {
		width: 100%;
		max-width:500px;
		height: 400px;
		position: absolute;
		top: 50%;
		margin-top: 200px;
		/*设置负值，为要定位子盒子的一半高度*/
		
	}
	@media screen and (min-width:500px){
		.login-box {
			left: 50%;
			/*设置负值，为要定位子盒子的一半宽度*/
			margin-left: 0px;
		}
	}	
	
	.form {
		width: 100%;
		max-width:500px;
		height: 275px;
		margin: 25px auto 0px auto;
		padding-top: 25px;
	}	
	.login-content {
		height: 300px;
		width: 100%;
		max-width:500px;
		background-color: rgba(255, 250, 2550, .6);
		float: left;
	}				
	.input-group {
		margin: 0px 0px 30px 0px !important;
	}
	.form-control,
	.input-group {
		height: 40px;
	}
	
	.form-group {
		margin-bottom: 0px !important;
	}
	.login-title {
		padding: 20px 10px;
		background-color: rgba(0, 0, 0, .6);
	}
	.login-title h1 {
		margin-top: 10px !important;
	}
	.login-title small {
		color: #fff;
	}
	
	.link p {
		line-height: 20px;
		margin-top: 30px;
	}
	.btn-sm {
		padding: 8px 24px !important;
		font-size: 16px !important;
	}
	
	#icon:hover{
		color:white;
	}
	#header{
		background-color:black;
		width:100%;
		height:100px;
		margin-left:0px;
		margin-right:0px;
		filter:alpha(opacity=80);
	}
	#search{
		margin-left:6px;
		padding-top:6px;
		color:white;
		font-size:30px;
	}
	#searchpic{
		margin-left:6px;
		padding-top:6px;
		color:white;
		font-size:40px;
	}
	#heading{
		background-color:black;
		text-align:center;
		width:100%;
		margin-left:0px; 
		padding-top:0px;
	}
	#heading #s{
		font-size:8vmin;
		font-family:微软雅黑;
		font-weight:bold;
		color:white;
	}
	#heading #r{
		font-size:7vmin;
		font-family:Arial;
		font-weight:bold;
		color:white;
	}
	#hrhead{
		margin-top:5px;
		width:650px;
		size:10pt;
		height:1px;
		border:none;
		border-top:5px solid white;
	}
	#listpic{
		color:white;
		font-size:40px;
		padding-left:5%;
		background-color:black;
	}
	#main{
		float:right;
		height:1080px;
		background-color:#CFCFCF;
	}
	#submain{
		float:right;
		background-color:white;
		height:1020px;
		overflow:auto;
	}
	#divide{
		height:3px;
		float:left;
		width:86%;
		border:none;
		margin-top:26px;
		border-top:2px solid #cfcfcf;
	}
	#footerword{
		clear:both;
		background-color:black;
		width:100%;
		color:white;
		text-align:center;
	}
</style>
<script type="text/javascript" src="js/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="js/preview.js"></script>
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>
	<script type="text/javascript">
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		})
</script>

</head>
<body>


<div id="head">
	<div id="header" class="row">
		<div id="searchpic" class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</div>
		<div id="search" class="col-xs-8 col-sm-7 col-md-6 col-lg-4">
			<div class="input-group">
		      		<input type="text" class="form-control" placeholder="Search for...">
		      		<span class="input-group-btn" style="vertical-align:top;">
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
				<label id="s">自习预约系统</label>
			</div>
			<div class="col-xs-6 col-xs-offset-3  
						col-sm-6 col-sm-offset-3 
						col-md-6 col-md-offset-3 ">
				<br/>
				<br/>	
				<br/>				
			</div>			
			<div class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
				<label id="r">BOOKING SYSTEM</label>
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
<%  UserForm form=(UserForm)session.getAttribute("form");
 	String userLink="userAction.do?action=4&userId="+form.getUserId(); 
 %>
 <div class="row">
	<!-- 左侧导航栏 -->
	<jsp:include page="userLeft.jsp" flush="true" />
	
<%	Date d = new Date();  
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	String date = format.format(d);    
%>
<script type="text/javascript" src="js/laydate.js"></script>	
		<div id="submain" class="col-md-9 col-sm-12 col-xs-12">	
			<div><hr id="divide"/></div>
					

				
				<table class="table" id="table_2">
					<tr>
						<th>自习室名</th>
						<th>预约时间</th>
						<th>使用时长</th>

						<th colspan="4" style="text-align:center;">具体座位</th>
						<th>删除</th>
						<th>约自习</th>
					</tr>
<%List<SeatForm> seatList=seatDao.selectSeatUserId(form.getUserId()); %>
<% 
if (seatList.size()==0){
%><tr><td>暂无预约信息 </td></tr>    <%   }
else if (seatList.size()==1){
SeatForm seatForm1 = (SeatForm) seatList.get(0);


%>						
					<tr>
						<td><%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%></td>
						<td><%=seatForm1.getReserveUseTime()%></td>
						<td><%=seatForm1.getReserveDuration() %></td>
						<td>第<%=seatForm1.getRows() %>排，第<%=seatForm1.getCols() %>列</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><a href="bookDelete.jsp?userId=<%=form.getUserId()%> " class="btn btn-primary">删除</a></td>
						<td ><a href="reserveAction.do?action=6&userId=<%=form.getUserId()%> " class="btn btn-primary">约自习</a></td>
					</tr>						
<%}else if (seatList.size()==2){
SeatForm seatForm1 = (SeatForm) seatList.get(0);
%>							
					<tr>
						<td><%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%></td>
						<td><%=seatForm1.getReserveUseTime()%></td>
						<td><%=seatForm1.getReserveDuration() %></td>
						<td>第<%=seatForm1.getRows() %>排，第<%=seatForm1.getCols() %>列</td>
<%SeatForm seatForm2 = (SeatForm) seatList.get(1); %>						
						<td>第<%=seatForm2.getRows() %>排，第<%=seatForm2.getCols() %>列</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><a href="bookDelete.jsp?userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">删除</a></td>						
						<td ><a href="reserveAction.do?action=6&userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">约自习</a></td>
					</tr>	
<%}else if (seatList.size()==3){
	SeatForm seatForm1 = (SeatForm) seatList.get(0);
	%>							
	<tr>
		<td><%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%></td>
		<td><%=seatForm1.getReserveUseTime()%></td>
		<td><%=seatForm1.getReserveDuration() %></td>
		<td>第<%=seatForm1.getRows() %>排，第<%=seatForm1.getCols() %>列</td>
<%SeatForm seatForm2 = (SeatForm) seatList.get(1); %>						
		<td>第<%=seatForm2.getRows() %>排，第<%=seatForm2.getCols() %>列</td>
<%SeatForm seatForm3 = (SeatForm) seatList.get(2); %>
		<td>第<%=seatForm3.getRows() %>排，第<%=seatForm3.getCols() %>列</td>
		<td>&nbsp;</td>
						<td><a href="bookDelete.jsp?userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">删除</a></td>		
		<td ><a href="reserveAction.do?action=6&userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">约自习</a></td>
	</tr>	
<%}else if (seatList.size()==4){
	SeatForm seatForm1 = (SeatForm) seatList.get(0);
%>	
	<tr>
		<td><%=roomDao.selectRoomName(reserveDao.selectReserveRoomId(form.getUserId()))%></td>
		<td><%=seatForm1.getReserveUseTime()%></td>
		<td><%=seatForm1.getReserveDuration() %></td>
		<td>第<%=seatForm1.getRows() %>排，第<%=seatForm1.getCols() %>列</td>
<%SeatForm seatForm2 = (SeatForm) seatList.get(1); %>						
		<td>第<%=seatForm2.getRows() %>排，第<%=seatForm2.getCols() %>列</td>
<%SeatForm seatForm3 = (SeatForm) seatList.get(2); %>
		<td>第<%=seatForm3.getRows() %>排，第<%=seatForm3.getCols() %>列</td>
<% SeatForm seatForm4 = (SeatForm) seatList.get(3);%>		
		<td>第<%=seatForm4.getRows() %>排，第<%=seatForm4.getCols() %>列</td>
						<td><a href="bookDelete.jsp?userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">删除</a></td>		
		<td ><a href="reserveAction.do?action=6&userId=<%=form.getUserId()%> " class="btn btn-primary btn-sm">约自习</a></td>
	</tr>						
						
<%} %>						
						

				</table>
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