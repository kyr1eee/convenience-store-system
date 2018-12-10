package supplyservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.SupplyListData;
import DB.uListData;
import demo.SList;
import demo.uList;

/**
 * Servlet implementation class s_update
 */
@WebServlet("/s_update")
public class s_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public s_update() {
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
		String supply_id = request.getParameter("get_new_sId");
		String supply_name = request.getParameter("get_new_sName");
		String id = request.getParameter("m_id");
		SList sL = new SList();
		sL.setSupply_id(supply_id);
		sL.setSupply_name(supply_name);
		sL.setId(Integer.parseInt(id));
		
		
		
		if(SupplyListData.sUpdate(sL)) {
			response.sendRedirect("supply_charge.jsp");
		}
		else {
			response.sendRedirect("404/error.html");
		}
	}

}
