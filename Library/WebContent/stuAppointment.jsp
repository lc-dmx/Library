<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<%@page import="cn.cumt.library.form.OrderForm"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>相约自习区</title>

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
		height:1080px;
		background-color:#CFCFCF;
	}
	#submain{
		float:right;
		background-color:white;
		height:1020px;
		padding-left:5%;
		overflow:auto;
	}
	#subhead1{
		width:260px;
		float:left;
		margin-left:30px;
	}
	#subhead2{
		margin-top:28px;
		margin-right:130px;
		float:right;
		width:130px;
	}
	#subheading{
		margin-top:20px;
		margin-bottom:0px;
		margin-left:30px;
		font-size:24pt;
		font-family:微软雅黑;
		width:260px;
		margin-right:0px;
		color:#CFCFCF;
	}
	#divide{
		height:3px;
		float:left;
		width:86%;
		border:none;
		margin-top:20px;
		border-top:2px solid #cfcfcf;
	}
	#flat1{
		clear:both;
	}
	#flat1 table{
		margin-left:50px;
	}
	#flat2{
		clear:both;
	}
	#flat2 table{
		margin-left:120px;
	}
	#tr_1,#tr_2{
		height:38px;
	}
	#blank{
		width:15px;
		height:166px;
	}
	#tr_3{
		height:86px;
	}
	#td_1{
		width:166px;
		height:166px;
	}
	#td_1 img{
		width:100%;
		height:100%;
	}
	#td_2{
		padding-top:0px;
		padding-bottom:0px;
	}
	#td_2 p{
		font-size:20pt;
		font-family:Arial;
		margin-bottom:0px;
	}
	#td_3{
		padding-top:0px;
		padding-bottom:0px;
	}
	#td_3 p{
		font-size:20pt;
		font-family:微软雅黑;
		margin-bottom:0px;
	}
	#td_4{
		padding-top:0px;
		padding-bottom:0px;
		width:386px;
		height:86px;
	}
	#td_4 p{
		font-size:10pt;
		font-family:Arial;
		margin-bottom:0px;
	}
	#back{
		float:right;
		width:50px;
		height:34px;
	}
	#back span{
		font-size:25pt;
	}
	#page{
		float:left;
		width:260px;
		margin-left:450px;
	}
	#page nav ul{
		margin-top:0px;
	}
	#footerword{
		clear:both;
		background-color:black;
		width:100%;
		height:30px;
		color:white;
		text-align:center;
	}
</style>
</head>
<body>

	<%
	 	UserForm form=(UserForm)session.getAttribute("form");	
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
				<label id="s">相 约 自 习 区</label>
			</div>
			<div class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
				<label id="r">APPOINTMENT QUARTER</label>
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

		<div id="submain" class="col-md-9 col-xs-12 col-sm-12">	
			<div>
				<div id="subhead1">
					<p id="subheading">共同学习</p>
				</div>
				<div id="subhead2">
					<a href="reserveAction.do?action=6&userId=<%=form.getUserId() %>" class="btn btn-primary">找人一起去自习</a>
				</div>
			</div>
			<div><hr id="divide"/></div>
			
			<%
				for (int i = start; i < over; i++) {
					OrderForm orderForm = (OrderForm) list.get(i);
					if(i%2 == 0){
			%>			
			
			
			
			<div id="flat1">
				<table>
					<tr id="tr_1">
						<td id="td_1"  rowspan="3">
							<img src="<%=orderForm.getOrderPicture() %>"/>
						</td>
						<td id="blank" rowspan="3">
						</td>
						<td id="td_2" colspan="2">
							<p>Date：<%=orderForm.getOrderDate() %></p>
						</td>
					</tr>
					<tr id="tr_2">
						<td id="td_3">
							<p><%=orderForm.getOrderAddress() %></p>
						</td>
						<td>&emsp;&emsp;<a href="orderAction.do?action=4&orderId=<%=orderForm.getOrderId() %>" class="btn btn-primary">一起去</a></td>
					</tr>	
					<tr id="tr_3">
						<td id="td_4" colspan="2">
							<p>专业：<%=orderForm.getOrderMajor() %></p>
							<p>所学科目：<%=orderForm.getOrderSubject() %></p>
							<p>预定座位数量：<%=orderForm.getOrderSeat() %></p>
						</td>
					</tr>
				</table>
			</div>
			<div><br /><br /></div>
			
						<%
				}else{
			%>
			
			
			<div id="flat2">
				<table>
					<tr id="tr_1">
						<td id="td_2" colspan="2">
							<p>Date：<%=orderForm.getOrderDate() %></p>
						</td>
						<td id="blank" rowspan="3">
						</td>
						<td id="td_1"  rowspan="3">
							<img src="<%=orderForm.getOrderPicture() %>"/>
						</td>
					</tr>
					<tr id="tr_2">
						<td id="td_3">
							<p><%=orderForm.getOrderAddress() %></p>
						</td>
						<td>&emsp;&emsp;<a href="orderAction.do?action=4&orderId=<%=orderForm.getOrderId() %>" class="btn btn-primary">一起去</a></td>
					</tr>
					<tr id="tr_3">
						<td id="td_4" colspan="2">
							<p>专业：<%=orderForm.getOrderMajor() %></p>
							<p>所学科目：<%=orderForm.getOrderSubject() %></p>
							<p>预定座位数量：<%=orderForm.getOrderSeat() %></p>
						</td>
					</tr>
				</table>
			</div>
			<div id="br"><br /><br /></div>
			<%}} %>			

			

			<div>
				<div id="page">
					<nav id="pagenav">
					<ul class="pagination">
						<li>
						<%if((number+1)==1){%> <a><span aria-hidden="true">&laquo;</span></a> <%}else{%><a
						href="orderAction.do?action=0&i=<%=number-1%>"> <span aria-hidden="true">&laquo;</span></a><%}%>
						</li>
						
						<% 
							for(int i = 1;i<= maxPage; i++){
								out.print("<li><a href=\"orderAction.do?action=0&i=" + (i-1) + "\">" + i+"</a></li>");
							}
						%>

						
						<li>
						<%if(maxPage<=(number+1)){%> <span aria-hidden="true">&raquo;</span> <%}else{%> <a
						href="orderAction.do?action=0&i=<%=number+1%>"><span aria-hidden="true">&raquo;</span></a> <%}%>
						</li>
					</ul>
					</nav>
				</div>
				
				<div id="back">
					<a href="#submain"><span class="glyphicon glyphicon-eject"
						aria-hidden="true"></span></a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footerword">
		<span>Copyright &copy; 2015.Company name All rights reserved.Sixth Team</span>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>