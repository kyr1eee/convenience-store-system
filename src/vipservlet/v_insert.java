package vipservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.VipListData;
import DB.uListData;
import demo.VList;
import demo.uList;

/**
 * Servlet implementation class v_insert
 */
@WebServlet("/v_insert")
public class v_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public v_insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String v_hid = request.getParameter("get_new_mKey");
		String v_name = request.getParameter("get_new_mName");
		String v_time = request.getParameter("get_new_mDate");
		String v_phone = request.getParameter("get_new_mPhone");
		//System.out.print("name: " + m_name + "address: " + m_address + "phone: " + m_phone);
		VList vL = new VList();
		vL.setHid(v_hid);
		vL.setName(v_name);
		vL.setTime(v_time);
		vL.setPhone(v_phone);
		if(VipListData.vInsert(vL)) {
			response.sendRedirect("vip_charge.jsp");
		}
		else {
			//response.sendRedirect("m_insert");
		}
	}

}
