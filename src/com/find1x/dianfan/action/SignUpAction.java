package com.find1x.dianfan.action;

import java.util.List;

import com.find1x.dianfan.User;
import com.find1x.dianfan.util.MongoDBUtil;
import com.find1x.dianfan.util.QueryUtil;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String message;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String execute() throws Exception {
		List<DBObject> list = QueryUtil.getList(user.getUsername());
		if (list.size() > 0) {
			message = "�Բ��𣬸��û����ѱ�ע��";
			return ERROR;
		} else {
			DBCollection users = MongoDBUtil.getCollection("user");
			users.save(MongoDBUtil.convertUser2DBObject(user));
			message = "��ϲ����ע��ɹ���";
			return SUCCESS;
		}

	}

}
