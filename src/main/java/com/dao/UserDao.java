package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import com.entity.User;

public class UserDao {
	private Connection con=null;

	public UserDao(Connection con) {
		super();
		this.con=con;
	}
	public boolean addUser(User u)
	{
		boolean f =false;
		try {
			String query="insert into user(name,qualification,email,password,role,mobile,resume) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3,u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, "user");
			ps.setString(6,u.getMobile());
		    ps.setString(7, u.getResume());
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User login(String em,String psw) {
		User u=null;
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, em);
			ps.setString(2, psw);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
				u.setMobile(rs.getString(7));
				//Blob fileBlob = (Blob) rs.getBlob(8);
				//InputStream inputStream = fileBlob.getBinaryStream();
				u.setResume(rs.getString(8));
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public boolean updateUser(User u)
	{
		boolean f =false;
		try {
		//	String query="update user set name=?,qualification=?,email=?,password=?,mobile=?,resume=? where id=?";
			 String query = "update user set name=?,qualification=?,email=?,password=?,mobile=?";
		        if(u.getResume() != null) {
		            query += ",resume=?";
		        }
		        query += " where id=?";
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3,u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5,u.getMobile());
			//ps.setString(6, u.getResume());
		//	ps.setInt(7, u.getId());
			 int paramIndex = 6;
		        if(u.getResume() != null) {
		            ps.setString(paramIndex++, u.getResume());
		        }
		        
		        ps.setInt(paramIndex, u.getId());
		        
			int i= ps.executeUpdate();
			if(i==1) {
				
				
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
