package cn.cumt.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.cumt.library.form.SeatForm;
import cn.cumt.library.tool.JDBConnection;

public class SeatDao {

	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public SeatDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询所有的座位
	public List<SeatForm> selectSeat() {
		List<SeatForm> list = new ArrayList<SeatForm>();
		SeatForm seat = null;
		try {
			ps = connection.prepareStatement("select * from seat");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				seat = new SeatForm();
				seat.setRows(rs.getString("rows"));
				seat.setCols(rs.getString("cols"));
				seat.setStatus(rs.getString("status"));
				seat.setReserveDate(rs.getString("reserveDate"));
				seat.setReserveUseTime(rs.getString("reserveUseTime"));
				seat.setReserveDuration(rs.getInt("reserveDuration"));
				list.add(seat);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以用户ID为条件查询座位
	public List<SeatForm> selectSeatUserId(String userId) {
		List<SeatForm> list = new ArrayList<SeatForm>();		
		SeatForm seat = null;
		try {
			ps = connection
					.prepareStatement("select * from seat where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				seat = new SeatForm();
				seat.setUserId(rs.getString("userId"));
				seat.setRows(rs.getString("rows"));
				seat.setCols(rs.getString("cols"));
				seat.setStatus(rs.getString("status"));
				seat.setReserveDate(rs.getString("reserveDate"));
				seat.setReserveUseTime(rs.getString("reserveUseTime"));
				seat.setReserveDuration(rs.getInt("reserveDuration"));
				list.add(seat);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 以用户ID为条件查询剩余座位数量
	public int selectSeatRest() {
		int seat=0;
		try {
			ps = connection
					.prepareStatement("select count(*) as seatcount from seat where status='available'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				seat = rs.getInt("seatcount");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return seat;
	}

	// 删除预定后清空信息
	public boolean updateSeat(String userId) {
		try {
			ps = connection
					.prepareStatement("update seat set userId=?,status=?,reserveDate=?,reserveUseTime=?,reserveDuration=? where userId=?");
			ps.setString(1, null);
			ps.setString(2, "available");
			ps.setString(3, null);
			ps.setString(4, null);
			ps.setString(5, null);
			ps.setString(6, userId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
}
