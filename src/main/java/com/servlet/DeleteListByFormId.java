package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;


public class DeleteListByFormId extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int formid= Integer.parseInt(request.getParameter("formid"));
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();

		Query q = s.createQuery("delete from RegistrationList where formid = :c");
		q.setParameter("c", formid);
		q.executeUpdate();

		tx.commit();
		s.close();
		response.sendRedirect("admin.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
