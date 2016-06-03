<%@ page language="java" contentType="text/html; charset=UTF-8" import="javax.servlet.jsp.jstl.fmt.*,java.sql.*"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>个人信息管理</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" type="text/css" href="css/date.css" />
<link rel="stylesheet" type="text/css" href="http://www.sucaihuo.com/jquery/css/common.css" />
<link rel="stylesheet" type="text/css" href="css/seat.css" />

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
<style type="text/css">
html,body {
	height: 100%;
}

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
		margin-left: -250px;
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
</style>
</head>
<body>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo">Open modal for @mdo</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" data-whatever="@fat">Open modal for @fat</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>


<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="demo clearfix" style="background-color:white;">
                <!---左边座位列表-->
                <div id="seat_area">
                    <div class="front">自习室</div>					
                </div>
                <!--右边选座信息-->
                <form >
                <div class="booking_area">
                    <p>时间：<span><fmt:formatDate value="${now }"/></span></p>
                    <p>座位：</p>
                    <ul id="seats_chose" /></ul>
                    <p>已定座位数：<span id="tickects_num">0</span></p>
                    <input type="button" class="btn" id="book" value="预定"/>
                    <div id="legend"></div>
                </div>
                </form>
            </div>
        </div>
	 
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/jquerySeat.js"></script>
        <script type="text/javascript" src="js/jquery.seat-charts.min.js"></script>       
        <script type="text/javascript">
            
	        <%
		        try {
		        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		        	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","wstxyxy1212");
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
            		            		
            		$.post("BookCount.do",{seats: rc, totalCount: sc.find('selected').length},function(data){
            			alert("预订成功");window.location.href = 'PickOut.jsp';
            		});
            	});
                var $cart = $('#seats_chose'), //座位区
                        $tickects_num = $('#tickects_num'), //票数
                        $total_price = $('#total_price'); //票价总额                        
                        
                var sc = $('#seat_area').seatCharts({
                    map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道
                        'cccccccccc',
                        'cccccccccc',
                        '__________',
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

            function getTotalPrice(sc) { //计算票价总额
                var total = 0;
                sc.find('selected').each(function() {
                    total += price;
                });
                return total;
            }
        </script>

</body>
</html>