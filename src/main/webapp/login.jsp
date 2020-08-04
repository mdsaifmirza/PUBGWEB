<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*"%>

<%
	Signup profile = (Signup) session.getAttribute("currentuser");
	if (profile != null) {
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="bg-body">
	<div class="mb-4">
		<%@include file="navbar.jsp"%>
	</div>
	<div>
		<!--login form  -->
		<div id="login" class="login-box m-auto">
			<form action="LoginServlet" method="post">
				<div class="text-center" style="font-size: 50px;">
					<i class="fas fa-user-circle"></i>
				</div>
				<br>

				<%
					String s = (String) session.getAttribute("msg");
					if (s != null) {
				%>
				<div class="alert alert-dark" role="alert"><%=s%></div>
				<%
					session.removeAttribute("msg");
					}
				%>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="email"
						placeholder="Enter email" name="useremail" required>
				</div>
				<small style="font-size: 10px;">We'll never share your email
					with anyone else.</small>

				<div class="textbox">
					<i class="fas fa-lock"></i> <input type="password"
						placeholder="Password" name="userpass" required>
				</div>

				<button type="submit" class="btn btns btn-primary mt-3">Sign in</button>
			</form>

			<div class="text-center text-white mt-2"
				style="text-decoration: none; font-size: 13px;">
				<a id="forgotid">Forgot Password ? </a> <a
					style="color: white; text-decoration: none;" href="signup.jsp">Create
					Account</a>
			</div>
		</div>

		<!--forgot form  -->
		<div id="forgot" class="login-box m-auto" style="display: none;">

			<div class="text-center" style="font-size: 50px;">
				<i class="fas fa-user-edit"></i>
			</div>
			<br>

			<form id="forgotform" action="ForgotEmailServlet" method="post">

				<div id="f-msg" class="alert alert-dark" role="alert"
					style="display: none;">Account does't exists</div>

				<div class="textbox">
					<i class="fas fa-user"></i> <input type="email"
						placeholder="Enter email" name="email" required id="emi">
				</div>
				<button id="btn" type="submit" class="btn btns btn-primary mt-3">Forgot</button>

				<!-- loader -->
				<div class="text-center" id="loader" style="display: none;">
					<div class="spinner spinner-border text-success" role="status">
					</div>
					<p>Please Wait</p>
				</div>
			</form>
		</div>
		<!--verify otp  -->
		<div id="verifyotp" class="login-box m-auto" style="display: none;">

			<div class="card-header text-white">Forgot Password</div>


			<div id="otpform">

				<div class="textbox">
					<i class="fas fa-user"></i> <input placeholder="OTP" name="number"
						required id="input">
				</div>

				<small style="font-size: 10px;">OTP sent on your registered
					email.</small>


				<button id="btn2" class="btn btns btn-primary mt-3">Submit</button>

			</div>
			<div id="cnf" style="display: none;">
				<form action="ChangePasswordServlet" method="post">
					<div class="textbox">
						<i class="fas fa-user"></i> <input id="inp" name="email">
					</div>
					<div class="textbox">
						<i class="fas fa-lock"></i> <input type="password"
							placeholder="New Password" name="password" required>
					</div>
					<button type="submit" class="btn btns btn-primary mt-3">Save
						Password</button>
				</form>
			</div>
		</div>
	</div>

	<%@include file="component.jsp"%>
</body>
</html>
