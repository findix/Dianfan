package com.find1x.dianfan.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.find1x.dianfan.User;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class QueryUtil {
	public static List<DBObject> getList(String username, String password) {
		DBCollection users=MongoDBUtil.getCollection("user");
		BasicDBObject query=new BasicDBObject();
		query.put("username", username);
		query.put("password", password);
		DBCursor cursor=users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList(String username) {
		DBCollection users=MongoDBUtil.getCollection("user");
		BasicDBObject query=new BasicDBObject();
		query.put("username", username);
		DBCursor cursor=users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList() {
		DBCollection users=MongoDBUtil.getCollection("user");
		DBCursor cursor=users.find();
		return cursor.toArray();
	}
	
	public static List<DBObject> getMenu(){
		DBCollection users=MongoDBUtil.getCollection("menu");
		DBCursor cursor=users.find();
		return cursor.toArray();
	}
}
