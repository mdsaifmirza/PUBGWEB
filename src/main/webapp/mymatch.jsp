<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*,com.helper.*,java.util.List"%>

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
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body class="bg-body">
	<%@include file="navbar.jsp"%>
	<div class="container p-2">
	<h4 class="text-white ml-3"> Upcoming tournament</h4>


		<%
			List<RegistrationList> list = ViewMyMatch.viewByUserId(profile.getUserid());
			for (RegistrationList af : list) {

				List<AddForm> list2 = ViewMyMatch.viewFormByID(af.getFormid());
				for (AddForm rl : list2) {
		%>

		<div class="card m-2 bg-dark text-white">
			<div class="card-body">
				<div class="row">
					<div class="col-8">
						<h5 class="card-title"><%=rl.getTitle()%></h5>
					</div>
					<div class="col-4 text-center">
						<h6>
							Status: (<%=af.getStatus()%>)
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col-8">
						<p class="card-text"><%=rl.getContent()%></p>
					</div>
				</div>
				<div>
					<div class="text-right">
						<button data-toggle="modal" data-target="#<%=af.getTeamid()%>"
							class="btn btn-primary">Team Info</button>
						<%
							String tx = af.getTransactionid();
									if (tx.equals("null")) {
						%>
						<a href="makepayment.jsp?teamid=<%=af.getTeamid()%>"
							class="btn btn-danger text-white">Pay Now</a>
						<p style="font-size: 12px;">Pay under 15 minutes.</p>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="<%=af.getTeamid()%>" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header table-dark">
						<h5 class="modal-title" id="exampleModalLabel"><%=af.getTeamname()%></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body p-0 text-center table-dark">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Player Name</th>
									<th scope="col">Player Id</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td><%=af.getPlayer1()%></td>
									<td><%=af.getPlayer1id()%></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td><%=af.getPlayer2()%></td>
									<td><%=af.getPlayer2id()%></td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td><%=af.getPlayer3()%></td>
									<td><%=af.getPlayer3id()%></td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td><%=af.getPlayer3()%></td>
									<td><%=af.getPlayer3id()%></td>
								</tr>
							</tbody>
						</table>
						<div>
							<p>
								Whatsapp :<%=af.getWhatsapp()%>
							</p>
							<p>
								Payment :<%=af.getPayment()%>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End modal  -->
		<%
			}
			}
		%>
	</div>

	<%--javascript--%>
	<%@include file="component.jsp"%>
</body>
</html>