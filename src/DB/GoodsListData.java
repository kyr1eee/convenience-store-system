package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import demo.GList;
import demo.VList;

public class GoodsListData {
	
	public static ArrayList<GList> showGListData(int page) {
		ArrayList<GList> g_ListData= new ArrayList<GList>();
		Connection c = db.openconn();
		String sql = "select * from goods limit ?,?";
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
				GList g_List  = new GList();
				g_List.setId(re.getInt(1));
				g_List.setGoods_id(re.getString(2));
				g_List.setGoods_name(re.getString(3));
				g_List.setGoods_price(re.getString(4));
				g_List.setGoods_pin(re.getString(5));
				g_List.setAccount(re.getString(6));
				g_List.setType(re.getString(7));
				g_List.setVip_account(re.getString(8));
				g_ListData.add(g_List);
			}
			
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  g_ListData;
	}
	public static int listLen() {
		Connection c = db.openconn();
		String sql = "select count(*) from goods ";
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
	
	public static boolean gInsert(GList g) {
		Connection c = db.openconn();
		String sql = "insert into goods(goods_id,goods_name,goods_price,goods_pin,account,type,vip_account) values (?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,g.goods_id);
			p.setString(2,g.goods_name);
			p.setString(3,g.goods_price );
			p.setString(4,g.goods_pin );
			p.setString(5,g.account);
			p.setString(6, g.type);
			p.setString(7, g.vip_account);
			p.executeUpdate();
			
			c.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean gDelete(String goods_pin) {
		Connection c = db.openconn();
		String sql = "delete from goods where goods_pin = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, goods_pin);
			p.executeUpdate();
			c.close();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean gUpdate(GList g) {
		Connection c = db.openconn();
		String sql = "update goods set goods_id=?,goods_name=?,goods_price=?,goods_pin=?,account=?,type=?,vip_account=? where id = ?";
		
		
		try {
			PreparedStatement p;
			p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1,g.goods_id);
			p.setString(2,g.goods_name);
			p.setString(3,g.goods_price );
			p.setString(4,g.goods_pin );
			p.setString(5,g.account);
			p.setString(6, g.type);
			p.setString(7, g.vip_account);
			p.setInt(8,g.id);
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
