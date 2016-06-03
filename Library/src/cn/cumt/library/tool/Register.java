package cn.cumt.library.tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cumt.library.dao.UserDao;
import cn.cumt.library.form.UserForm;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao = null;      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		String userId = request.getParameter("value");

		dao= new UserDao();		
		UserForm userForm = dao.selectUserId(userId);
		PrintWriter pw = response.getWriter();
		
		Boolean successful = (userForm==null);
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String j = "{ \"Success\": " + successful.toString() + ", \"Message\": \"" + (!successful ? "name" + userId + " has existed" : "") + "\" }";
		
		response.setContentType("text/x-json;charset=utf-8");
		
		pw.write(j);
		
		pw.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/x-json;charset=utf-8");

		pw.write("{ \"Success\": true }");
		
		pw.close();
		
	}

}
