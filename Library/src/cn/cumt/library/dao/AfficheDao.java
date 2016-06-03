package cn.cumt.library.dao;

import java.sql.*;
import java.util.*;

import cn.cumt.library.form.AfficheForm;
import cn.cumt.library.tool.JDBConnection;

//对公告信息的操作
public class AfficheDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public AfficheDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 公告全部查询的方法
	public List<AfficheForm> selectAffiche() {
		List<AfficheForm> list = new ArrayList<AfficheForm>();
		AfficheForm affiche = null;
		try {
			ps = connection
					.prepareStatement("select * from affiche order by afficheId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				affiche = new AfficheForm();
				affiche.setAfficheId(Integer.valueOf(rs.getString(1)));
				affiche.setAfficheName(rs.getString(2));
				affiche.setAfficheContent(rs.getString(3));
				affiche.setAfficheDate(rs.getString(4));
				list.add(affiche);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;

	}

	// 以公告ID号为条件查询信息
	public AfficheForm selectOneAffiche(Integer afficheId) {
		AfficheForm affiche = null;
		try {
			ps = connection
					.prepareStatement("select * from affiche where afficheId=?");
			ps.setInt(1, afficheId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				affiche = new AfficheForm();
				affiche.setAfficheId(Integer.valueOf(rs.getString(1)));
				affiche.setAfficheName(rs.getString(2));
				affiche.setAfficheContent(rs.getString(3));
				affiche.setAfficheDate(rs.getString(4));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return affiche;
	}

	// 添加公告的方法
	public boolean insertAffiche(AfficheForm form) {
		try {
			ps = connection
					.prepareStatement("insert into affiche values (null,?,?,now())");
			ps.setString(1, form.getAfficheName());
			ps.setString(2, form.getAfficheContent());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 根据公告ID删除公告
	public boolean deleteAffiche(Integer afficheId) {
		try {
			ps = connection
					.prepareStatement("delete from affiche where afficheId=?");
			ps.setInt(1, afficheId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 根据公告ID修改公告
	public boolean updateAffiche(AfficheForm form) {
		try {
			ps = connection
					.prepareStatement("update affiche set afficheName=?,afficheContent=? where afficheId=?");
			ps.setString(1, form.getAfficheName());
			ps.setString(2, form.getAfficheContent());
			ps.setInt(3, form.getAfficheId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
