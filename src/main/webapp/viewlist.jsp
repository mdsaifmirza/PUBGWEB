<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*,com.helper.ViewForm,java.util.List"%>

<%
	Signup profile = (Signup) session.getAttribute("currentuser");
	if (profile.getType().equals("default")) {
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
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body style="background-color: white;">
	<%@include file="navbar.jsp"%>

	<div class="container-fluid text-center">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Form Id</th>
					<th scope="col">Account Id</th>
					<th scope="col">Team Id</th>
					<th scope="col">Team Name</th>
					<th scope="col">Transaction id</th>
					<th scope="col">Form Status</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<RegistrationList> list = new ViewForm().registrationList();
					for (RegistrationList sg : list) {
				%>

				<tr>
					<th scope="row"><%=sg.getFormid()%></th>
					<th><%=sg.getUserid()%></th>
					<th><%=sg.getTeamid()%></th>
					<td><%=sg.getTeamname()%></td>
					<td><%=sg.getTransactionid()%></td>
					<td><%=sg.getStatus()%></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>


		<%@include file="component.jsp"%>
</body>
</html>