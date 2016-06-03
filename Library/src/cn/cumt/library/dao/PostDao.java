package cn.cumt.library.dao;

import cn.cumt.library.form.PostForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.*;

public class PostDao {

	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public PostDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询所有分享帖
	public List<PostForm> selectPost() {
		List<PostForm> list = new ArrayList<PostForm>();
		PostForm post = null;
		try {
			ps = connection
					.prepareStatement("select * from post order by postId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				post = new PostForm();
				post.setPostId(Integer.valueOf(rs.getString(1)));
				post.setUserId(rs.getString(2));
				post.setPostTitle(rs.getString(3));
				post.setPostContent(rs.getString(4));
				post.setPostDate(rs.getString(5));
				post.setPostClick(rs.getString(6));
				post.setPostPicture1(rs.getString(7));
				post.setPostPicture2(rs.getString(8));
				post.setPostPicture3(rs.getString(9));
				post.setPostPosition(rs.getString(10));
				list.add(post);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以用户ID为条件查询用户帖子
	public List<PostForm> selectPostUser(String userId) {
		List<PostForm> list = new ArrayList<PostForm>();
		PostForm post = null;
		try {
			ps = connection
					.prepareStatement("select * from [post] where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				post = new PostForm();
				post.setPostId(Integer.valueOf(rs.getString(1)));
				post.setUserId(rs.getString(2));
				post.setPostTitle(rs.getString(3));
				post.setPostContent(rs.getString(4));
				post.setPostDate(rs.getString(5));
				post.setPostClick(rs.getString(6));
				post.setPostPicture1(rs.getString(7));
				post.setPostPicture2(rs.getString(8));
				post.setPostPicture3(rs.getString(9));
				post.setPostPosition(rs.getString(10));
				list.add(post);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以postID为条件查询用户帖子
	public PostForm selectPostId(Integer postId) {
		PostForm post = null;
		try {
			ps = connection
					.prepareStatement("select * from [post] where postId=?");
			ps.setInt(1, postId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				post = new PostForm();
				post.setPostId(Integer.valueOf(rs.getString(1)));
				post.setUserId(rs.getString(2));
				post.setPostTitle(rs.getString(3));
				post.setPostContent(rs.getString(4));
				post.setPostDate(rs.getString(5));
				post.setPostClick(rs.getString(6));
				post.setPostPicture1(rs.getString(7));
				post.setPostPicture2(rs.getString(8));
				post.setPostPicture3(rs.getString(9));
				post.setPostPosition(rs.getString(10));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return post;
	}

	// 以用户ID为条件查询帖子标题
	public String selectPostTitle(Integer postId) {
		String postTitle = null;
		try {
			ps = connection
					.prepareStatement("select * from [post] where postId=?");
			ps.setInt(1, postId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				postTitle = rs.getString("postTitle");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return postTitle;
	}

	// 插入分享
	public boolean insertPost(PostForm postForm) {
		try {
			ps = connection
					.prepareStatement("insert into post(userId,postTitle,postContent,postDate,postPicture1,postPicture2,postPicture3,postPosition) values(?,?,?,getDate(),?,?,?,?)");
			ps.setString(1, postForm.getUserId());
			ps.setString(2, postForm.getPostTitle());
			ps.setString(3, postForm.getPostContent());
			ps.setString(4, postForm.getPostPicture1());
			ps.setString(5, postForm.getPostPicture2());
			ps.setString(6, postForm.getPostPicture3());
			ps.setString(7, postForm.getPostPosition());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 根据分享ID删除评论
	public boolean deletePost(Integer postId) {
		try {
			ps = connection.prepareStatement("delete from post where postId=?");
			ps.setInt(1, postId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以分享ID为条件修改分享帖
	public boolean updatePost(PostForm post) {
		try {
			ps = connection
					.prepareStatement("update post set postContent=?,postDate=now(),postClick=?,postPicture1=?,postPicture2=?,postPicture3=?,postPosition=? where postId=?");
			ps.setString(1, post.getUserId());
			ps.setString(2, post.getPostTitle());
			ps.setString(3, post.getPostContent());
			ps.setString(4, post.getPostClick());
			ps.setString(5, post.getPostPicture1());
			ps.setString(6, post.getPostPicture2());
			ps.setString(7, post.getPostPicture3());
			ps.setString(8, post.getPostPosition());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}