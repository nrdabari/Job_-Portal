<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin :view jobs</title>
<%@include file="all_component/all_css.jsp"%>
<%@page import="com.db.DBConnect" %>
<%@page import="com.dao.JobDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List" %>
<%@page import="com.entity.Jobs" %>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<c:if test="${not empty succMsg }">
								<div class="alert alert-success" role="alert">${ succMsg }</div>
								<c:remove var="succMsg"/>
							</c:if>
				<%
							
							JobDao dao=new JobDao(DBConnect.getConn());
							List<Jobs> list=dao.getAllJobs();
							for(Jobs j:list)
							{%>
								<div class="card mt-3">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="far fa-clipboard fa-2x" aria-hidden="true"></i>
							</div>
							
							<h6 class="mt-3"><%=j.getTitle() %></h6>
							<p><%=j.getDescription() %></p>
							<br>
							<div class="row">
								<div class=" col-md-4">
									<input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation() %>" readonly>
								</div>
								<div class=" col-md-4">
									<input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory() %>" readonly>
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control form-control-sm" value="Status:<%=j.getStatus() %>" readonly>
								</div>
							</div>
							<h6 class="mt-3">Publish Date:<%=j.getPdate() %></h6>
							<div class="text-center mt-3">
							
								<a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-sm btn-success text-white me-2">Edit</a>
								
								<a href="delete?id=<%=j.getId()%>" 
								class="btn btn-sm btn-danger text-white">Delete</a>
							</div>
						</div>
					</div>
							<%
							}
							%> 
				
				
			</div>
		</div>
	</div>

</body>
</html>
