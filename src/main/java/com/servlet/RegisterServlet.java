package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.db.DBConnect;
import com.entity.User;
import com.dao.UserDao;

@MultipartConfig
@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//InputStream fileContent =null;
			
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email=req.getParameter("em");
			String ps=req.getParameter("ps");
			String mobile = req.getParameter("mob");
		
			
			 // Gets the file input from the JSP form
	        Part filePart = req.getPart("file");
	     // Generate a new unique file name
	        String userName = email.substring(0, email.indexOf('@'));
	        String newFileName =  "Resume-" + userName + ".pdf";

	        // Check if the uploaded file is a PDF
	        if (!filePart.getContentType().equals("application/pdf")) {
	            //throw new Exception("Only PDF files are allowed.");
	        	HttpSession session=req.getSession();
	        	session.setAttribute("succMsg","Only PDF files are allowed.");
				resp.sendRedirect("signup.jsp");
	        }


	        // Gets the input stream from the file part
	       // InputStream inputStream = filePart.getInputStream();
			
			//Get path of folder where files going to stored
	      //  String path=getServletContext().getRealPath("")+"resumes";
	        String path="D://FullStackDevelopment//javaDemo//Job_Portal//src//main//webapp//resumes";
	        File file=new File(path);
	        
	        
	        filePart.write(path+File.separator+newFileName);
			System.out.println(path);
	        
	        UserDao dao=new UserDao(DBConnect.getConn());
			
			
			User u =new User(name,email,ps,qua,"User",mobile,newFileName);
			//,mobile,fileContent
			boolean f=dao.addUser(u);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg","User register successfully...");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("succMsg","Something wrong on the server...");
				resp.sendRedirect("signup.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
