package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    public int BUFFER_SIZE=1024*1000;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		String filename=req.getParameter("file");
		
		 String path="D://FullStackDevelopment//javaDemo//Job_Portal//src//main//webapp//resumes"+File.separator+filename;
	        File file=new File(path);
	        OutputStream os=null;
	        FileInputStream in=null;
	        
	        response.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
	        response.setContentType("application/octet-stream");
	        
	        if(file.exists()) {
	        	os=response.getOutputStream();
	        	in=new FileInputStream(file);
	        	byte[] b=new byte[BUFFER_SIZE];
	        	int byteRead=-1;
	        	while((byteRead=in.read(b))!=-1) {
	        	os.write(b,0,byteRead);
	        	}
	        }else {
	        	System.out.println("File not found");
	        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
