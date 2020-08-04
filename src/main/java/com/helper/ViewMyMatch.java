package com.helper;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.AddForm;
import com.entities.RegistrationList;

public class ViewMyMatch {
	public static List<RegistrationList> viewByUserId(int id) {
		Session s = FactoryProvider.getFactory().openSession();
		String query = "from RegistrationList where userid = ";
		Query<RegistrationList> q = s.createQuery(query+Integer.toString(id));
		List<RegistrationList> list = q.list();
		s.close();
		return list;

	}
	public static List<AddForm> viewFormByID(int id) {
		Session s = FactoryProvider.getFactory().openSession();
		String query = "from AddForm where formid = ";
		Query<AddForm> q = s.createQuery(query+Integer.toString(id));
		List<AddForm> list = q.list();
		s.close();
		return list;
		
	}
}
