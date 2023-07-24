<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login page</h5>
                               <c:if test="${not empty succMsg }">
								  <h4 class="text-center text-danger" role="alert">${ succMsg }</h4>
								  <c:remove var="succMsg"/>
							   </c:if>
						</div>
						<form action="login" method="post">


							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email</label> <input
									type="email" id="exampleInputEmail1" required="required"
									class="form-control form-control-lg"
									aria-describedby="emailHelp" name="email" />

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" id="exampleInputPassword1" required="required"
									class="form-control form-control-lg" name="password" />

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