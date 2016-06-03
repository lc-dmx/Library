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
	<link rel="stylesheet" type="text/css" href="css/date.css" />
	<link rel="stylesheet" type="text/css" href="css/seat.css" />
	<link href="css/userLeft.css" rel="stylesheet">

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
		margin-right:5%;
		background-color:white;
		height:1020px;
		width:90%;
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
		height:30px;
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
<%  UserForm form=(UserForm)session.getAttribute("form"); %>

<div class="row">	
	<!-- 左侧导航栏 -->
	<jsp:include page="userLeft.jsp" flush="true" />
	
<%	Date d = new Date();  
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	String date = format.format(d);    
%>
<script type="text/javascript" src="js/laydate.js"></script>	
	<div id="main" class="col-md-9 col-sm-12">	
		<div id="submain">	
			<div><hr id="divide"/></div>
					
			<!-- 各种表格 -->
				<table class="table" id="table_1">
					<tr>
						<th>编号</th>
						<th>自习室编号</th>
						<th>自习室名称</th>
						<th>可预约的座位总数</th>
						<th>剩余座位数</th>
						<th>查看详情</th>
					</tr>
<%List<RoomForm> roomList=roomDao.selectRoom();

for (int i = 0; i < roomList.size(); i++) {
	RoomForm roomForm = (RoomForm) roomList.get(i);
%>						
					<tr>					
						<td><%=i%></td>
						<td><%=roomForm.getRoomId() %></td>
						<td><%=roomForm.getRoomName() %></td>
						<td><%=roomForm.getRoomSeatSum() %></td>
						<td><%=roomForm.getRoomSeatRest() %></td>
						<td>						
							<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo">预&emsp;约</button>
							<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
					            <div class="demo clearfix" style="background-color:white;">
					                <!---左边座位列表-->
					                <div id="seat_area">
					                    <div class="front">自习室</div>					
					                </div>
					                <!--右边选座信息-->
					                <form >
					                <div class="booking_area" style="width:250px;">
					                	<input type="hidden" value="<%=form.getUserId()%>" name="userId" id="userId">
					                    <p>当前日期：<input type="text" readonly name="reserveDate" id="reserveDate" value=<%=date %> /></p>
                    					<p>预定时间：</p>
                    					<div class="demo2">
											<input placeholder="请输入日期" name="reserveUsetime" id="reserveUsetime" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" />
										</div>
										<script type="text/javascript">
											!function(){
												laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
												laydate({elem: '#demo'});//绑定元素
											}();
										</script>
										<p>预定时长：<input type="text" name="reserveDuration" id="reserveDuration"/></p>
					                    <p>座位：</p>
					                    <ul id="seats_chose" /></ul>
					                    <p>已定座位数：<span id="tickects_num">0</span></p>
					                    <input type="button" class="btn" id="book" value="预定"/>
					                    <div id="legend"></div>
					                </div>
					                </form>
					            </div>
					        </div>					
						</td>
					</tr>
					<%} %>			
				</table>		
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
    <script type="text/javascript" src="js/jquerySeat.js"></script>
        <script type="text/javascript" src="js/jquery.seat-charts.min.js"></script>       
        <script type="text/javascript">
            
	        <%
		        try {
		        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		        	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=library","sa","wstxyxy1212");
		        	PreparedStatement stmt = conn.prepareStatement("select rows,cols from seat where status='unavailable'"); 
		        	ResultSet rs= stmt.executeQuery();
		        	out.print("var rcs = \"");
		        	while(rs.next()){
		        		String rows = rs.getString(1);
		        		String cols = rs.getString(2);
		            	String RowCol=rows+"_"+cols;
		            	
		            	out.print(RowCol + ";");
		        	}
		        	out.print("\";");
		        	stmt.close();
		        	conn.close();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
	        %>
        
            $(document).ready(function() {
            	        		
            	$("#book").click(function(){
            		
            		var rc = "";
            		
            		$("li[data-row]").each(function(i){
            			rc += $(this).data("row") + "#" + $(this).data("col");
            			if($("li[data-row]").length!=i+1){
            				rc += ",";
            			}
            			
            		});
            		            		
            		$.post("BookCount.do",{seats: rc, totalCount: sc.find('selected').length,userId:$("#userId").val(),reserveDate: $("#reserveDate").val() ,reserveUsetime:$("#reserveUsetime").val(),reserveDuration:$("#reserveDuration").val()},function(data){
            			alert("预订成功");window.location.href = 'bookValidate.jsp';
            		});
            	});
                var $cart = $('#seats_chose'), //座位区
                        $tickects_num = $('#tickects_num'), //票数
                        $total_price = $('#total_price'); //票价总额                        
                        
                var sc = $('#seat_area').seatCharts({
                    map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道
                        'cccccccccc',
                        'cccccccccc',
                        'cc________',
                        'cccccccc__',
                        'cccccccccc',
                        'cccccccccc',
                        'cccccccccc'
                    ],
                    naming: {//设置行列等信息
                        top: false, //不显示顶部横坐标（行） 
                        getLabel: function(character, row, column) { //返回座位信息 
                            return column;
                        }
                    },
                    legend: {//定义图例
                        node: $('#legend'),
                        items: [
                            ['c', 'available', '可预定'],
                            ['c', 'unavailable', '已预定']
                        ]
                    },
                    click: function() {
                    	
                    	if(sc.find('selected').length >= 4) {
                    		alert("上限");
                    		return;
                    	}
                    	
                        if (this.status() == 'available') { //若为可选座状态，添加座位
                            $('<li data-row="'+(this.settings.row + 1)+'" data-col="'+this.settings.label+'">' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')
                                    .attr('id', 'cart-item-' + this.settings.id)
                                    .data('seatId', this.settings.id)
                                    .appendTo($cart);
							
                            $tickects_num.text(sc.find('selected').length + 1); //统计选票数量
                            	
                            return 'selected';
                        } else if (this.status() == 'selected') { //若为选中状态

                            $tickects_num.text(sc.find('selected').length - 1);//更新票数量
                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位

                            return 'available';
                        } else if (this.status() == 'unavailable') { //若为已售出状态
                            return 'unavailable';
                        } else {
                            return this.style();
                        }
                    }
                }); 
                        
        		//rcs是页面级别的变量 
        		if (rcs) {
					rcs = rcs.substr(0, rcs.length - 1); 
        		}      		            		
        		sc.get(rcs.split(";")).status('unavailable');
            	
            });

        </script>

</body>
</html>