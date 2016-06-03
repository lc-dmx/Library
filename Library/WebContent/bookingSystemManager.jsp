<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>后台管理系统</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/userLeft.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
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
		font-size:36pt;
		font-family:微软雅黑;
		font-weight:bold;
		color:white;
	}
	#heading #r{
		font-size:28pt;
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
	#leftside{
		background-color:black;
		border-top:2px solid #CFCFCF;
		width:27%;
		margin-left:1%;
		height:800px;
		float:left;
	}
	#touxiang{
		text-align:center;
	}
	#touxiang img{
		margin-top:50px;
		width: 144px;
		height:144px;
	}
	#username{
		text-align:center;
		margin:0px auto;
		width:180px;
		background-color:black;
	}
	#username p{
		margin-top:10px;
		color:white;
		font-size:12pt;
	}
	#list_01,#list_02,#list_03,#list_04,#list_05{
		text-align:center;
		font-size:12pt;
		font-weight:bold;
		color:#CFCFCF;
	}
	#main{
		float:right;
		width:70%;
		height:1080px;
		background-color:#CFCFCF;
	}
	#submain{
		float:right;
		margin-right:5%;
		background-color:white;
		height:1020px;
		width:90%;
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
				<label id="s">后台管理系统</label>
			</div>
			<div class="col-xs-8 col-xs-offset-2 
						col-sm-8 col-xs-offset-2
						col-md-8 col-xs-offset-2">
				<label id="r">MANAGER SYSTEM</label>
			</div>
		</div>
	</div>
	<div id="listpic">
		<div class="row">
			<div class="col-xs-1 col-xs-offset-1  
						col-sm-1 col-sm-offset-1
						col-md-1 col-md-offset-2 
						col-lg-1 col-lg-offset-1">
				<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
			</div>
		</div>
	</div>
</div>
	
	
	
	<div id="main">	
		<div id="submain">	
			<div><hr id="divide"/></div>
				<table class="table">
					<tr>
						<th>用户名称</th>
						<th>用户积分</th>
						<th>最后登录时间</th>
						<th>预约订单总数</th>
						<th>是否禁言</th>
						<th>删除操作</th>
					</tr>
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button type="button" class="btn btn-primary btn-xs">删除</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button type="button" class="btn btn-primary btn-xs">删除</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button type="button" class="btn btn-primary btn-xs">删除</button></td>
					</tr>
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
</body>
</html>
