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
		var page=$('#page3').val()-1;
		$.get("query3.do", { page: page }, function(m){
			
			if (m && m.rows) {
			
			$("#table_3 tr:gt(0)").remove();
			var html = "";
			$("#total3").html(m.total);
			
			for (var i=0; i < m.rows.length; i++) {
				var r = m.rows[i];			
				html += "<tr><td>" + r.userId + "</td>";
				html += "<td>" + r.userNumber + "</td>";
				html += "<td>" + r.userScore + "</td>";
				html += "<td>" + r.userPhone + "</td>";
				html += "<td>" + r.userStatus + "</td>";
				html += "<td><a href=\"\" class=\"btn btn-primary\">删除</a></td></tr>";
			}
			$("#table_3").append(html);
			$('#pageCount3').html(m.total%10==0?m.total/10:parseInt(m.total/10+1));
			}
		});
	}
	$(document).ready(function(){

			$('#page3').val(1);
			getData();

	});	
	function previous3(){
		if($('#page3').val()>=2){
			$('#page3').val(parseInt($('#page3').val())-1);
			getData();
		}else{
		}		
	}
	function next3(){
		if(parseInt($('#page3').val())<parseInt($('#pageCount3').html())){		
			$('#page3').val(parseInt($('#page3').val())+1);
			getData();
		}		
	}
	function first3(){
		$('#page3').val(1);
		getData();
	}
	function last3(){
		$('#page3').val($('#pageCount3').html());
		getData();
	}
</script>
</head>
<body>
</body>
</html>