package com.helper;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Signup;

public class CheckExistingEmail {
	public boolean checkEmail(String email) {
		boolean f = false;
		Session s = FactoryProvider.getFactory().openSession();
		String query = "from Signup where email = :x";
		Query<Signup> q = s.createQuery(query);
		q.setParameter("x", email);
		List list = q.list();
		s.close();
		int row=list.size();
		System.out.println(row);
		if (row > 0)
			f = true;
		return f;
	}

}
