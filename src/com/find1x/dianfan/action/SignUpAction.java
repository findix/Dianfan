package com.find1x.dianfan.action;

import com.find1x.dianfan.User;
import com.find1x.dianfan.UserDAO;
import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport{
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
		message="¹§Ï²Äú£¬×¢²á³É¹¦£¡";
		UserDAO uDao=new UserDAO(user);
		uDao.save();
		return SUCCESS;
	}
	
}
