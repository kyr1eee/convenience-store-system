package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.oracle.jrockit.jfr.RequestableEvent;

import DB.loginHandle;





/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd"); 
		System.out.println("This is my username: "+user+ "This is my password:"+pwd);
		loginHandle l = new loginHandle();
		
		int checkUser = 0;
		checkUser = loginHandle.checkUser(user);
		
		int result = 0;
		result = loginHandle.handle(user, pwd);
		if(result == 1) {
			System.out.println("登陆成功"+request.getContextPath());
			System.out.println(user);
			//set cookie
			Cookie cookie = new Cookie(user, pwd);
			cookie.setPath(request.getContextPath());
			cookie.setComment("This is my cookie");
			//cookie生存时间
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
			//访问权限
			request.getSession().setAttribute("ifLogin", "1");
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("index.jsp");
			
		}
		else {
			System.out.println("密码错误!!!");
			//访问权限
			request.getSession().setAttribute("ifLogin", "0");
			response.sendRedirect("404/error.html");
			//response.sendRedirect("myJSP.jsp");
		}
		
	}
	
	
}
