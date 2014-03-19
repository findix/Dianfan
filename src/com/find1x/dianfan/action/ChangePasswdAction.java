package com.find1x.dianfan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.find1x.dianfan.User;
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
			message = "对不起，你输入的初始密码不正确";
			return ERROR;
		} else {
			DBCollection user = MongoDBUtil.getCollection("user");
			DBObject queryObject = new BasicDBObject();
			queryObject.put("username", session.getAttribute("username")
					.toString());
			DBObject updateObject = user.findOne(queryObject);
			updateObject.put("password", this.user.getPassword());
			user.findAndModify(queryObject, updateObject);
			message = "您已成功修改密码！";
			return SUCCESS;
		}
	}

}
