package cn.cumt.library.dao;

import cn.cumt.library.form.DataCategoryForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.*;

//对商品大类别信息的操作
public class DataCategoryDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public DataCategoryDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 对资料目录全部查询的操作
	public List<DataCategoryForm> selectDataCategory() {
		List<DataCategoryForm> list = new ArrayList<DataCategoryForm>();
		DataCategoryForm dataCategory = null;
		try {
			this.ps = connection
					.prepareStatement("select * from dataCategory order by dataCategoryId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dataCategory = new DataCategoryForm();
				dataCategory
						.setDataCategoryId(Integer.valueOf(rs.getString(1)));
				dataCategory.setDataCategoryName(rs.getString(2));
				dataCategory.setDataDescription(rs.getString(3));
				dataCategory.setDataUpperCategoryId(Integer.valueOf(rs
						.getString(3)));
				list.add(dataCategory);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 添加资料目录操作
	public boolean insertDataCategory(DataCategoryForm form) {
		try {
			ps = connection
					.prepareStatement("insert into dataCategory values (?,?,?,?");
			ps.setInt(1, form.getDataCategoryId().intValue());
			ps.setString(2, form.getDataCategoryName());
			ps.setString(3, form.getDataDescription());
			ps.setInt(4, form.getDataUpperCategoryId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以数据库流水号为条件查询大类别的名称
	public String selectDataCategoryName(Integer id) {
		String name = null;
		try {
			this.ps = connection
					.prepareStatement("select * from tb_bigType where id=?");
			ps.setString(1, id.toString());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				name = rs.getString("bigName");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return name;
	}
	
	// 根据资料目录的ID删除目录
	public boolean deleteDataCategory(Integer dataCategoryId) {
		try {
			ps = connection
					.prepareStatement("delete from dataCategory where dataCategoryId=?");
			ps.setInt(1, dataCategoryId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 更新资料目录
	public boolean updateDataCategory(DataCategoryForm form) {
		try {
			ps = connection
					.prepareStatement("update dataCategory set datacategoryId=?,dataCategoryName=?,dataDescription=?,dataUpperCategoryId=? where dataCategoryId=?");
			ps.setInt(1, form.getDataCategoryId().intValue());
			ps.setString(2, form.getDataCategoryName());
			ps.setString(3, form.getDataDescription());
			ps.setInt(4, form.getDataUpperCategoryId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
