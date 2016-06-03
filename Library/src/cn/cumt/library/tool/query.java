package cn.cumt.library.tool;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class tablequery
 */
@WebServlet("/query.do")
public class query extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public query() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
			
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=library";
		String username="sa";
		String password="wstxyxy1212";
		Connection conn=null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			conn=DriverManager.getConnection(url,username,password);
			String sql = "select * from reserve order by reserveId offset " + (page * 10) + " row fetch next 10 rows only";
			PreparedStatement stmt=conn.prepareStatement(sql);
			ResultSet rs= stmt.executeQuery();		
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/x-json");
			
			PrintWriter pw = response.getWriter();
			
			String j = "{\"rows\": [";
			while(rs.next()) {		    
				j += "{";
				j += "\"reserveId\": \"" + rs.getInt("reserveId") + "\", ";
				j += "\"userId\": \"" + rs.getString("userId") + "\", ";
				j += "\"roomId\": \"" + rs.getString("roomId") + "\", ";
				j += "\"reserveSeat\": \"" + rs.getInt("reserveSeat") + "\"";

				j += "}";
				j += ", ";	
			}
			if (j != "{\"rows\": [") {
				j = j.substring(0, j.length() - 2);	
			}

			sql = "select count(*) as c from reserve ";
			stmt=conn.prepareStatement(sql);
			rs= stmt.executeQuery();
			String c = "";	
			if (rs.next()) {			
				c = rs.getString("c");	
			}		
			j += "], \"total\": " + c + "}";
			 
			pw.print(j);						
			stmt.close();
			conn.close();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
