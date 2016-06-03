package cn.cumt.library.dao;

import cn.cumt.library.form.CommentForm;
import cn.cumt.library.tool.JDBConnection;

import java.sql.*;
import java.util.*;

public class CommentDao {

	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public CommentDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询所有评论
	public List<CommentForm> selectComment() {
		List<CommentForm> list = new ArrayList<CommentForm>();
		CommentForm comment = null;
		try {
			ps = connection
					.prepareStatement("select * from comment order by commentId DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				comment = new CommentForm();
				comment.setCommentId(Integer.valueOf(rs.getString(1)));
				comment.setPostId(Integer.valueOf(rs.getString(2)));
				comment.setUserId(rs.getString(3));
				comment.setCommentContent(rs.getString(4));
				comment.setCommentDate(rs.getString(5));
				comment.setCommentPicture1(rs.getString(6));
				comment.setCommentPicture2(rs.getString(7));
				comment.setCommentPicture3(rs.getString(8));
				list.add(comment);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 以用户ID为条件查询用户帖子
	public List<CommentForm> selectCommentUser(String userId) {
		List<CommentForm> list = new ArrayList<CommentForm>();
		CommentForm comment = null;
		try {
			ps = connection
					.prepareStatement("select * from [comment] where userId=?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				comment = new CommentForm();
				comment.setCommentId(Integer.valueOf(rs.getString(1)));
				comment.setPostId(Integer.valueOf(rs.getString(2)));
				comment.setUserId(rs.getString(3));
				comment.setCommentContent(rs.getString(4));
				comment.setCommentDate(rs.getString(5));
				comment.setCommentPicture1(rs.getString(6));
				comment.setCommentPicture2(rs.getString(7));
				comment.setCommentPicture3(rs.getString(8));
				list.add(comment);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 以postID为条件查询用户帖子
	public List<CommentForm> selectCommentPost(Integer postId) {
		List<CommentForm> list = new ArrayList<CommentForm>();
		CommentForm comment = null;
		try {
			ps = connection
					.prepareStatement("select * from [comment] where postId=?");
			ps.setInt(1, postId.intValue());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				comment = new CommentForm();
				comment.setCommentId(Integer.valueOf(rs.getString(1)));
				comment.setPostId(Integer.valueOf(rs.getString(2)));
				comment.setUserId(rs.getString(3));
				comment.setCommentContent(rs.getString(4));
				comment.setCommentDate(rs.getString(5));
				comment.setCommentPicture1(rs.getString(6));
				comment.setCommentPicture2(rs.getString(7));
				comment.setCommentPicture3(rs.getString(8));
				list.add(comment);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}


	// 插入评论
	public boolean insertComment(CommentForm commentForm) {
		try {
			ps = connection
					.prepareStatement("insert into comment(postId,userId,commentContent,commentDate) values(?,?,?,getDate())");
			ps.setInt(1, commentForm.getPostId().intValue());
			ps.setString(2, commentForm.getUserId());
			ps.setString(3, commentForm.getCommentContent());
//			ps.setString(4, commentForm.getCommentPicture1());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 根据postID删除评论
	public boolean deleteCommentPost(Integer postId) {
		try {
			ps = connection
					.prepareStatement("delete from comment where postId=?");
			ps.setInt(1, postId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	// 根据commentID删除评论
	public boolean deleteComment(Integer commentId) {
		try {
			ps = connection
					.prepareStatement("delete from comment where commentId=?");
			ps.setInt(1, commentId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// 以评论ID为条件修改评论
	public boolean updateComment(CommentForm form) {
		try {
			ps = connection
					.prepareStatement("update comment set postId=?,userId=?,commentContent=?,commentDate=?,commentPicture=? where commentId=?");
			ps.setInt(1, form.getPostId().intValue());
			ps.setString(2, form.getUserId());
			ps.setString(3, form.getCommentContent());
			ps.setString(4, form.getCommentDate());
			ps.setString(5, form.getCommentPicture1());
			ps.setString(6, form.getCommentPicture2());
			ps.setString(7, form.getCommentPicture3());
			ps.setInt(8, form.getCommentId().intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}