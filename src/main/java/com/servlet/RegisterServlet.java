package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Signup;
import com.helper.CheckExistingEmail;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("username");
		String email = request.getParameter("useremail");
		String password = request.getParameter("userpass");
		String city = request.getParameter("city");
		int point = 0;
		boolean flag;
		CheckExistingEmail em = new CheckExistingEmail();
		PrintWriter out = response.getWriter();
		flag = em.checkEmail(email);
		if (flag) {
			out.print("exists");
		} else {
			Signup signup = new Signup(name, email, password, city, "default", point, "Unblocked");
			if (signup != null) {
				// hibernate save
				Session s = FactoryProvider.getFactory().openSession();
				Transaction tx = s.beginTransaction();
				s.save(signup);
				tx.commit();
				s.close();
			}
			out.print("done");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
