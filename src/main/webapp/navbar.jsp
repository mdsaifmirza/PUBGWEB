<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand"><img src="img/logo.png"
			style="width: 100px;"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="index.jsp">Home <span
					class="sr-only">(current)</span></a>

				<%
					if (profile != null) {
				%>
				<a class="nav-item nav-link" href="mymatch.jsp"><span
					class="fas fa-list-alt"></span> Registered</a> <a
					class="nav-item nav-link" href="LogoutServlet"><span
					class="fas fa-power-off"></span> logout</a> <a
					class="nav-item nav-link text-capitalize" href=""
					data-toggle="modal" data-target="#ProfileModal"><span
					class="fas fa-portrait"></span> <%=profile.getName()%></a>

				<!--modal profile modal  -->

				<!-- Modal -->
				<div class="modal fade" id="ProfileModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header table-dark text-white">
									<h6>
										<span class="fas fa-check-circle"></span>  Profile details
									</h6>
								
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body table-dark text-left">

								<table class="table text-white">
									<tbody>
										<tr>
											<th><span class="fas fa-user-alt"></span> Name</th>
											<td><%=profile.getName()%></td>
										</tr>
										<tr>
											<th><span class="fas fa-at"></span> Email</th>
											<td><%=profile.getEmail()%></td>
										</tr>
										<tr>
											<th><span class="fas fa-map-marker-alt"></span> City</th>
											<td><%=profile.getCity()%></td>
										</tr>
										<tr>
											<th><span class="fas fa-location-arrow"></span> refer Id</th>
											<td><%=profile.getUserid()%></td>
										</tr>
										<tr>
											<th><span class="fas fa-money-bill-alt"></span> Point</th>
											<td><%=profile.getPoint()%></td>
										</tr>
									</tbody>
								</table>
								<div class="text-right">
									<button type="button" class="btn btns btn-secondary"
										data-dismiss="modal" style="max-width: 100px;">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--End profile modal  -->
				<%
					} else {
				%>
				<a class="nav-item nav-link" href="signup.jsp">Sign up</a> <a
					class="nav-item nav-link" href="login.jsp">login</a>
				<%
					}
				%>

			</div>
		</div>
	</div>
</nav>




