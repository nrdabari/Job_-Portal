
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration</h5>

						</div>
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success" role="alert">${ succMsg }</div>
							<c:remove var="succMsg" />
						</c:if>

						<form action="add_user" method="post" enctype="multipart/form-data" >
							<div class="mb-3">
								<label for="name" class="form-label">Enter Full Name</label> <input
									type="text" class="form-control form-control-lg" id="name"
									required name="name">
							</div>
							<div class="mb-3">
								<label for="qua" class="form-label">Enter Qualification</label>
								<input type="text" class="form-control form-control-lg" id="qua"
									required name="qua">
							</div>
							<div class="mb-3">
								<label for="em" class="form-label">Enter Email</label> <input
									type="email" class="form-control form-control-lg" id="em"
									required name="em">
							</div>
							<div class="mb-3">
								<label for="ps" class="form-label">Password</label> <input
									type="password" class="form-control form-control-lg" id="ps"
									required name="ps">
							</div>
							<div class="mb-3">
								<label for="mob" class="form-label">Enter Mobile Number</label>
								<input type="text" class="form-control form-control-lg" id="mob"
									 name="mob" >
							</div>
						<div class="mb-3">
								<label for="file" class="form-label">File upload</label>
								 <input class="form-control form-control-sm" type="file" name="file">
							</div>
							<button class="btn btn-primary badge-pill mt-2 btn-block"
								type="submit">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
