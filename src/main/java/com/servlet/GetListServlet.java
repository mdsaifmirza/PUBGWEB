package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.RegistrationList;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class GetListServlet
 */
public class GetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int formid = Integer.parseInt(request.getParameter("formid"));

		// hibernate fetch
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Query q = s.createQuery("from RegistrationList where formid = :c");
		q.setParameter("c", formid);
		List<RegistrationList> list = q.list();
		tx.commit();
		s.close();
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		response.sendRedirect("list.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
