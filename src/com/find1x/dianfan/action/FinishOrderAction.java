package com.find1x.dianfan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.dianfan.util.MongoDBUtil;
import com.find1x.dianfan.util.QueryUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FinishOrderAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	

	@Override
	public String execute() throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		String type = request.getParameter("type");
		System.out.println(id+type);
		DBCollection order = MongoDBUtil.getCollection("order");
		if (type.equals("delete")) {
			order.remove(new BasicDBObject("id", id));
		} else {
			QueryUtil.finishOrder(id);
		}
		return SUCCESS;
	}

}