<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User :Single Job</title>
<%@include file="all_component/all_css.jsp"%>
<%@page import="com.db.DBConnect" %>
<%@page import="com.dao.JobDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List" %>
<%@page import="com.entity.Jobs" %>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj }">
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
							int id=Integer.parseInt(request.getParameter("id"));
							JobDao dao=new JobDao(DBConnect.getConn());
							Jobs j=dao.getJobById(id);
							%>
								<div class="card mt-5">
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
								
							</div>
							<h6 class="mt-3">Publish Date:<%=j.getPdate() %></h6>
							
						</div>
					</div>
							
				
				
			</div>
		</div>
	</div>

</body>
</html>
