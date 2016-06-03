package cn.cumt.library.dao;

import java.sql.*;
import java.util.*;
import cn.cumt.library.form.AdminForm;
import cn.cumt.library.tool.JDBConnection;

//对管理员的操作
public class AdminDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public AdminDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询全部管理员的信息
	public List<AdminForm> selectAdmin() {
		List<AdminForm> list = new ArrayList<AdminForm>();
		AdminForm admin = null;
		try {
			ps = connection
					.prepareStatement("select * from admin order by adminId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				admin = new AdminForm();
				admin.setAdminId(Integer.valueOf(rs.getString(1)));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPassword(rs.getString(3));
				list.add(admin);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以管理员姓名为条件查询管理员信息
	public AdminForm selectAdminName(String adminName) {
		AdminForm admin = null;
		try {
			ps = connection
					.prepareStatement("select * from admin where adminName=?");
			ps.setString(1, adminName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				admin = new AdminForm();
				admin.setAdminId(Integer.valueOf(rs.getString(1)));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPassword(rs.getString(3));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return admin;
	}

	// 添加管理员信息
	public boolean insertAdmin(AdminForm form) {
		try {
			ps = connection
					.prepareStatement("insert into tb_member values(?,?,?)");
			ps.setInt(1, form.getAdminId().intValue());
			ps.setString(2, form.getAdminName());
			ps.setString(3, form.getAdminPassword());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 以管理员ID进行删除管理员的操作
	public boolean deleteAdmin(Integer adminId) {
		try {
			ps = connection
					.prepareStatement("delete from admin where adminId=?");
			ps.setInt(1, adminId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以管理员ID和新密码修改管理员密码
	public boolean updateAdminPassword(AdminForm form) {
		try {
			ps = connection
					.prepareStatement("update admin set adminPassword=? where adminId=?");
			ps.setString(1, form.getAdminPassword());
			ps.setInt(2, form.getAdminId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
