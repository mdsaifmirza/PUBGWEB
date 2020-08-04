package com.servlet;

import java.io.IOException;

import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddForm;
import com.helper.FactoryProvider;

public class UpdateList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int teamid = Integer.parseInt(request.getParameter("teamid"));
		int formid = Integer.parseInt(request.getParameter("formid"));
		String action = request.getParameter("action");
		// update
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		if (action.equals("decline")) {
			AddForm af = s.get(AddForm.class, formid);
			int f = af.getSlots();
			Query qr = s.createQuery("update AddForm set slots = :x where formid = :y");
			qr.setParameter("x", f + 1);
			qr.setParameter("y", formid);
			qr.executeUpdate();
			Query q = s.createQuery("update RegistrationList set status = :x where teamid = :y");
			q.setParameter("x", "Decline");
			q.setParameter("y", teamid);
			q.executeUpdate();
		} else {
			Query q = s.createQuery("update RegistrationList set status = :x where teamid = :y");
			q.setParameter("x", "Approve");
			q.setParameter("y", teamid);
			q.executeUpdate();
		}
		tx.commit();
		s.close();
		response.sendRedirect("list.jsp?formid=" + formid);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
