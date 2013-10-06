package com.find1x.dianfan.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.find1x.dianfan.User;

public class QueryUtil {
	public static List<User> getList(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		String hql = "from User where username='" + username
				+ "' and password='" + password + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) query.list();
		return list;
	}

	public static List<User> getList(String username) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		String hql = "from User where username='" + username + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) query.list();
		return list;
	}

	public static List<User> getList() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		String hql = "from User";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) query.list();
		return list;
	}
}
