package com.itkey.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itkey.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name = "LoginDAO")
	LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> params) throws Exception {

		
		return loginDAO.loginMember(params);
	}

}
