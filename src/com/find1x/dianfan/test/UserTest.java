package com.find1x.dianfan.test;

import org.junit.Test;

import com.find1x.dianfan.User;
import com.find1x.dianfan.UserDAO;

public class UserTest {

	@Test
	public void test() {
		User user=new User();
		user.setUsername("fengxiang");
		user.setPassword("123456");
		
		UserDAO uDao=new UserDAO(user);
		uDao.save();
	}

}
