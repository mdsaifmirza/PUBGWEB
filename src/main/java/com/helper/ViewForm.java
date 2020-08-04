package com.helper;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.AddForm;
import com.entities.RegistrationList;
import com.entities.Signup;

public class ViewForm {
	public static List<AddForm> viewForm()
	{
		Session s = FactoryProvider.getFactory().openSession();
		String query="from AddForm";
		Query<AddForm> q= s.createQuery(query);
		List <AddForm> list = q.list();
		s.close();
		return list;
		
	}
	public List<Signup> userDetails()
	{
		Session s = FactoryProvider.getFactory().openSession();
		String query="from Signup";
		Query<Signup> q= s.createQuery(query);
		List <Signup> list = q.list();
		s.close();
		return list;
		
	}
	public List<RegistrationList> registrationList()
	{
		Session s = FactoryProvider.getFactory().openSession();
		String query="from RegistrationList";
		Query<RegistrationList> q= s.createQuery(query);
		List <RegistrationList> list = q.list();
		s.close();
		return list;
		
	}
}
