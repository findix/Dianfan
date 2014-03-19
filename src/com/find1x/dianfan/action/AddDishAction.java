package com.find1x.dianfan.action;

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

public class AddDishAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	private String name;
	private String series;
	private String type;
	private String spicy;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSpicy() {
		return spicy;
	}

	public void setSpicy(String spicy) {
		this.spicy = spicy;
	}

	@Override
	public String execute() throws Exception {
		DBCollection menu=MongoDBUtil.getCollection("menu");
		DBObject dish = new BasicDBObject();
		dish.put("name", name);
		dish.put("series", series);
		dish.put("type", type);
		dish.put("spicy", spicy);
		menu.save(dish);
		return SUCCESS;
	}

}