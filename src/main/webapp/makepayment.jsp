<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entities.*"%>
<%
	Signup profile = (Signup) session.getAttribute("currentuser");
	if (profile == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	String teamid = request.getParameter("teamid");
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
<body class="bg-body">
	<div class="mb-3">
		<%@include file="navbar.jsp"%>
	</div>
	<!--Payment Info  -->

	<div class="login-box m-auto text-center text-white"
		style="max-width: 700px;">
		<div class=" alert alert-dark font-weight-bold text-center">Make
			Payment Online</div>
		<div class="p-3">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="inlineRadioOptions" id="view-btn"> <label
					class="form-check-label" for="inlineRadio1">Paytm</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="inlineRadioOptions" id="view-btn1"> <label
					class="form-check-label" for="inlineRadio2">Bhim Upi</label>
			</div>
			<div class="m-3" id="img1" style="display: none;">
				<img id="paym" class="card-img-top mx-auto" src="img/code1.png"
					alt="Card image cap">
			</div>
			<div class="m-3" id="img2" style="display: none;">
				<img id="paym" class="card-img-top mx-auto" src="img/logoo.png"
					alt="Card image cap">
			</div>
			<form action="UpdateTx">
				<input readonly hidden name="teamid" value="<%=teamid%>">

				<div class="textbox">
					<input required type="text" name="transactionid"
						placeholder="Transaction id">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btns btn-primary">Pay</button>
				</div>
			</form>
		</div>
	</div>
	<!--End Payment Info  -->
	<%--javascript--%>
	<%@include file="component.jsp"%>
</body>
</html>