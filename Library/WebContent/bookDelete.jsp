<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="cn.cumt.library.form.ReserveForm"%>
<%@ page import="cn.cumt.library.form.SeatForm"%>
<%@ page import="cn.cumt.library.form.RoomForm"%>
<%@ page import="cn.cumt.library.form.OrderForm"%>
<%@ page import="cn.cumt.library.form.UserForm"%>
<jsp:useBean id="reserveDao" scope="page"
	class="cn.cumt.library.dao.ReserveDao" />
<jsp:useBean id="seatDao" scope="page"
	class="cn.cumt.library.dao.SeatDao" />
<jsp:useBean id="roomDao" scope="page"
	class="cn.cumt.library.dao.RoomDao" />
<jsp:useBean id="orderDao" scope="page"
	class="cn.cumt.library.dao.OrderDao" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");
	RoomForm room = new RoomForm();
	//先删除预定表
	UserForm user = (UserForm) session.getAttribute("form");
	String userId = user.getUserId();
	reserveDao.deleteReserve(userId);
	seatDao.updateSeat(userId);

	//然后更新教室座位余量
	room.setRoomId("1_001");
	room.setRoomSeatRest(seatDao.selectSeatRest());
	roomDao.updateRoom(room);
%>
<script language='javascript'>
	window.location.href = 'bookingSystemT.jsp';
</script>