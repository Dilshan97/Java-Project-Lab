package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import db.dbconnect;

public class Item {

	public String getItem() {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String itemGrid = null;
		
		try {
			
			String sql = "SELECT * FROM items";
			
			conn = dbconnect.connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				itemGrid = "<table border='1' cellspacing='1' cellpadding='1'><tr><th>No</th><th>Name</th><th>Description</th><th>Edit</th><th>Delete</th></tr>";
				
				rs.beforeFirst();
				
				while(rs.next()) {
					itemGrid = itemGrid + "<tr><td>" + rs.getString(1) + "</td>"
							+ "<td>" + rs.getString(2) + "</td>"
							+ "<td>" + rs.getString(3) + "</td>"
							+ "<td><input id=\"btnEdit\" type=\"button\" name=\"btnEdit\" param=\"" + rs.getString(1) + "\" value=\"Edit\"</td>"
							+ "<td>" + "<input id=\"btnRemove\" type=\"button\" name=\"btnRemove\" param=\"" + rs.getString(1) + "\" value=\"Remove\"</td></tr>";
				}
			}
			else {
				itemGrid = "There are no Item...";
				itemGrid = itemGrid + "</table></br>";
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return itemGrid;
		
	}
	
	public String saveAnItem(String itemName, String itemDesc) {
		
		String res = null;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String sql = "INSERT INTO items(nameitems, descitems) VALUES('"+ itemName +"', '"+ itemDesc +"')";
			conn = dbconnect.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
			res = "Successfully inserted...";
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return res;
	}
	
}
