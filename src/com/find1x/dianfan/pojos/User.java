package com.find1x.dianfan.pojos;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
	private int _id;
	private String username;
	private String password;
	
	@Id
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
