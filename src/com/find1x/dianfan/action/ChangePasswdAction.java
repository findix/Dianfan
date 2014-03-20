package com.find1x.dianfan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.find1x.dianfan.pojos.User;
import com.find1x.dianfan.util.MongoDBUtil;
import com.find1x.dianfan.util.QueryUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswdAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

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
		List<DBObject> list = QueryUtil.getList(session
				.getAttribute("username").toString(), user.getUsername());
		System.out.println(user.getUsername());
		if (list.size() == 0) {
			message = "�Բ���������ĳ�ʼ���벻��ȷ";
			return ERROR;
		} else {
			DBCollection user = MongoDBUtil.getCollection("user");
			DBObject queryObject = new BasicDBObject();
			queryObject.put("username", session.getAttribute("username")
					.toString());
			DBObject updateObject = user.findOne(queryObject);
			updateObject.put("password", this.user.getPassword());
			user.findAndModify(queryObject, updateObject);
			message = "���ѳɹ��޸����룡";
			return SUCCESS;
		}
	}

}
