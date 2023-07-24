package com.entity;



public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String qualification;
	private String role;
	private String mobile;
	private String resume;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String fname) {
		this.resume = fname;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public User(String name, String email, String password, String qualification, String role,String mobile,String file_name) {
		//,InputStream filePath
		
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.qualification = qualification;
		this.role = role;
	this.mobile=mobile;
		this.resume=file_name;
		
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
