 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row p-4">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fa fa-user-friends fa-3x" aria-hidden="true"></i>
							<c:if test="${not empty succMsg }">
								<div class="alert alert-success" role="alert">${ succMsg }</div>
								<c:remove var="succMsg"/>
							</c:if>
							
							
							
							<h5>Add Jobs</h5>
						</div>
						<form action="add_job" method="post">
							<div class="form-group mb-3">
								<label for="title" class="form-label">Enter Title</label>
								<input type="text" required class="form-control form-control-lg" id="title" name="title" />
							</div>
							<div class="row mb-3">
								<div class="col-md-4">
									<label for="location" class="form-label">Location</label>
									<select class="form-select" id="location" name="location">
										<option selected>Choose..</option>
										<option value="Odisha">Odisha</option>
										<option value="Gujrat">Gujrat</option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Delhi">Delhi</option>
										<option value="Banglore">Banglore</option>
										<option value="Mumbai">Mumbai</option>
									</select>
								</div>
								<div class="col-md-4">
									<label for="category" class="form-label">Category</label>
									<select class="form-select" id="category" name="category">
										<option selected>Choose..</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>
								<div class="col-md-4">
									<label for="status" class="form-label">Status</label>
									<select class="form-select" id="status" name="status">
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
							</div>
							<div class="form-group mb-3">
								<label for="desc" class="form-label">Enter Description</label>
								<textarea required rows="6" id="desc" name="desc" class="form-control"></textarea>
							</div>
							<button type="submit" class="btn btn-success">Publish Job</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
