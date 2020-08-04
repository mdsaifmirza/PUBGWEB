package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Signup;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class ChangePasswordServlet
 */
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pass=request.getParameter("password");
		String email=request.getParameter("email");
		//update password
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		String query = "update Signup set password = :y where email = :x";
		Query<Signup> q= s.createQuery(query);
		q.setParameter("y", pass);
		q.setParameter("x", email);
		q.executeUpdate();
		tx.commit();
		s.close();
		response.sendRedirect("login.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
