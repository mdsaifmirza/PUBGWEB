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
<body style="background-color: #E5E7E9;">
	<%@include file="navbar.jsp"%>
	<div class="container-fluid text-center">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">User Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email Id</th>
					<th scope="col">Refer Point</th>
					<th scope="col">Id Status</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<Signup> list = new ViewForm().userDetails();
					for (Signup sg : list) {
				%>

				<tr>
					<th scope="row"><%=sg.getUserid()%></th>
					<td><%=sg.getName()%></td>
					<td><%=sg.getEmail()%></td>
					<td><%=sg.getPoint()%></td>
					<td><a
						href="UpdateUserStatus?userid=<%=sg.getUserid()%>&status=<%=sg.getStatus()%>"
						class="btn btn-dark"><%=sg.getStatus()%></a></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>

</body>
</html>