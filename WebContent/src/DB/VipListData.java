package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import demo.VList;
import demo.uList;

public class VipListData {
	public static ArrayList<VList> showVListData(int page) {
		ArrayList<VList> v_ListData= new ArrayList<VList>();
		Connection c = db.openconn();
		String sql = "select * from h_member limit ?,?";
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
				VList v_List  = new VList();
				v_List.setId(re.getInt(1));
				v_List.setHid(re.getString(2));
				v_List.setName(re.getString(6));
				v_List.setTime(re.getString(3));
				v_List.setPhone(re.getString(7));
				v_ListData.add(v_List);
			}
			
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  v_ListData;
	}
	public static int listLen() {
		Connection c = db.openconn();
		String sql = "select count(*) from h_member ";
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
	public static boolean vInsert(VList v) {
		Connection c = db.openconn();
		String sql = "insert into h_member(hid,time,name,phone) values (?,?,?,?)";
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,v.hid);
			p.setString(2,v.time);
			p.setString(3, v.name);
			p.setString(4, v.phone);
			
			p.executeUpdate();
			
			c.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean vDelete(String name) {
		Connection c = db.openconn();
		String sql = "delete from h_member where name = ?";
		
		
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
	public static boolean vUpdate(VList v) {
		Connection c = db.openconn();
		String sql = "update h_member set hid=?,time=?,name=?,phone=? where id = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, v.hid);
			p.setString(2, v.time);
			p.setString(3, v.name);
			p.setString(4, v.phone);
			p.setInt(5, v.id);
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
