package cn.cumt.library.dao;

import cn.cumt.library.form.UserForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.*;

//对用户表的操作
public class UserDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public UserDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 作为管理员查询所有用户的信息
	public List<UserForm> selectUser() {
		List<UserForm> list = new ArrayList<UserForm>();
		UserForm user = null;
		try {
			ps = connection
					.prepareStatement("select * from [user] order by userId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new UserForm();
				user.setUserId(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserNumber(rs.getString(3));
				user.setUserNickName(rs.getString(4));
				user.setUserScore(Integer.valueOf(rs.getString(5)));
				user.setUserEmail(rs.getString(6));
				user.setUserSex(Integer.valueOf(rs.getString(7)));
				user.setUserStatus(rs.getString(8));
				user.setUserBirthday(rs.getString(9));
				user.setUserPicture(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserQuestion(rs.getString(12));
				user.setUserAnswer(rs.getString(13));
				list.add(user);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以用户ID为条件查询用户所有信息
	public UserForm selectUserId(String userId) {
		UserForm user = null;
		try {
			ps = connection
					.prepareStatement("select * from [user] where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new UserForm();
				user.setUserId(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserNumber(rs.getString(3));
				user.setUserNickName(rs.getString(4));
				user.setUserScore(Integer.valueOf(rs.getString(5)));
				user.setUserEmail(rs.getString(6));
				user.setUserSex(Integer.valueOf(rs.getString(7)));
				user.setUserStatus(rs.getString(8));
				user.setUserBirthday(rs.getString(9));
				user.setUserPicture(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserQuestion(rs.getString(12));
				user.setUserAnswer(rs.getString(13));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
	//以用户ID为条件查询用户昵称
	public String selectUserNickName(String userId) {
		String nickName = null;
	    try {
	      ps = connection.prepareStatement("select * from [user] where userId=?");
	      ps.setString(1, userId);
	      ResultSet rs = ps.executeQuery();
	      while (rs.next()) {   
	        nickName=rs.getString("userNickName");
	      }
	    }
	    catch (SQLException ex) {
	    	ex.printStackTrace();
	    }
	    return nickName;
	  }
	
	
	//以用户ID为条件查询用户图片
	public String selectUserPicture(String userId) {
		String picture = null;
	    try {
	      ps = connection.prepareStatement("select * from [user] where userId=?");
	      ps.setString(1, userId);
	      ResultSet rs = ps.executeQuery();
	      while (rs.next()) {   
	    	  picture=rs.getString("userPicture");
	      }
	    }
	    catch (SQLException ex) {
	    	ex.printStackTrace();
	    }
	    return picture;
	  }
	
	// 以用户ID为条件查询用户所有信息
	public UserForm selectUserEmail(String userId, String userEmail) {
		UserForm user = null;
		try {
			ps = connection
					.prepareStatement("select * from [user] where userId=? and userEmail=?");
			ps.setString(1, userId);
			ps.setString(2, userEmail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new UserForm();
				user.setUserId(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserNumber(rs.getString(3));
				user.setUserNickName(rs.getString(4));
				user.setUserScore(Integer.valueOf(rs.getString(5)));
				user.setUserEmail(rs.getString(6));
				user.setUserSex(Integer.valueOf(rs.getString(7)));
				user.setUserStatus(rs.getString(8));
				user.setUserBirthday(rs.getString(9));
				user.setUserPicture(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserQuestion(rs.getString(12));
				user.setUserAnswer(rs.getString(13));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
	// 以用户的昵称为条件查询用户所有信息
	public UserForm selectUserName(String userNickName) {
		UserForm user = null;
		try {
			ps = connection
					.prepareStatement("select * from [user] where userNickName=?");
			ps.setString(1, userNickName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new UserForm();
				user.setUserId(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserNumber(rs.getString(3));
				user.setUserNickName(rs.getString(4));
				user.setUserScore(Integer.valueOf(rs.getString(5)));
				user.setUserEmail(rs.getString(6));
				user.setUserSex(Integer.valueOf(rs.getString(7)));
				user.setUserStatus(rs.getString(8));
				user.setUserBirthday(rs.getString(9));
				user.setUserPicture(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserQuestion(rs.getString(12));
				user.setUserAnswer(rs.getString(13));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
	
	// 添加用户信息
	public boolean insertUser(UserForm form) {
		try {
			ps = connection
					.prepareStatement("insert into [user] values(?,?,?,?,?,?,?,?,null,null,null,?,?)");
			ps.setString(1, form.getUserId());
			ps.setString(2, form.getUserPassword());
			ps.setString(3, form.getUserNumber());
			ps.setString(4, form.getUserNickName());
			ps.setInt(5, form.getUserScore().intValue());
			ps.setString(6, form.getUserEmail());
			ps.setInt(7, form.getUserSex().intValue());
			ps.setString(8, form.getUserStatus());
			ps.setString(9, form.getUserQuestion());
			ps.setString(10, form.getUserAnswer());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	// 以用户ID为条件删除用户
	public boolean deleteUser(String userId) {
		try {
			ps = connection.prepareStatement("delete from [user] where userId=?");
			ps.setString(1, userId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以用户ID为条件修改信息
	public boolean updateUser(UserForm userForm) {
		try {
			ps = connection
					.prepareStatement("update [user] set userNumber=?,userNickName=?,userEmail=?,userSex=?,userBirthday=?,userPhone=?,userQuestion=?,userAnswer=? where userId=?");
			
			ps.setString(1, userForm.getUserNumber());
			ps.setString(2, userForm.getUserNickName());
			ps.setString(3, userForm.getUserEmail());
			ps.setInt(4, userForm.getUserSex().intValue());
			ps.setString(5, userForm.getUserBirthday());
			ps.setString(6, userForm.getUserPhone());
			ps.setString(7, userForm.getUserQuestion());
			ps.setString(8, userForm.getUserAnswer());
			ps.setString(9, userForm.getUserId());
			
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	// 以用户ID为条件修改图片
	public boolean updateUserPicture(UserForm userForm) {
		try {
			ps = connection
					.prepareStatement("update [user] set userPicture=? where userId=?");
			ps.setString(1, userForm.getUserPicture());
			ps.setString(2, userForm.getUserId());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以用户ID和用户更改后密码为条件修改用户的密码
	public boolean updateUserPassword(String userId, String userPassword) {
		try {
			ps = connection
					.prepareStatement("update [user] set userPassword=? where userId=?");
			ps.setString(1, userPassword);
			ps.setString(2, userId);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
