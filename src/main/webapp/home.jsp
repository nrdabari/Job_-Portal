<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.JobDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Home</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<c:if test="${not empty succMsg }">
								<h4 class="text-center text-danger" role="alert">${ succMsg }</h4>
								<c:remove var="succMsg"/>
							</c:if>
				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="row mb-3">
								<div class=" col-md-5 mt-1">
									<h5>Location</h5>
								</div>
								<div class=" col-md-4 mt-1">
									<h5>Category</h5>
								</div>
							</div>
							<div class="row mb-3">
							<div class=" col-md-5">
									<select class="form-select" id="location" name="loc">
										<option selected value="lo">Choose..</option>
										<option value="Odisha">Odisha</option>
										<option value="Gujrat">Gujrat</option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Delhi">Delhi</option>
										<option value="Banglore">Banglore</option>
										<option value="Mumbai">Mumbai</option>
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-select" id="category" name="cat">
										<option selected value="ca">Choose..</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
									
								</div>
								<div class=" col-md-3">
								<button class="btn btn-success ms-2">Submit</button>
								</div>
							</div>
							
						</form>
					</div>
				</div>
				<%
					JobDao dao=new JobDao(DBConnect.getConn());
					List<Jobs> list=dao.getAllJobsForUser();
					for(Jobs j:list){
					%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle() %></h6>
						<%
					if(j.getDescription().length()>0 && j.getDescription().length()<120){
					%>
						<p><%=j.getDescription() %>.
						</p>
						<%}else { %>
						<p>
							<%=j.getDescription().substring(0,120)%>...
						</p>
						<%} %>
						<br>
						<div class="row">
							<div class=" col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation() %>" readonly >
							</div>
							<div class=" col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory() %>" readonly >
							</div>
						</div>
						<h6 class="mt-3">
							Publish Date:<%=j.getPdate().toString() %></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%> "
						class="btn btn-sm bg-success text-white">view more</a>
						</div>
					</div>
				</div>
				<%} %>


			</div>
		</div>

	</div>
</body>
</html>