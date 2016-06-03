<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="cn.cumt.library.form.ReserveForm"%>
<%@ page import="cn.cumt.library.form.SeatForm"%>
<%@ page import="cn.cumt.library.form.RoomForm"%>
<%@ page import="cn.cumt.library.form.OrderForm"%>
<%@ page import="cn.cumt.library.form.UserForm"%>
<jsp:useBean id="reserveDao" scope="page" class="cn.cumt.library.dao.ReserveDao" />
<jsp:useBean id="seatDao" scope="page" class="cn.cumt.library.dao.SeatDao" />
<jsp:useBean id="roomDao" scope="page" class="cn.cumt.library.dao.RoomDao" />
<jsp:useBean id="orderDao" scope="page" class="cn.cumt.library.dao.OrderDao" />
<%
	request.setCharacterEncoding("utf-8");
	ReserveForm reserve = new ReserveForm();
	SeatForm seat = new SeatForm();
	RoomForm room = new RoomForm();
	OrderForm order = new OrderForm();
	UserForm user = (UserForm) session.getAttribute("form");
	String userId = user.getUserId();
	
	List<SeatForm> list = seatDao.selectSeatUserId(userId);
	int reserveSeat = list.size(); // 计算出订了多少座位
	
	//先添加预定表
	reserve.setUserId(userId);
	reserve.setRoomId("1_001");
	reserve.setReserveSeat(reserveSeat);
	reserveDao.insertReserve(reserve);

	//然后添加教室表
	room.setRoomId("1_001");
	room.setRoomSeatRest(seatDao.selectSeatRest());
	roomDao.updateRoom(room);
	
%>
	<script language='javascript'>window.location.href='bookingSystemT.jsp';</script>
