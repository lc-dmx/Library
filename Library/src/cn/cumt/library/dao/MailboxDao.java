package cn.cumt.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.cumt.library.form.MailboxForm;
import cn.cumt.library.tool.JDBConnection;

public class MailboxDao {

	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public MailboxDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}


	// 以sender为条件查询用户帖子
	public List<MailboxForm> selectMailboxSender(String sender) {
		List<MailboxForm> list=new ArrayList<MailboxForm>();
		MailboxForm mailbox = null;
		try {
			ps = connection
					.prepareStatement("select * from [mailbox] where sender=?");
			ps.setString(1, sender);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				mailbox = new MailboxForm();
				mailbox.setSender(rs.getString(1));
				mailbox.setReceiver(rs.getString(2));
				mailbox.setTitle(rs.getString(3));
				mailbox.setComment(rs.getString(4));
				mailbox.setEmail(rs.getString(5));
				mailbox.setDate(rs.getString(6));
				list.add(mailbox);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 以receiver为条件查询用户帖子
	public List<MailboxForm> selectMailboxReceiver(String receiver) {
		List<MailboxForm> list=new ArrayList<MailboxForm>();		
		MailboxForm mailbox = null;
		try {
			ps = connection
					.prepareStatement("select * from [mailbox] where receiver=?");
			ps.setString(1, receiver);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				mailbox = new MailboxForm();
				mailbox.setSender(rs.getString(1));
				mailbox.setReceiver(rs.getString(2));
				mailbox.setTitle(rs.getString(3));
				mailbox.setComment(rs.getString(4));
				mailbox.setEmail(rs.getString(5));
				mailbox.setDate(rs.getString(6));
				list.add(mailbox);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 插入邮箱信息
	public boolean insertMailbox(MailboxForm mailbox) {
		try {
			ps = connection
					.prepareStatement("insert into mailbox(sender,receiver,title,comment,email,date) values(?,?,?,?,?,getDate())");
			ps.setString(1, mailbox.getSender());
			ps.setString(2, mailbox.getReceiver());
			ps.setString(3, mailbox.getTitle());
			ps.setString(4, mailbox.getComment());
			ps.setString(5, mailbox.getEmail());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 根据评论ID删除评论
	public boolean deleteMailbox(Integer mailboxId) {
		try {
			ps = connection
					.prepareStatement("delete from mailbox where mailboxId=?");
			ps.setInt(1, mailboxId.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}



}