package DB;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.ha.backend.Sender;
import org.omg.CORBA.PRIVATE_MEMBER;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import javafx.scene.web.WebView;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class loginHandle {
	static String message = "登陆成功" ;
	public static int checkUser(String name) {
		Connection conn = db.openconn();
		String sql = "select * from user where name = ?";
		String userMessage ;
		try {
			PreparedStatement p = (PreparedStatement) conn.prepareStatement(sql);
			p.setString(1, name);
			ResultSet re;
			re = p.executeQuery();
			while(re.next()) {
				return 1;
			}
			userMessage = "用户不存在";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	public static int handle(String name,String pwd) {
		Connection conn = db.openconn();
		String sql = "select * from user where name = ? and pwd = ?";
		
		try {
			PreparedStatement p = (PreparedStatement) conn.prepareStatement(sql);
			p.setString(1, name);
			p.setString(2, pwd);
			ResultSet re;
			re = p.executeQuery();
			
			while(re.next()) {
				System.out.print(re.getString(2));
				System.out.print(re.getString(3));
				System.out.print(re.getString(4));
				
				return 1;

		}
		conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public static void sendData() {
		
	}
	
	public static void main(String[] args)  {
		handle("admin", "53456");
	}
}
