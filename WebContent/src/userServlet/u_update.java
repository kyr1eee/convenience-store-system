package userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.mListData;
import DB.uListData;
import demo.mList;
import demo.uList;

/**
 * Servlet implementation class u_update
 */
@WebServlet("/u_update")
public class u_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public u_update() {
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
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String u_name = request.getParameter("get_new_uName");
		String u_uid = request.getParameter("get_new_uId");
		String u_sex = request.getParameter("get_new_uSex");
		String u_phone = request.getParameter("get_new_uPhone");
		String m_id = request.getParameter("m_id");
		//System.out.print("我是m_update" + "这是m_id"+m_id+"这是m_name"+m_name);
		//System.out.print("name: " + m_name + "address: " + m_address + "phone: " + m_phone);
		uList uL = new uList();
		uL.setId(Integer.parseInt(m_id));
		uL.setName(u_name);
		uL.setSex(u_sex);
		uL.setPhone(u_phone);
		uL.setUid(u_uid);
		if(uListData.uUpdate(uL)) {
			response.sendRedirect("member_charge.jsp");
		}
		else {
			response.sendRedirect("404/error.html");
		}
	}

}
