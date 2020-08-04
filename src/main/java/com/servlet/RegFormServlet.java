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
import com.entities.RegistrationList;
import com.entities.Signup;
import com.helper.FactoryProvider;

public class RegFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String teamname = request.getParameter("teamname");
		String player1 = request.getParameter("player1");
		String player2 = request.getParameter("player2");
		String player3 = request.getParameter("player3");
		String player4 = request.getParameter("player4");
		String player1id = request.getParameter("player1id");
		String player2id = request.getParameter("player2id");
		String player3id = request.getParameter("player3id");
		String player4id = request.getParameter("player4id");
		int formid = Integer.parseInt(request.getParameter("formid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		String whatsapp = request.getParameter("whatsapp");
		String referid = request.getParameter("referid");
		String payment = request.getParameter("payment");

		RegistrationList rlist = new RegistrationList(teamname, player1, player2, player3, player4, player1id,
				player2id, player3id, player4id, formid, whatsapp, userid, "null", referid, "Pending", payment);

		// hibernate save
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		AddForm af = s.get(AddForm.class, formid);
		int f = af.getSlots();
		if (f > 0) {
			Query q = s.createQuery("update AddForm set slots = :x where formid = :y");
			q.setParameter("x", f - 1);
			q.setParameter("y", formid);
			q.executeUpdate();
		}
		if (referid != "") {
			Signup sg = s.get(Signup.class, userid);
			int p = sg.getPoint();
			Query q = s.createQuery("update Signup set point = :x where userid = :y");
			q.setParameter("x", p + 5);
			q.setParameter("y", userid);
			q.executeUpdate();
		}
		if (f > 0) {
			s.save(rlist);
		}
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
