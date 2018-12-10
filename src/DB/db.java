package DB;

import java.security.PublicKey;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class db {
	public static void newUser(String newUser) {
		String sql = "Create ";
		
	}
	
	
	public static String URL = "jdbc:mysql://localhost:3306/kyr1e?characterEncoding=utf-8";//加utf-8 不然中文输入数据库变问号
	public static String USER = "root";
	public static String PWD = "";
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e) {
			
		}
	}
	
	public static Connection openconn() {
		Connection conn = null;
		try {
			conn =  (Connection) DriverManager.getConnection(URL,USER,PWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		Connection connection = openconn();
		if(connection != null) {
			System.out.println("yes");
		}
	}
}
