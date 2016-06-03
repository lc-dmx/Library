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
@WebServlet("/tablequery")
public class tablequery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tablequery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword=request.getParameter("keyword");
		int page = Integer.parseInt(request.getParameter("page"));
			
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
		String username="sa";
		String password="123456";
		Connection conn=null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			conn=DriverManager.getConnection(url,username,password);
			String sql = "select * from student where time=' " + keyword + " ' order by studentid offset " + (page * 5) + " row fetch next 5 rows only";
			PreparedStatement stmt=conn.prepareStatement(sql);
			ResultSet rs= stmt.executeQuery();		
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/x-json");
			
			PrintWriter pw = response.getWriter();
			
			String j = "{\"rows\": [";
			while(rs.next()) {		    
				j += "{";
				j += "\"studentid\": \"" + rs.getString("studentid") + "\", ";
				j += "\"name\": \"" + rs.getString("name") + "\", ";
				j += "\"age\": \"" + rs.getInt("age") + "\", ";
				j += "\"time\": \"" + rs.getDate("time") + "\"";	

				j += "}";
				j += ", ";	
			}
			if (j != "{\"rows\": [") {
				j = j.substring(0, j.length() - 2);	
			}

			sql = "select count(*) as c from student where time=' " + keyword + " '";
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
