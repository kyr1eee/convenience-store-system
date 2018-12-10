package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.mListData;
import demo.mList;

/**
 * Servlet implementation class m_insert
 */
@WebServlet("/m_insert")
public class m_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_insert() {
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
		request.setCharacterEncoding("UTF-8");
		String m_name = request.getParameter("get_new_mName");
		String m_address = request.getParameter("get_new_mAddress");
		String m_phone = request.getParameter("get_new_mPhone");
		System.out.print("name: " + m_name + "address: " + m_address + "phone: " + m_phone);
		mList mL = new mList();
		mL.setM_name(m_name);
		mL.setM_address(m_address);
		mL.setM_phone(m_phone);
		if(mListData.mInsert(mL)) {
			response.sendRedirect("store_charge.jsp");
		}
		else {
			response.sendRedirect("404/error.html");
		}
		
	}

}
