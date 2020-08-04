<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="com.entities.*,java.util.List,org.hibernate.Session,org.hibernate.Transaction,org.hibernate.query.Query,com.helper.FactoryProvider"%>

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
	<div class="text-center">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">UserId</th>
					<th scope="col">Team Name</th>
					<th scope="col">Whatsapp No</th>
					<th scope="col">Payment No</th>
					<th scope="col">Transaction Id</th>
					<th scope="col">Refer By</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					// hibernate fetch
					Session s = FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();
					Query q = s.createQuery("from RegistrationList where formid = :c");
					q.setParameter("c", Integer.parseInt(request.getParameter("formid")));
					List<RegistrationList> list = q.list();
					tx.commit();
					s.close();
					for (RegistrationList rl : list) {
				%>
				<tr>
					<td><%=rl.getUserid()%></td>
					<td><%=rl.getTeamname()%></td>
					<td><%=rl.getWhatsapp()%></td>
					<td><%=rl.getPayment()%></td>
					<td><%=rl.getTransactionid()%></td>
					<td><%=rl.getReferid()%></td>
					<td>
						<%
							if (rl.getStatus().equals("Pending")) {
						%> <a
						href="UpdateList?teamid=<%=rl.getTeamid()%>&formid=<%=request.getParameter("formid")%>&action=aproove"
						class="btn btn-warning"><%=rl.getStatus()%></a> <a
						href="UpdateList?teamid=<%=rl.getTeamid()%>&formid=<%=request.getParameter("formid")%>&action=decline"
						class="btn btn-danger">Decline</a>
						 <%
 							} else {
 						%> 
 							<a class="btn btn-outline-info"><%=rl.getStatus()%></a> 
 						<%
 							}
 						%>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>

	<%@include file="component.jsp"%>
</body>
</html>