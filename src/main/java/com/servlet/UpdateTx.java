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

public class UpdateTx extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int teamid = Integer.parseInt(request.getParameter("teamid"));
		String transactionid = request.getParameter("transactionid");
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Query q = s.createQuery("update RegistrationList set transactionid = :x where teamid = :y");
		q.setParameter("x", transactionid);
		q.setParameter("y", teamid);
		q.executeUpdate();
		tx.commit();
		s.close();
		response.sendRedirect("mymatch.jsp");
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
