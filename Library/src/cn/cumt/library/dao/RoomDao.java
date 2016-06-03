package cn.cumt.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;
import java.util.List;

import cn.cumt.library.form.RoomForm;
import cn.cumt.library.tool.JDBConnection;

public class RoomDao {

	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public RoomDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 以roomId为条件查询
	public List<RoomForm> selectRoom() {
		List<RoomForm> list = new ArrayList<RoomForm>();		
		RoomForm room = null;
		try {
			ps = connection
					.prepareStatement("select * from [room]");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				room = new RoomForm();
				room.setRoomId(rs.getString(1));
				room.setRoomName(rs.getString(2));
				room.setRoomSeatSum(rs.getInt(3));
				room.setRoomSeatRest(rs.getInt(4));
				list.add(room);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	
	// 以roomId为条件查询
	public RoomForm selectRoomId(String roomId) {
		RoomForm room = null;
		try {
			ps = connection
					.prepareStatement("select * from [room] where roomId=?");
			ps.setString(1, roomId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				room = new RoomForm();
				room.setRoomId(rs.getString(1));
				room.setRoomName(rs.getString(2));
				room.setRoomSeatSum(rs.getInt(3));
				room.setRoomSeatRest(rs.getInt(4));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return room;
	}
	
	// 以roomID为条件查询room的名称
	public String selectRoomName(String roomId) {
		String roomName = null;
		try {
			this.ps = connection
					.prepareStatement("select * from room where roomId=?");
			ps.setString(1, roomId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				roomName = rs.getString("roomName");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return roomName;
	}
	
	
	//添加操作
	  public void insertRoom(RoomForm form) {
	    try {
	      ps = connection.prepareStatement("insert into room(roomId,roomName,roomSeatSum,roomSeatRest) values (?,?,?,?)");
	      ps.setString(1, form.getRoomId());
	      ps.setString(2, form.getRoomName());
	      ps.setInt(3, form.getRoomSeatSum());
	      ps.setInt(4, form.getRoomSeatRest());
	      ps.executeUpdate();
	      ps.close();
	    }
	    catch (SQLException ex) {
	    	ex.printStackTrace();
	    }
	  }

	// 根据评论ID删除评论
	public boolean deleteRoom(String roomId) {
		try {
			ps = connection.prepareStatement("delete from room where roomId=?");
			ps.setString(1, roomId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 管理员以roomID为条件修改座位剩余量
	public boolean updateRoom(RoomForm room) {
		try {
			ps = connection
					.prepareStatement("update room set roomSeatRest=? where roomId=?");
			ps.setInt(1, room.getRoomSeatRest());
			ps.setString(2, room.getRoomId());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}