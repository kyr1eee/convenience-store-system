package DB;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.ws.Response;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.sun.org.apache.regexp.internal.recompile;

public class saveData {
	public static void save(String name,String pwd,String email) {
		Connection conn = db.openconn();
		String sql = "insert into user(name,pwd,email) values(?,?,?)";
		try {
			PreparedStatement p = (PreparedStatement) conn.prepareStatement(sql);
			p.setString(1, name);
			p.setString(2, pwd);
			p.setString(3, email);
			
			p.executeUpdate();
			
		
		conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public static boolean checkUser(String name) {
		Connection c = db.openconn();
		String sql  = "select * from user where name = ?";
		try {
			PreparedStatement p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, name);
			
			ResultSet re = p.executeQuery();
			if(re.next()) {
				return false;
			}
			else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean checkEmail(String email) {
		Connection c = db.openconn();
		String sql  = "select * from user where email = ?";
		try {
			PreparedStatement p = (PreparedStatement) c.prepareStatement(sql);
			p.setString(1, email);
			ResultSet re = p.executeQuery();
			if(re.next()) {
				System.out.print("´æÔÚ");
				return false;
			}
			else {
				System.out.print("²»´æÔÚ");
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean checkData(String name,String pwd,String email) {
		if(checkUser(name) && checkEmail(email) ) {
			save(name, pwd, email);
			return true;
		}
		else if(!checkEmail(email)){
			return false;
		}
		else if(!checkUser(name)){
			return false;
		}
		else {
			return false;
		}
		
	}
	
	public static void main(String[] args) {
		
	}
}
