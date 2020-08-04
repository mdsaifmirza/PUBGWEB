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

import com.entities.Signup;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String useremail = request.getParameter("useremail");
		String password = request.getParameter("userpass");

		// hibernate verify data
		String query = "from Signup where email = :x and password = :y";
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Query<Signup> q = s.createQuery(query);
		q.setParameter("x", useremail);
		q.setParameter("y", password);
		List<Signup> list = q.list();
		tx.commit();
		s.close();
		HttpSession session = request.getSession();
		for (Signup si : list) {
			session.setAttribute("currentuser", si);
			if (si.getStatus().equals("Blocked")) {
				session.setAttribute("msg", "Your Email is Blocked Contact us.");
				session.removeAttribute("currentuser");
				response.sendRedirect("login.jsp");
				return;
			} else if (si.getType().equals("default")) {
				response.sendRedirect("index.jsp");
				return;
			} else if (si.getType().equals("admin")) {
				response.sendRedirect("admin.jsp");
				return;
			}

		}
		session.setAttribute("msg", "incorrect email/password");
		response.sendRedirect("login.jsp");
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
