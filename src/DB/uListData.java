package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import demo.mList;
import demo.uList;

public class uListData {
	public static ArrayList<uList> showUListData(int page) {
		ArrayList<uList> u_ListData= new ArrayList<uList>();
		Connection c = db.openconn();
		String sql = "select * from member limit ?,?";
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
				uList u_List  = new uList();
				u_List.setId(re.getInt(1));
				u_List.setUid(re.getString(2));
				u_List.setName(re.getString(3));
				u_List.setSex(re.getString(4));
				u_List.setPhone(re.getString(5));
				u_ListData.add(u_List);
			}
			
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  u_ListData;
	}
	public static int listLen() {
		Connection c = db.openconn();
		String sql = "select count(*) from member ";
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
	
	public static boolean uInsert(uList u) {
		Connection c = db.openconn();
		String sql = "insert into member(uid,name,sex,phone) values (?,?,?,?)";
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,u.uid);
			p.setString(2,u.name);
			p.setString(3, u.sex);
			p.setString(4, u.phone);
			
			p.executeUpdate();
			
			c.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean uDelete(String name) {
		Connection c = db.openconn();
		String sql = "delete from member where name = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, name);
			p.executeUpdate();
			c.close();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean uUpdate(uList u) {
		Connection c = db.openconn();
		String sql = "update member set uid=?,name=?,sex=?,phone=? where id = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, u.uid);
			p.setString(2, u.name);
			p.setString(3, u.sex);
			p.setString(4, u.phone);
			p.setInt(5, u.id);
			System.out.print("ÎÒÊÇuUpdateµÄid"+u.id);
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
