package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestableEvent;
import com.sun.jmx.snmp.SnmpSecurityParameters;

import DB.saveData;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class saveRegister
 */
@WebServlet("/saveRegister")
public class saveRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveRegister() {
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
		String message = "aaaaa";
		request.setAttribute("aaa", "12122222");
		
		
		//doGet(request, response);
		String user = request.getParameter("new_user");
		String pwd = request.getParameter("new_pwd"); 
		String email = request.getParameter("new_email");
		
		if(saveData.checkData(user, pwd, email)) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			request.setAttribute("new_user", user);
			request.getSession().setAttribute("new_user", user);
	
		}
		else {
			response.sendRedirect("404/error.html");
		}
		System.out.println("This is your username: "+user+ "This is your password:"+pwd+"This is your email:"+email);
		//response.sendRedirect("register.jsp");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

}
