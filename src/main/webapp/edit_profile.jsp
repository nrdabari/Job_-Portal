<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Edit Profile</h5>
						</div>
						<form action="update_profile" method="post" enctype="multipart/form-data">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="mb-3">
								<label for="name" class="form-label">Enter Full Name</label> <input
									type="text" class="form-control form-control-lg" id="name"
									required name="name" value="${userobj.name }">
							</div>
							<div class="mb-3">
								<label for="qua" class="form-label">Enter Qualification</label>
								<input type="text" class="form-control form-control-lg" id="qua"
									required name="qua" value="${userobj.qualification }">
							</div>
							<div class="mb-3">
								<label for="em" class="form-label">Enter Email</label> <input
									type="email" class="form-control form-control-lg" id="em"
									required name="em" value="${userobj.email }" readonly>								
							</div>
							<div class="mb-3">
								<label for="ps" class="form-label">Password</label>
								<input type="password" class="form-control form-control-lg" id="ps" required 
								name="ps" value="${userobj.password }">
							</div>
							<div class="mb-3">
								<label for="ps" class="form-label">Mobile</label>
								<input type="text" class="form-control form-control-lg" id="mob" required 
								name="mob"  value="${userobj.mobile }">
							</div>
							<div class="mb-3">
								<label for="file" class="form-label">File upload</label>
								 <input class="form-control form-control-sm"  type="file" name="file"  >
							</div>
								<button  class="btn btn-primary badge-pill mt-2 btn-block" type="submit">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>