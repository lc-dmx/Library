package cn.cumt.library.tool;

import java.sql.*;

public class JDBConnection {
	private String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 连接驱动

	private String url = "jdbc:sqlserver://localhost:1433;DatabaseName=library";  // URL数据库地址ַ

	public Connection connection = null;

	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // 建立实例
			connection = DriverManager.getConnection(url, "sa", "wstxyxy1212"); // 账户信息
		} catch (Exception ex) {
			System.out.println("连接成功");
		}
	}
}
