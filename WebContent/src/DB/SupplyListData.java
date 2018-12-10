package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import demo.SList;
import demo.VList;

public class SupplyListData {
	public static ArrayList<SList> showSListData(int page) {
		ArrayList<SList> s_ListData= new ArrayList<SList>();
		Connection c = db.openconn();
		String sql = "select * from supply limit ?,?";
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
				SList s_List  = new SList();
				s_List.setId(re.getInt(1));
				s_List.setSupply_id(re.getString(2));
				s_List.setSupply_name(re.getString(3));
				
				s_ListData.add(s_List);
			}
			
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  s_ListData;
	}
	public static int listLen() {
		Connection c = db.openconn();
		String sql = "select count(*) from supply ";
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
	public static boolean sInsert(SList s) {
		Connection c = db.openconn();
		String sql = "insert into supply(supply_id,supply_name) values (?,?)";
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,s.supply_id);
			p.setString(2,s.supply_name);
			
			
			p.executeUpdate();
			
			c.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean sDelete(String supply_name) {
		Connection c = db.openconn();
		String sql = "delete from supply where supply_name = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, supply_name);
			p.executeUpdate();
			c.close();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean sUpdate(SList s) {
		Connection c = db.openconn();
		String sql = "update supply set supply_id=?,supply_name=? where id = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,s.supply_id);
			p.setString(2,s.supply_name);
			p.setInt(3, s.id);
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
