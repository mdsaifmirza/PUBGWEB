package com.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;
import com.helper.ImageProcess;

/**
 * Servlet implementation class RemoveFormServlet
 */
public class RemoveFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String imagename = request.getParameter("imagename");

		// hibernate save
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();

		Query q = s.createQuery("delete from AddForm where formid = :c");
		q.setParameter("c", id);
		q.executeUpdate();

		tx.commit();
		s.close();
		String path = request.getRealPath("/")+"formimage"+File.separator+imagename;
		System.out.println(path);
		ImageProcess imp = new ImageProcess();
		try {
			imp.deleteImage(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin.jsp");
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
