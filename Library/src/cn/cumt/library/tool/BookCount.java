package cn.cumt.library.tool;


import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookCount
 */
@WebServlet("/BookCount.do")
public class BookCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= request.getParameter("userId");
		String seats= request.getParameter("seats");
		String reserveDate=request.getParameter("reserveDate");
		String reserveUsetime=request.getParameter("reserveUsetime");
		int reserveDuration=Integer.parseInt(request.getParameter("reserveDuration"));
		//2#7,2#5,3#6
		String[] sa = seats.split(",");
		
		for (int i = 0; i < sa.length;i++) {
			String st = sa[i];	//2#7
			String rows = st.substring(0, st.indexOf("#"));	//2
			String cols = st.substring(st.indexOf("#") + 1);	//7
			//�������ݿ�
			try{
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=library","sa","wstxyxy1212");  
			 
				PreparedStatement ps = conn.prepareStatement("update seat set userId='" + userId + "' ,status= 'unavailable' ,reserveDate='" + reserveDate + "' ,reserveUsetime='" + reserveUsetime + "',reserveDuration='" + reserveDuration + "' where rows=? and cols=?");  
				ps.setString(1, rows);
				ps.setString(2, cols);
				ps.executeUpdate();  
				
				ps.close(); 
				conn.close();  
				
			}catch(Exception e){
				
			}
		}
		
	}

}
