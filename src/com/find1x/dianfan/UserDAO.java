package com.find1x.dianfan;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.find1x.dianfan.util.HibernateUtil;

public class UserDAO {
	private User user;
	public UserDAO(User user) {
		this.user=user;
	}
	public void save(){
		SessionFactory sf=HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
		sf.close();
	}
}
