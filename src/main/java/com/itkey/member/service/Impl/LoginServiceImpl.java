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
	public MemberVo loginDo(String phone) throws Exception {
		MemberVo mVO = loginDAO.loginDo(phone);
		return mVO;
	}
	@Override
	public int idChk(String phone) throws Exception {
		int result = loginDAO.idChk(phone);
		return result;
	}
	@Override
	public int idChk_DEL(String phone) throws Exception {
		int result = loginDAO.idChk_DEL(phone);
		return result;
	}
	@Override
	public String getSalt(String phone) throws Exception {
		String result = loginDAO.getSalt(phone);
		return result;
	}
	@Override
	public int loginChk(MemberVo member) throws Exception {
		int result = loginDAO.loginChk(member);
		return result;
	}
	@Override
	public int loginChk_del(MemberVo member) throws Exception { // 아이디+비밀번호+탈퇴여부
		int result = loginDAO.loginChk_del(member);
		return result;
	}
	@Override
	public int insertMem(Map<String, Object> params) throws Exception {
		int result = loginDAO.insertMem(params);
		return result;
	}
	@Override
	public int insertCredit(Map<String, Object> params) throws Exception {
		return loginDAO.insertCredit(params);
	}


}
