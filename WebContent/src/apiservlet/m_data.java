package apiservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import DB.mListData;
import demo.mList;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class m_data
 */
@WebServlet("/m_data")
public class m_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_data() {
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
		ArrayList<mList> mL = mListData.showMListData(pageInt);
		String m_list = JSONArray.fromObject(mL).toString();
		System.out.println("This is a list"+m_list);
		//把数据传递给页面
		PrintWriter out  = response.getWriter();
		out.write(m_list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setCharacterEncoding("utf-8");
		System.out.print("我的JSON:"+request.getParameter("page"));
		String page = request.getParameter("pageJson");
		if(page.equals("")||page==null){
			return;
		}
		int pageInt = Integer.parseInt(page.trim());
		
		ArrayList<mList> mL = mListData.showMListData(pageInt);
		String m_list = JSONArray.fromObject(mL).toString();
		
		//把数据传递给页面
		PrintWriter out  = response.getWriter();
		out.write(m_list);
	}

}
