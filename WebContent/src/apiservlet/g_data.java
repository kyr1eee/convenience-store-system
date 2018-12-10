package apiservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.GoodsListData;
import DB.SupplyListData;
import demo.GList;
import demo.SList;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class g_data
 */
@WebServlet("/g_data")
public class g_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public g_data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("utf-8");
		System.out.print("我的JSON:"+request.getParameter("page"));
		String page = request.getParameter("page");
		if(page.equals("")||page==null){
			return;
		}
		int pageInt = Integer.parseInt(page);
		System.out.println("This is a page"+page);
		ArrayList<GList> gL = GoodsListData.showGListData(pageInt);
		String g_list = JSONArray.fromObject(gL).toString();
		System.out.println("This is a list"+g_list);
		//把数据传递给页面
		PrintWriter out  = response.getWriter();
		out.write(g_list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
