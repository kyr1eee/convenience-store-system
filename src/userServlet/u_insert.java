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
 * Servlet implementation class u_insert
 */
@WebServlet("/u_insert")
public class u_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public u_insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String u_id = request.getParameter("get_new_uId");
		String u_name = request.getParameter("get_new_uName");
		String u_sex = request.getParameter("get_new_uSex");
		String u_phone = request.getParameter("get_new_uPhone");
		//System.out.print("name: " + m_name + "address: " + m_address + "phone: " + m_phone);
		uList uL = new uList();
		uL.setUid(u_id);
		uL.setName(u_name);
		uL.setSex(u_sex);
		uL.setPhone(u_phone);
		if(uListData.uInsert(uL)) {
			response.sendRedirect("member_charge.jsp");
		}
		else {
			response.sendRedirect("m_insert");
		}
	}

}
