package cn.cumt.library.dao;

import cn.cumt.library.form.ReserveForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.*;

//预约座位表的操作
public class ReserveDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public ReserveDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询全部预约信息
	public List<ReserveForm> selectReserve() {
		List<ReserveForm> list = new ArrayList<ReserveForm>();
		ReserveForm reserve = null;
		try {
			ps = connection.prepareStatement("select * from reserve");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reserve = new ReserveForm();
				reserve.setReserveId(Integer.valueOf(rs.getString(1)));
				reserve.setUserId(rs.getString(2));
				reserve.setRoomId(rs.getString(3));
				reserve.setReserveSeat(rs.getInt(4));
				list.add(reserve);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 根据预约ID查询预约信息
	public List<ReserveForm> selectReserveId(Integer reserveId) {
		List<ReserveForm> list = new ArrayList<ReserveForm>();
		ReserveForm reserve = null;
		try {
			ps = connection
					.prepareStatement("select * from reserve where reserveId=?");
			ps.setInt(1, reserveId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reserve = new ReserveForm();
				reserve.setReserveId(Integer.valueOf(rs.getString(1)));
				reserve.setUserId(rs.getString(2));
				reserve.setRoomId(rs.getString(3));
				reserve.setReserveSeat(rs.getInt(4));
				list.add(reserve);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 以userID为条件查询roomId
	public String selectReserveRoomId(String userId) {
		String roomId = null;
		try {
			this.ps = connection
					.prepareStatement("select * from reserve where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				roomId = rs.getString("roomId");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return roomId;
	}
	
	// 以userID为条件查询预定座位数量
	public String selectReserveSeat(String userId) {
		String reserveSeat = null;
		try {
			this.ps = connection
					.prepareStatement("select * from reserve where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reserveSeat = rs.getString("reserveSeat");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return reserveSeat;
	}
	
	// 根据用户ID查询预约信息
	public ReserveForm selectReserveUserId(String userId) {
		ReserveForm reserve = null;
		try {
			ps = connection
					.prepareStatement("select * from reserve where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reserve = new ReserveForm();
				reserve.setReserveId(Integer.valueOf(rs.getString(1)));
				reserve.setUserId(rs.getString(2));
				reserve.setRoomId(rs.getString(3));
				reserve.setReserveSeat(rs.getInt(4));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return reserve;
	}

	// 添加订座信息
	public boolean insertReserve(ReserveForm form) {
		try {
			ps = connection
					.prepareStatement("insert into reserve(userId,roomId,reserveSeat) values (?,?,?)");
			ps.setString(1, form.getUserId());
			ps.setString(2, form.getRoomId());
			ps.setInt(3, form.getReserveSeat());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 删除订座预约信息
	public boolean deleteReserve(String userId) {
		try {
			ps = connection
					.prepareStatement("delete from reserve where userId=?");
			ps.setString(1, userId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}

	}

	// 以预约ID为条件更新预约信息
	public boolean updateReserve(ReserveForm form) {
		try {
			ps = connection
					.prepareStatement("update order set userId=?,roomId=?,reserveSeat=? where reserveId=?");
			ps.setString(1, form.getUserId());
			ps.setString(2, form.getRoomId());
			ps.setInt(3, form.getReserveSeat());
			ps.setInt(4, form.getReserveId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}