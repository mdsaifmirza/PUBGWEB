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
<link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-body">
	<%@include file="navbar.jsp"%>


	<div class="container mt-3">

		<!--form  -->
		<form action="RegFormServlet" method="post">
			<div id="regform">
				
				<div class="login-box m-auto" style="width: 100%">
					<input hidden name="formid"
						value="<%=request.getParameter("formid")%>"> <input hidden
						name="userid" value="<%=profile.getUserid()%>">
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input type="text" placeholder="Team name"
								required name="teamname">
						</div>
						
						<div class="textbox col-md m-2">
							<input required type="text"
								placeholder="Paytm No. / Upi Id" name="payment">
						</div>
					</div>
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input required type="text"
								placeholder="Player 1 name" name="player1">
						</div>
						<div class="textbox col-md m-2">
							<input required type="number" 
								placeholder="Player id" name="player1id">
						</div>
					</div>
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input required type="text" 
								placeholder="Player 2 name" name="player2">
						</div>
						<div class="textbox col-md m-2">
							<input required type="number"
								placeholder="Player id" name="player2id">
						</div>
					</div>
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input required type="text"
								placeholder="Player 3 name" name="player3">
						</div>
						<div class="textbox col-md m-2">
							<input required type="number"
								placeholder="Player id" name="player3id">
						</div>
					</div>
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input required type="text" 
								placeholder="Player 4 name" name="player4">
						</div>
						<div class="textbox col-md m-2">
							<input required type="number"
								placeholder="Player id" name="player4id">
						</div>
					</div>
					<div class="form-row">
						<div class="textbox col-md m-2">
							<input required type="number" 
								placeholder="WhatsApp Number" name="whatsapp">
						</div>
						<div class="textbox col-md m-2">
							<input type="number"
								placeholder="refer id (optional)" name="referid">
						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btns btn-primary mt-3" style="max-width: 300px;">Submit</button>
					</div>
				</div>
			</div>
		</form>

		<!--Payment Info  -->
	</div>


	<%--javascript--%>
	<%@include file="component.jsp"%>

</body>
</html>