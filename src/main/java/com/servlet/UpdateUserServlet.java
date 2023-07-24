package com.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UpdateUserServlet
 */
@MultipartConfig
@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email=req.getParameter("em");
			String ps=req.getParameter("ps");
			String mob=req.getParameter("mob");
			String resume = null; // initialize to null
			 // Gets the file input from the JSP form
	        Part filePart = req.getPart("file");
	        String fileName = filePart.getSubmittedFileName();
	        if (fileName != null && !fileName.isEmpty()) {
	        	 // Generate a new unique file name
		        String userName = email.substring(0, email.indexOf('@'));
		        String newFileName =  "Resume-" + userName + ".pdf";

	        	 //Get path of folder where files going to stored
	            String path = "D://FullStackDevelopment//javaDemo//Job_Portal//src//main//webapp//resumes";
	            File file = new File(path);

	        	  if (!file.exists()) {
	                  file.mkdirs();
	              }
	        	// Check if the file with the same name already exists
	        	  File existingFile = new File(path + File.separator + newFileName);
	        	  if (existingFile.exists()) {
	        	      existingFile.delete();
	        	      while (existingFile.exists()) {
	        	          // Wait until the file is completely deleted
	        	          try {
	        	              Thread.sleep(100);
	        	          } catch (InterruptedException e) {
	        	              e.printStackTrace();
	        	          }
	        	      }
	        	   //   File existingFile = new File(path + File.separator + newFileName);
	        	  }
	        	  filePart.write(path + File.separator + newFileName);
	              // Set the resume field to the filename
	              resume = newFileName;
	          }
			
			
			UserDao dao=new UserDao(DBConnect.getConn());
			
			User u =new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setPassword(ps);
			u.setEmail(email);
			u.setMobile(mob);
			u.setResume(resume);
			
			boolean f=dao.updateUser(u);
			
			HttpSession session=req.getSession();
			if(f) {
				User user=dao.login(email, ps);
				
				session.setAttribute("userobj", user);
				
				session.setAttribute("succMsg","Profile Update Succefully.");
				resp.sendRedirect("home.jsp");
			}
			else {
				session.setAttribute("succMsg","Something wrong on the server...");
				resp.sendRedirect("home.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
