package supplyservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.SupplyListData;
import DB.mListData;
import demo.SList;
import demo.mList;

/**
 * Servlet implementation class s_insert
 */
@WebServlet("/s_insert")
public class s_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public s_insert() {
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
		
		SList sL = new SList();
		sL.setSupply_id(supply_id);
		sL.setSupply_name(supply_name);
		
		if(SupplyListData.sInsert(sL)) {
			response.sendRedirect("supply_charge.jsp");
		}
		else {
			response.sendRedirect("");
		}
	}

}
