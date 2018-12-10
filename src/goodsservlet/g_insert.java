package goodsservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.GoodsListData;
import DB.mListData;
import demo.GList;
import demo.mList;

/**
 * Servlet implementation class g_insert
 */
@WebServlet("/g_insert")
public class g_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public g_insert() {
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
		String goods_id = request.getParameter("get_new_gId");
		String goods_name = request.getParameter("get_new_gName");
		String goods_type = request.getParameter("get_new_type");
		String goods_price = request.getParameter("get_new_gPrice");
		String goods_pin = request.getParameter("get_new_gPin");
		String goods_account = request.getParameter("get_new_gAccount");
		String goods_gVip = request.getParameter("get_new_gVip");
		GList gL = new GList();
		gL.setGoods_id(goods_id);
		gL.setGoods_name(goods_name);
		gL.setType(goods_type);
		gL.setGoods_price(goods_price);
		gL.setGoods_pin(goods_pin);
		gL.setAccount(goods_account);
		gL.setVip_account(goods_gVip);
		if(GoodsListData.gInsert(gL)) {
			response.sendRedirect("goods_charge.jsp");
		}
		else {
			response.sendRedirect("");
		}
	}

}
