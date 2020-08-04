<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*"%>

<%
	Signup profile = (Signup) session.getAttribute("currentuser");
%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="bg-body">
	<div class="mb-4">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="login-box m-auto">
		<form action="RegisterServlet" id="regis-form" method="post">

			<div class="text-center" style="font-size: 50px;">
				<i class="fas fa-user-plus"></i>
			</div>
			<br>
			<div class="textbox">
				<i class="fas fa-user-tie"></i> <input type="text" placeholder="Name"
					required name="username">
			</div>
			<div class="textbox">
				<div id="s-msg" class="alert alert-dark" role="alert"
					style="display: none;">Email exists</div>
				<i class="fas fa-user"></i> <input type="email"
					placeholder="Username" required name="useremail">
			</div>


			<div class="textbox">
				<i class="fas fa-lock"></i> <input type="password"
					placeholder="Password" name="userpass" required>
			</div>
			<div class="textbox">
				<i class="fas fa-map-marked-alt"></i> <input type="text" placeholder="city"
					required name="city">
			</div>
			<button id="btn" type="submit" class="btn btns btn-primary">Create account</button>
			<!-- loader -->
			<div class="text-center" id="loader" style="display: none;">
				<div class="spinner spinner-border text-success" role="status">
				</div>
			</div>
		</form>
	</div>


	<%@include file="component.jsp"%>
</body>
</html>