package cn.cumt.library.dao;

import java.sql.*;
import java.util.*;
import cn.cumt.library.form.DataForm;
import cn.cumt.library.tool.JDBConnection;

//对资料表的操作
public class DataDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public DataDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 资料全部查询
	public List<DataForm> selectData() {
		List<DataForm> list = new ArrayList<DataForm>();
		DataForm data = null;
		try {
			ps = connection
					.prepareStatement("select * from data order by dataId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				data = new DataForm();
				data.setDataId(Integer.valueOf(rs.getString(1)));
				data.setDataCategoryId(Integer.valueOf(rs.getString(2)));
				data.setUserId(rs.getString(3));
				data.setDataName(rs.getString(4));
				data.setDataDate(rs.getString(5));
				data.setDataScore(rs.getString(6));
				data.setDataPicture(rs.getString(7));
				list.add(data);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以大目录或小目录的编号为条件查询资料
	public DataForm selectDataUser(Integer userId) {
		DataForm data = new DataForm();
		try {
			ps = connection
					.prepareStatement("select * from data where dataCategoryId=? order by id DESC");
			ps.setInt(1, userId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				data.setDataId(Integer.valueOf(rs.getString(1)));
				data.setDataCategoryId(Integer.valueOf(rs.getString(2)));
				data.setDataName(rs.getString(3));
				data.setDataDate(rs.getString(4));
				data.setDataScore(rs.getString(5));
				data.setDataPicture(rs.getString(6));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return data;
	}

	// 以用户ID为条件查询资料
	public DataForm selectDataCategory(Integer dataCategoryId) {
		DataForm data = new DataForm();
		try {
			ps = connection
					.prepareStatement("select * from data where dataCategoryId=? order by id DESC");
			ps.setInt(1, dataCategoryId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				data.setDataId(Integer.valueOf(rs.getString(1)));
				data.setUserId(rs.getString(2));
				data.setDataName(rs.getString(3));
				data.setDataDate(rs.getString(4));
				data.setDataScore(rs.getString(5));
				data.setDataPicture(rs.getString(6));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return data;
	}

	// 以资料的编号为条件查询资料名
	public String selectDataName(Integer dataId) {
		String dataName = null;
		try {
			ps = connection
					.prepareStatement("select * from data where dataId=? order by id DESC");
			ps.setInt(1, dataId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dataName = rs.getString("dataName");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return dataName;
	}

	// 以资料的编号为条件查询图片地址
	public String selectPicture(Integer dataId) {
		String dataPicture = null;
		try {
			ps = connection
					.prepareStatement("select * from data where dataId=? order by id DESC");
			ps.setInt(1, dataId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dataPicture = rs.getString("dataPicture");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return dataPicture;
	}

	// 添加资料操作
	public boolean insertData(DataForm form) {
		try {
			ps = connection
					.prepareStatement("insert into data values (?,?,?,?,now(),?,?)");
			ps.setInt(1, form.getDataId().intValue());
			ps.setInt(2, form.getDataCategoryId().intValue());
			ps.setString(3, form.getUserId());
			ps.setString(4, form.getDataName());
			ps.setString(5, form.getDataScore());
			ps.setString(6, form.getDataPicture());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以资料编号为条件删除资料
	public boolean deleteData(Integer dataId) {
		try {
			ps = connection.prepareStatement("delete from data where dataId=?");
			ps.setInt(1, dataId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以目录编号为条件删除资料
	public boolean deleteDataCategory(Integer dataCategoryId) {
		try {
			ps = connection
					.prepareStatement("delete from data where dataCategoryId=?");
			ps.setInt(1, dataCategoryId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以用户ID为条件删除资料
	public boolean deleteDataUser(Integer userId) {
		try {
			ps = connection.prepareStatement("delete from data where userId=?");
			ps.setInt(1, userId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以资料编号为条件更新资料目录
	public boolean updateData(DataForm form) {
		try {
			ps = connection
					.prepareStatement("update dataCategory set datacategoryId=?,userId=?,dataName=?,dataDate=now(),dataScore=?,dataPicture=? where dataId=?");
			ps.setInt(1, form.getDataCategoryId().intValue());
			ps.setString(2, form.getUserId());
			ps.setString(3, form.getDataName());
			ps.setString(4, form.getDataScore());
			ps.setString(5, form.getDataPicture());
			ps.setInt(6, form.getDataId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
