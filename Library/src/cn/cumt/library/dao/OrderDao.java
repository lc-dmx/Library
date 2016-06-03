package cn.cumt.library.dao;

import cn.cumt.library.form.OrderForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//预约座位订单的操作
public class OrderDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public OrderDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询所有发出的订单
	public List<OrderForm> selectOrder() {
		List<OrderForm> list = new ArrayList<OrderForm>();
		OrderForm order = null;
		try {
			ps = connection
					.prepareStatement("select * from [order] order by orderId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new OrderForm();
				order.setOrderId(Integer.valueOf(rs.getString(1)));
				order.setUserId(rs.getString(2));
				order.setOrderStatus(rs.getString(3));
				order.setOrderDate(rs.getString(4));
				order.setOrderAddress(rs.getString(5));
				order.setOrderPicture(rs.getString(6));
				order.setOrderSeat(rs.getString(7));
				order.setOrderMajor(rs.getString(8));
				order.setOrderSubject(rs.getString(9));
				list.add(order);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 以用户ID为条件查询用户帖子
	public List<OrderForm> selectOrderUser(String userId) {
		List<OrderForm> list = new ArrayList<OrderForm>();
		OrderForm order = null;
		try {
			ps = connection
					.prepareStatement("select * from [order] where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new OrderForm();
				order.setOrderId(Integer.valueOf(rs.getString(1)));
				order.setUserId(rs.getString(2));
				order.setOrderStatus(rs.getString(3));
				order.setOrderDate(rs.getString(4));
				order.setOrderAddress(rs.getString(5));
				order.setOrderPicture(rs.getString(6));
				order.setOrderSeat(rs.getString(7));
				order.setOrderMajor(rs.getString(8));
				order.setOrderSubject(rs.getString(9));
				list.add(order);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	
	// 以订单编号为条件查询信息
	public OrderForm selectOrderId(Integer orderId) {

		OrderForm order = null;
		try {
			ps = connection
					.prepareStatement("select * from [order] where orderId=?");
			ps.setInt(1, orderId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new OrderForm();
				order.setOrderId(Integer.valueOf(rs.getString(1)));
				order.setUserId(rs.getString(2));
				order.setOrderStatus(rs.getString(3));
				order.setOrderDate(rs.getString(4));
				order.setOrderAddress(rs.getString(5));
				order.setOrderPicture(rs.getString(6));
				order.setOrderSeat(rs.getString(7));
				order.setOrderMajor(rs.getString(8));
				order.setOrderSubject(rs.getString(9));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return order;
	}

	
	// 以用户ID为条件查询帖子标题
	public String selectOrderAddress(Integer orderId) {
		String orderAddress = null;
		try {
			ps = connection
					.prepareStatement("select * from [order] where orderId=?");
			ps.setInt(1, orderId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				orderAddress = rs.getString("orderAddress");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return orderAddress;
	}
	
	// 添加订单信息
	public boolean insertOrder(OrderForm form) {
		try {
			ps = connection
					.prepareStatement("insert into [order](userId,orderStatus,orderDate,orderAddress,orderPicture,orderSeat,orderMajor,orderSubject) values (?,?,?,?,?,?,?,?)");
			ps.setString(1, form.getUserId());
			ps.setString(2, "1");
			ps.setString(3, form.getOrderDate());
			ps.setString(4, form.getOrderAddress());
			ps.setString(5, form.getOrderPicture());
			ps.setString(6, form.getOrderSeat());
			ps.setString(7, form.getOrderMajor());
			ps.setString(8, form.getOrderSubject());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 删除订单信息
	public boolean deleteOrder(Integer orderId) {
		try {
			ps = connection
					.prepareStatement("delete from [order] where orderId=?");
			ps.setInt(1, orderId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}

	}

	// 以订单ID为条件更新订单
	public boolean updateOrder(OrderForm form) {
		try {
			ps = connection
					.prepareStatement("update [order] set userId=?,orderStatus=?,orderDate=now(),orderAddress=?,orderPicture=? where orderId=?");
			ps.setString(1, form.getUserId());
			ps.setString(2, form.getOrderStatus());
			ps.setString(3, form.getOrderAddress());
			ps.setString(4, form.getOrderPicture());
			ps.setInt(5, form.getOrderId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
