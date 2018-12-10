package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import demo.mList;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class mListData {
	
	public static ArrayList<mList> showMListData(int page) {
		ArrayList<mList> m_ListData= new ArrayList<mList>();
		Connection c = db.openconn();
		String sql = "select * from m_list limit ?,?";
		int offset = 0;
		if(page == 1) {
			offset = 0;
		}
		else {
			offset = (page - 1)*5;
		}
		try {
			PreparedStatement p = (PreparedStatement) c.prepareStatement(sql);
			p.setInt(1,offset);
			p.setInt(2, 5);
			ResultSet re = p.executeQuery();
			
			while(re.next()) {
				mList m_List  = new mList();
				m_List.setM_id(re.getInt(1));
				m_List.setM_name(re.getString(2));
				m_List.setM_address(re.getString(3));
				m_List.setM_phone(re.getString(4));
				m_ListData.add(m_List);
			}
			
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  m_ListData;
	}
	public static int listLen() {
		Connection c = db.openconn();
		String sql = "select count(*) from m_list ";
		try {
			PreparedStatement p = (PreparedStatement) c.prepareStatement(sql);
			ResultSet re = p.executeQuery();
			
			while(re.next()) {
				int len = re.getInt(1);
				return len;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	public static boolean mInsert(mList m) {
		Connection c = db.openconn();
		String sql = "insert into m_list(m_name,m_address,m_phone) values (?,?,?)";
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,m.m_name);
			p.setString(2, m.m_address);
			p.setString(3, m.m_phone);
			System.out.print("Œ“ «mListData" + m.m_name + m.m_address  + m.m_phone);
			p.executeUpdate();
			
			c.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean mDelete(String m_name) {
		Connection c = db.openconn();
		String sql = "delete from m_list where m_name = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, m_name);
			p.executeUpdate();
			c.close();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean mUpdate(mList m) {
		Connection c = db.openconn();
		String sql = "update m_list set m_name=?,m_address=?,m_phone=? where mi_d = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, m.m_name);
			p.setString(2, m.m_address);
			p.setString(3, m.m_phone);
			p.setInt(4, m.m_id);
			p.executeUpdate();
			c.close();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
}
