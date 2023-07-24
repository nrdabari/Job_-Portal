package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection con;
	
	public static Connection getConn() {
		try {
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String databaseUrl="jdbc:mysql://localhost:3306/job_portal";
				String username="root";
				String password="Dabari@123";
				con=DriverManager.getConnection(databaseUrl,username,password);
				return con;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}

}
