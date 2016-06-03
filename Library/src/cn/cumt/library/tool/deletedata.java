package cn.cumt.library.tool;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deletedata
 */
@WebServlet("/deletedata")
public class deletedata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletedata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
//		String userId=request.getParameter("userId");
		String userId="wst";
		PrintWriter out= response.getWriter();
		out.println("ws");
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=library","sa","wstxyxy1212");
			PreparedStatement ps=conn.prepareStatement("delete from reserve where userId=?");
			ps.setString(1,userId);
			ps.executeUpdate();
			ps.close();
			conn.close();
		
		//response.sendRedirect("adminLogined.jsp");	
		}catch(SQLException ex){
			ex.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
//		String userId=request.getParameter("userId");
		String userId="wst";
		PrintWriter out= response.getWriter();
		out.println("ws");
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=library","sa","wstxyxy1212");
			PreparedStatement ps=conn.prepareStatement("delete from reserve where userId=?");
			ps.setString(1,userId);
			ps.executeUpdate();
			ps.close();
			conn.close();
		
		//response.sendRedirect("adminLogined.jsp");	
		}catch(SQLException ex){
			ex.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
