package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.CheckExistingEmail;
import com.helper.ForgotEmail;

/**
 * Servlet implementation class ForgotEmailServlet
 */
public class ForgotEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("email");
		boolean flag;
		PrintWriter out = response.getWriter();
		CheckExistingEmail em = new CheckExistingEmail();
		flag = em.checkEmail(user);
		if (flag) {
			int otp = (int) (Math.random() * 100000);
			ForgotEmail fe = new ForgotEmail();
			fe.send("mdsaif7004758@gmail.com", "Mirza@123", user, "Forgot Password", "Your OTP is " + otp);
			out.print(otp);
		} else {

			out.print("exists");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
