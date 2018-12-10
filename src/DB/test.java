package DB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd"); 
		System.out.println("This is my username: "+user+ "This is my password:"+pwd);
		
		String db_user = "admin";
		String db_pwd = "pwd";
		if(user.equals(db_user) && pwd.equals(db_pwd)) {
			System.out.println("µÇÂ½³É¹¦");
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("ÃÜÂë´íÎó!!!");
			response.sendRedirect("myJSP.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("This is my house");
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd"); 
		System.out.println("This is my username: "+user+ "This is my password:"+pwd);
		
		String db_user = "admin";
		String db_pwd = "pwd";
		if(user.equals(db_user) && pwd.equals(db_pwd)) {
			System.out.println("µÇÂ½³É¹¦");
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("ÃÜÂë´íÎó!!!");
			response.sendRedirect("myJSP.jsp");
		}
		//doGet(request, response);
	}

}
