<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*"%>

<%
	Signup profile = (Signup) session.getAttribute("currentuser");
	if (profile == null) {
		response.sendRedirect("login.jsp");
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

<title>HomePage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">


</head>
<body style="background-color: #E5E7E9;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">ToDo NoteBook</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link"
					href="mymatch.jsp"><span class="fas fa-list-alt"></span>
						Registered</a></li>
				<li class="nav-item"><a class="nav-link"
					href="LogoutServlet"><span class="fas fa-power-off"></span>
						logout</a></li>
				<li class="nav-item"><a
					class="nav-link text-capitalize" href=""
					data-toggle="modal" data-target="#ProfileModal"><span
						class="fas fa-portrait"></span> <%=profile.getName()%></a></li>

			</ul>
		</div>
	</nav>

	<%--javascript--%>
	<%@include file="component.jsp"%>

</body>
</html>