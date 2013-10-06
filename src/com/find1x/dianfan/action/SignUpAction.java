package com.find1x.dianfan.action;

import java.util.List;

import com.find1x.dianfan.User;
import com.find1x.dianfan.UserDAO;
import com.find1x.dianfan.util.QueryUtil;
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
		List<User> list = QueryUtil.getList(user.getUsername());
		if (list.size() > 0) {
			message = "对不起，该用户名已被注册";
		} else {
			UserDAO uDao = new UserDAO(user);
			uDao.save();
			message = "恭喜您，注册成功！";
		}
		return SUCCESS;
	}

}
