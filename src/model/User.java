package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import db.dbconnect;

public class User {

	public String login(String userN, String passW) {
		
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		
		String userName = "";
		String password = "";
		
		String sql = "SELECT nameUser, passUser FROM Users";
		
		try {
			
			conn = dbconnect.connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				userName = rs.getString("nameUser");
				password = rs.getString("passUser");
				
				if(userN.equals(userName) && passW.equals(password)) {
					return "Success";
				}
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return "Invalid user Credentials...";
	}
}
