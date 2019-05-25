package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnect {

	public static Connection connect() throws ClassNotFoundException {
		
		Connection conn = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/paf_exam", "root", "");
			
			if(conn != null) {
				System.out.println("Connection Ok");
			}
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return conn;
		
	}
}
