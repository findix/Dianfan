package com.find1x.dianfan.action;

import java.util.List;

import com.find1x.dianfan.User;
import com.find1x.dianfan.util.QueryUtil;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
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
		List<User> list=QueryUtil.getList(user.getUsername(),user.getPassword());
		if (list.size()>0){
			message="登录成功";
		}else{
			message="登录失败，用户名或密码不正确";
		}
		return SUCCESS;
	}
	
}
