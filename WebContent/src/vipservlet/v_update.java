package vipservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.VipListData;
import DB.mListData;
import demo.VList;
import demo.mList;

/**
 * Servlet implementation class v_update
 */
@WebServlet("/v_update")
public class v_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public v_update() {
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
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String v_hid = request.getParameter("get_new_mKey");
		String v_name = request.getParameter("get_new_mName");
		String v_time = request.getParameter("get_new_mDate");
		String v_phone = request.getParameter("get_new_mPhone");
		String m_id = request.getParameter("m_id");
		
		VList vL = new VList();
		vL.setId(Integer.parseInt(m_id));
		vL.setHid(v_hid);
		vL.setName(v_name);
		vL.setTime(v_time);
		vL.setPhone(v_phone);
		if(VipListData.vUpdate(vL)) {
			response.sendRedirect("vip_charge.jsp");
		}
		else {
			response.sendRedirect("404/error.html");
		}
	}

}
