<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Table Query</title>
<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript">
	function getData() {
		var page=$('#page2').val()-1;
		$.get("query2.do", { page: page }, function(m){
			$("#table_2 tr:gt(0)").remove();
			var html = "";
			$("#total2").html(m.total);
			
			for (var i=0; i < m.rows.length; i++) {
				var r = m.rows[i];			
				html += "<tr><td>" + r.roomId + "</td>";
				html += "<td>" + r.roomName + "</td>";
				html += "<td>" + r.roomSeatSum + "</td>";
				html += "<td>" + r.roomSeatRest + "</td></tr>";
			}
			$("#table_2").append(html);
			$('#pageCount2').html(m.total%10==0?m.total/10:parseInt(m.total/10+1));
		});
	}
	$(document).ready(function(){

			$('#page2').val(1);
			getData();

	});	
	function previous2(){
		if($('#page2').val()>=2){
			$('#page2').val(parseInt($('#page2').val())-1);
			getData();
		}else{
		}		
	}
	function next2(){
		if(parseInt($('#page2').val())<parseInt($('#pageCount2').html())){		
			$('#page2').val(parseInt($('#page2').val())+1);
			getData();
		}		
	}
	function first2(){
		$('#page2').val(1);
		getData();
	}
	function last2(){
		$('#page2').val($('#pageCount2').html());
		getData();
	}
</script>
</head>
<body>
</body>
</html>