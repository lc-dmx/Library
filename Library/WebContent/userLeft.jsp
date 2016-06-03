<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.cumt.library.form.UserForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

<script language="javascript">
	function quit() {
		if (confirm("确认注销吗？")) {
			window.location.href = "loginOut.jsp";
		}
	}
</script>
	<%  UserForm form=(UserForm)session.getAttribute("form");
 String userLink="userAction.do?action=4&userId="+form.getUserId(); %>

	<div class="navbar navbar-inverse col-md-3 col-xs-12 col-sm-12"
		role="navigation"
		style="float: left; padding-right: 0px; padding-left: 0px;">
		<div class="container" id="navcon">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">导航条</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse row">
				<div class=" col-md-3 col-xs-12 col-sm-12">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="">
							<div class="text-right jianxi" role="tab">
								<a href="<%=userLink%>" id="list_00"><img
									src="<%=form.getUserPicture()%>" class="img-circle" /></a><span>&emsp;</span>
							</div>
						</div>
						<div class="">
							<div class="text-right jianxi" role="tab" id="headingOne">
								<a href="<%=userLink%>"><%=form.getUserNickName() %></a><span>&emsp;</span>
							</div>
						</div>
						<div class="">
							<div class="text-right jianxi" role="tab" id="headingOne">
								<a href="indexLogined.jsp">首页</a><span>&emsp;</span>
							</div>
						</div>

						<div class="">
							<div class="panel-heading text-right" role="tab" id="headingOne">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne"> 学习分享 <span
									class="caret"></span>
								</a>
							</div>
							<div id="collapseOne" class="panel-collapse collapse text-right"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<a href="postAction.do?action=0" id="share" class="xiala">学习分享区</a>
								</div>
								<div class="panel-body">
									<a href="shareQuarterC.jsp" id="mycomment" class="xiala">个人分享</a>
								</div>
							</div>
						</div>

						<div class="">
							<div class="panel-heading text-right" role="tab" id="headingTwo">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> 相约自习 <span
									class="caret"></span>
								</a>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse text-right"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<a href="orderAction.do?action=0" id="study" class="xiala">相约自习区</a>
								</div>
								<div class="panel-body">
									<a href="stuAppointmentC.jsp" id="mymessage" class="xiala">相约消息</a>
								</div>
							</div>
						</div>

						<div class="">
							<div class="panel-heading text-right" role="tab"
								id="headingThree">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									自习室预约系统 <span class="caret"></span>
								</a>
							</div>
							<div id="collapseThree"
								class="panel-collapse collapse text-right" role="tabpanel"
								aria-labelledby="headingThree">
								<div class="panel-body">
									<a
										href="reserveAction.do?action=1&userId=<%=form.getUserId() %>"
										id="booking" class="xiala">预订自习座位</a>
								</div>
								<div class="panel-body">
									<a href="bookingSystemT.jsp" id="myorder" class="xiala">我的预订</a>
								</div>
							</div>
						</div>
						<div class="">
							<div class="text-right jianxi" role="tab" id="headingOne">
								<a href="contactUs.jsp">联系我们</a><span>&emsp;</span>
							</div>
						</div>
						<div class="">
							<div class="text-right jianxi" role="tab" id="headingOne">
								<a href="javascript:quit()">注销退出</a><span>&emsp;</span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
