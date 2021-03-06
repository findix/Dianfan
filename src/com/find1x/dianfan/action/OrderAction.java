package com.find1x.dianfan.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.dianfan.util.MongoDBUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;

	String[] checkboxs;

	public String[] getCheckboxs() {
		return checkboxs;
	}

	public void setCheckboxs(String[] checkboxs) {
		this.checkboxs = checkboxs;
	}

	@Override
	public String execute() throws Exception {
		checkboxs = request.getParameterValues("dish");
		DBCollection orderCollection = MongoDBUtil.getCollection("order");
		DBObject order = new BasicDBObject();
		order.put("id", Math.abs((int) Calendar.getInstance().getTimeInMillis()));
		order.put("time", new Date());
		order.put("username", session.getAttribute("username"));
		order.put("dishs", checkboxs);
		order.put("finished", false);
		orderCollection.save(order);
		return SUCCESS;
	}

}
