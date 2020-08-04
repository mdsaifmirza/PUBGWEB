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
	<h3 class="text-center mt-1">Admin Panel (Saif)</h3>

	<div class="container admin mt-3">
		<div class="row">
			<div class="col-md-4">
				<a href="users.jsp" style="text-decoration: none; color: black;">
					<div class="card" style="width: 22rem;">

						<div class="card-body text-center">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								src="img/people.png" alt="Card image cap">
							<h5 class="card-title">Total Users</h5>
							<p class="card-text">View Total Signup User List.</p>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#add-form"
					style="width: 22rem;">
					<div class="card-body text-center">
						<img style="max-width: 100px;" class="img-fluid rounded-circle"
							src="img/add.png" alt="Card image cap">
						<h5 class="card-title">Add Form</h5>
						<p class="card-text">Create a new form for Tournament.</p>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#remove-form"
					style="width: 22rem;">
					<div class="card-body text-center">
						<img style="max-width: 100px;" class="img-fluid rounded-circle"
							src="img/basket.png" alt="Card image cap">
						<h5 class="card-title ">View/Remove Form</h5>
						<p class="card-text">Some quick example text to build on .</p>

					</div>
				</div>
			</div>
		</div>



		<div class="row text-center mt-4">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<img style="max-width: 100px;" class="img-fluid rounded-circle"
							src="img/bank.png" alt="Card image cap">
						<h5 class="card-title text-center">Payment page</h5>
						<p class="card-text">With supporting text below as a.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target=".list-modal">
					<div class="card-body">
						<img style="max-width: 100px;" class="img-fluid rounded-circle"
							src="img/basket.png" alt="Card image cap">
						<h5 class="card-title text-center">Registration List</h5>
						<p class="card-text">View List by Form id.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--modal add form  -->
	<!-- Modal -->
	<div class="modal fade" id="add-form" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title text-white" id="exampleModalLabel">Add
						Form</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddFormServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Title"
								name="title">
						</div>
						<div class=" row">
							<div class="form-group col">
								<input name="capacity" type="number" class="form-control"
									placeholder="Capacity">
							</div>
							<div class="form-group col">
								<input name="slots" type="number" class="form-control"
									placeholder="slots">
							</div>
							<div class="form-group col">
								<input name="group" type="number" class="form-control"
									placeholder="group">
							</div>
						</div>
						<div class="form-group">
							<textarea name="content" class="form-control"
								placeholder="Content here" required style="height: 100px;"></textarea>

						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="8 Aug 2020 , 18:00 (schedule format)"
								name="schedule">
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="custom-file">
									<input name="image" type="file" class="custom-file-input"
										id="inputGroupFile04"> <label
										class="custom-file-label" for="inputGroupFile04">Choose
										Image</label>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!--End modal add from  -->


	<!--modal remove form  -->


	<!-- Modal -->
	<div class="modal fade" id="remove-form" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title text-white" id="exampleModalLabel">View/Remove
						Form</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<%
						List<AddForm> list = ViewForm.viewForm();
						for (AddForm af : list) {
					%>


					<div class="card mt-2">
						<div class="card-body">
							Form Id : <input readonly type="text" name="id"
								value="<%=af.getFormid()%>" style="width: 100px; border: none;"><br>
							<h6 class="card-title"><%=af.getTitle()%>
								(
								<%=(af.getCapacity() / af.getGrp()) - af.getSlots()%>/<%=af.getCapacity() / af.getGrp()%>
								)
							</h6>
							<hr>
							<h6>Rules:</h6>
							<p class="card-text"><%=af.getContent()%></p>
							<div class="text-center">
								<a
									href="RemoveFormServlet?id=<%=af.getFormid()%>&imagename=<%=af.getImagename()%>"
									class="btn btn-danger">Remove</a>
							</div>
						</div>
					</div>

					<%
						}
					%>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

					</div>
				</div>

			</div>
		</div>
	</div>

	<!--End modal remove from  -->
	<!--List Modal  -->
	<div class="modal fade list-modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content p-3 text-center">
				<form id="form" action="list.jsp">
					<label>Approved By Form Id</label> <input class="form-control" name="formid" required>
					<button type="submit" class="btn btn-info mt-3">Get List</button>
				</form>
				<hr>
				<form id="form" action="DeleteListByFormId">
					<label>Delete List By Form Id</label> <input class="form-control" name="formid" required>
					<button type="submit" class="btn btn-danger mt-3">Delete</button>
				</form>
				<hr>
				<a href="viewlist.jsp" class="btn btn-success">View Total List</a>
			</div>
		</div>
	</div>

	<!--End List Modal  -->
	<%@include file="component.jsp"%>
</body>
</html>