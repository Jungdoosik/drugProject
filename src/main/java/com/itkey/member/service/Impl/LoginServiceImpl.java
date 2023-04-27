package com.itkey.member.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.itkey.controller.DrugShapeVo;
import com.itkey.enquire.EnquireController;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	
	private Logger log = Logger.getLogger(LoginServiceImpl.class);
	
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
	@Override
	public int updateSub(Map<String, Object> params) throws Exception {
		int result = loginDAO.updateSub(params);
		return result;
	}
	//회원수정
	@Override
	public int updateModifyDo(MemberVo mVO) throws Exception {
		log.info("회원수정 * [SERVICE] Input  ◀ (Controller) : " + mVO.toString());
		int result = loginDAO.updateModifyDo(mVO);
		log.info("회원수정 * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	
	@Override
	public int dataGogo(DrugShapeVo dVo) throws Exception {
		return loginDAO.dataGogo(dVo);
	}


}
