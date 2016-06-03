package cn.cumt.library.dao;

import cn.cumt.library.form.OrderReactForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//预约座位订单的操作
public class OrderReactDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public OrderReactDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	
	// 以orderID为条件查询用户帖子
	public List<OrderReactForm> selectOrderReact(Integer orderId) {
		List<OrderReactForm> list = new ArrayList<OrderReactForm>();
		OrderReactForm orderReact = null;
		try {
			ps = connection
					.prepareStatement("select * from [orderReact] where orderId=?");
			ps.setInt(1, orderId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				orderReact = new OrderReactForm();
				orderReact.setOrderReactId(Integer.valueOf(rs.getString(1)));
				orderReact.setOrderId(Integer.valueOf(rs.getString(2)));
				orderReact.setUserId(rs.getString(3));
				orderReact.setOrderReactDate(rs.getString(4));
				orderReact.setOrderReactStatus(rs.getString(5));
				orderReact.setOrderPhone(rs.getString(6));
				orderReact.setOrderReactContent(rs.getString(7));
				list.add(orderReact);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 以userID为条件查询用户帖子
	public List<OrderReactForm> selectOrderReactUser(String userId) {
		List<OrderReactForm> list = new ArrayList<OrderReactForm>();
		OrderReactForm orderReact = null;
		try {
			ps = connection
					.prepareStatement("select * from [orderReact] where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				orderReact = new OrderReactForm();
				orderReact.setOrderReactId(Integer.valueOf(rs.getString(1)));
				orderReact.setOrderId(Integer.valueOf(rs.getString(2)));
				orderReact.setUserId(rs.getString(3));
				orderReact.setOrderReactDate(rs.getString(4));
				orderReact.setOrderReactStatus(rs.getString(5));
				orderReact.setOrderPhone(rs.getString(6));
				orderReact.setOrderReactContent(rs.getString(7));
				list.add(orderReact);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	


	// 添加订单反馈信息
	public boolean insertOrderReact(OrderReactForm form) {
		try {
			ps = connection
					.prepareStatement("insert into [orderReact](orderId,userId,orderReactDate,orderReactStatus,orderPhone,orderReactContent) values (?,?,getDate(),?,?,?)");
			ps.setInt(1, form.getOrderId().intValue());
			ps.setString(2, form.getUserId());
			ps.setString(3, "1");
			ps.setString(4, form.getOrderPhone());
			ps.setString(5, form.getOrderReactContent());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 根据orderId删除订单反馈信息
	public boolean deleteOrderReactId(Integer orderId) {
		try {
			ps = connection
					.prepareStatement("delete from [orderReact] where orderId=?");
			ps.setInt(1, orderId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		
	}
	
	// 根据orderReactId删除订单反馈信息
	public boolean deleteOrderReact(Integer orderReactId) {
		try {
			ps = connection
					.prepareStatement("delete from [orderReact] where orderReactId=?");
			ps.setInt(1, orderReactId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}

	}

	// 以订单ID为条件更新订单
	public boolean updateOrderReact(OrderReactForm form) {
		try {
			ps = connection
					.prepareStatement("update [orderReact] set ,orderDate=getDate(),orderReactStatus=?, where orderReactId=?");
			ps.setString(1, form.getOrderReactStatus());
			ps.setInt(2, form.getOrderReactId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
