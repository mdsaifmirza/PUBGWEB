package com.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddForm;
import com.helper.FactoryProvider;
import com.helper.ImageProcess;

@MultipartConfig
public class AddFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String schedule = request.getParameter("schedule");
		int slots = Integer.parseInt(request.getParameter("slots"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		int grp = Integer.parseInt(request.getParameter("group"));
		Part part = request.getPart("image");
		String imagename = part.getSubmittedFileName();
		AddForm form = new AddForm(slots, capacity, title, content, grp, imagename, schedule+" IST");
		// hibernate save
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		s.save(form);
		tx.commit();
		s.close();
		String path = request.getRealPath("/")+"formimage"+File.separator+imagename;
		ImageProcess imp = new ImageProcess();
		try {
			imp.insertImage(part.getInputStream(), path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("admin.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
