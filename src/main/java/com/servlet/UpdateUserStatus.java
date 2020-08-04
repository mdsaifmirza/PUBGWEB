package com.servlet;

import java.io.IOException;

import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateUserStatus
 */
public class UpdateUserStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String status = request.getParameter("status");
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Query q = s.createQuery("update Signup set status = :x where userid = :y");
		if (status.equals("Blocked"))
			q.setParameter("x", "Unblocked");
		else
			q.setParameter("x", "Blocked");
		q.setParameter("y", userid);
		q.executeUpdate();
		tx.commit();
		s.close();
		response.sendRedirect("users.jsp");
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
