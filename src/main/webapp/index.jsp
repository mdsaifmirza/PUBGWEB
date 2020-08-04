<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.entities.*,com.helper.ViewForm,java.util.*"%>

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
<title>HomePage</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<!--front banner  -->
	<div class="" id="back"></div>
	<div class="container text-white mb-4" id="cont">
		<div class="row">
			<h2 class=" font-weight-bold ml-3">PUBG MOBILE Tournament</h2>
			<div class="col-8">
				<p class="lead">Welcome to PlayerUnknown's Battlegrounds (PUBG)</p>
				<p>Prove your skills in front of players.</p>
			</div>
		</div>
		<div class="mt-4">
			<h3>Tournaments</h3>
		</div>
	</div>
	<!--end front banner  -->
	<div class="container i-banner" id="hover-card">
		<div class="row">
			<%
				List<AddForm> list = ViewForm.viewForm();
				Collections.reverse(list);
				for (AddForm af : list) {
			%>
			<div class="col-sm-4">
				<div class="card mt-4" id="card-bg">
					<img class="card-img-top" src="formimage/<%=af.getImagename()%>"
						alt="Card image cap">
					<div class="card-body text-white">
						<h5 class="card-title"><%=af.getTitle()%>
							(
							<%=(af.getCapacity() / af.getGrp()) - af.getSlots()%>/<%=af.getCapacity() / af.getGrp()%>
							)
						</h5>
						<p class="card-text"><%=af.getContent()%></p>

					</div>

					<div class="row text-white p-2">

						<div class="ml-3 col text-left mute-tx">
							<small><%=af.getSchedule()%></small>
						</div>
						<%
							if (af.getSlots() != 0) {
						%>
						<div class="col-4 text-right mr-1 ">
							<a href="registration.jsp?formid=<%=af.getFormid()%>"
								class="btn btn-primary">join us</a>
						</div>
						<%
							} else {
						%>

						<div class="col text-right mr-1">
							<a class="btn btn-danger bg-danger">Close</a>
						</div>

						<%
							}
						%>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<hr>
	<div class="bg-dark text-center text-white">
		
			<h4 class="pt-5">Contact Details</h4>
			<p>if you any Query contact us via email or call our team process
				your query as soon as possible.</p>
			<i class="fa fa-phone px-2 text-warning"></i> <i class="fa fa-heart px-2 text-danger"></i>
			<p>+91 7004758574 <br>mdsaifmirza786@gmail.com</p>
		<div class="p-3">Copyright © all right reserved.</div>
	</div>
	<%@include file="component.jsp"%>
</body>
</html>
