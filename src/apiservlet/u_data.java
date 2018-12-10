package apiservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.mListData;
import DB.uListData;
import demo.mList;
import demo.uList;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class u_data
 */
@WebServlet("/u_data")
public class u_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public u_data() {
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
		System.out.print("�ҵ�JSON:"+request.getParameter("page"));
		String page = request.getParameter("page");
		if(page.equals("")||page==null){
			return;
		}
		int pageInt = Integer.parseInt(page);
		System.out.println("This is a page"+page);
		ArrayList<uList> uL = uListData.showUListData(pageInt);
		String u_list = JSONArray.fromObject(uL).toString();
		System.out.println("This is a list"+u_list);
		//�����ݴ��ݸ�ҳ��
		PrintWriter out  = response.getWriter();
		out.write(u_list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
