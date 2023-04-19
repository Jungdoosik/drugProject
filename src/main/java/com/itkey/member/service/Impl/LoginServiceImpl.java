package com.itkey.member.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name = "LoginDAO")
	LoginDAO loginDAO;

	@Override
	public MemberVo login(MemberVo member) throws Exception {

		
		return loginDAO.loginMember(member);
	}

	@Override
	public int insertMem(MemberVo member) throws Exception {
		int result = loginDAO.insertMem(member);
		return result;
	}


}
