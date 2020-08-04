$(document).ready(function() {

	// payment info

	$('#view-btn').click(function() {

		$("#img2").hide()
		$("#img1").show()
	})
	$('#view-btn1').click(function() {

		$("#img2").show()
		$("#img1").hide()
	})

	// forgot password

	$('#forgotid').click(function() {

		$("#forgot").show()
		$("#login").hide()
		console.log("done")
	})

});

// ajax otp request

$(document).ready(function() {
	$("#forgotform").on('submit', function(event) {

		event.preventDefault();
		var emi=$("#emi").val();
		$("#loader").show();
		$("#btn").hide();
		var f = $(this).serialize();
		var otp;

		$.ajax({
			url : "ForgotEmailServlet",
			data : f,
			type : 'POST',
			success : function(data, textStatus, jqXHR) {
				otp = data.trim();
				if (otp == "exists") {
					$("#f-msg").show()
					$("#loader").hide();
					$("#btn").show();
				} else {
					$("#forgot").hide()
					$("#verifyotp").show()
				}
			},
			error : function(data, textStatus, errorThrown) {
				swal("Something went wrong Try after some time");
				
			}
		});
		$('#btn2').click(function() {
			var o = $("#input").val();
			if (otp == o) {
				swal("Verify Successfully");
				$("#otpform").hide();
				$("#cnf").show();
				$("#inp").val(emi);
				console.log(emi);
				$("#inp").attr("readonly","readonly");
			} else {
				swal("Incorrect Otp Enter Valid Otp");
			}
		})

	})
});
// ajax sigup request

$(document).ready(function() {
	$("#regis-form").on('submit', function(event) {

		event.preventDefault();
		$("#loader").show();
		$("#btn").hide();
		var f = $(this).serialize();
		$.ajax({
			url : "RegisterServlet",
			data : f,
			type : 'POST',
			success : function(data, textStatus, jqXHR) {
				if (data.trim() == "exists") {
					$("#s-msg").show()
					$("#loader").hide();
					$("#btn").show();
				} else {
					swal("Good job!", "Registration Successful!", "success");
					window.location="login.jsp";
				}
			},
			error : function(data, textStatus, errorThrown) {
				swal("Error!", "Try After Sometime!", "error");
				$("#loader").hide();
				$("#btn").show();
			}
		});
	})
});



$(document).ready(function() {
	if ($(window).width()<=767){
		$("#back").addClass("mob");
		$("#cont").addClass("i-banner");
	}
	else{
		$("#back").addClass("banner");
		$("#cont").addClass("mob-banner");
	}
});


$(window).resize(function() {
	if ($(window).width()<=767){
		$("#back").removeClass("banner");
		$("#back").addClass("mob");
	}
	else{
		$("#back").removeClass("mob");
		$("#back").addClass("banner");
	}
});
