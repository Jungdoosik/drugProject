package com.itkey.member.service.Impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.member.service.MemberVo;

@Repository("LoginDAO")
public class LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVo loginDo(String phone) throws Exception {
		MemberVo mVO = sqlSession.selectOne("loginDo",phone);
		return mVO;
	}
	public int idChk(String phone) throws Exception {
		int result = sqlSession.selectOne("idChk",phone);
		return result;
	}
	public int idChk_DEL(String phone) throws Exception{
		int result = sqlSession.selectOne("idChk_DEL",phone);
		return result;
	}
	public String getSalt(String phone) throws Exception{
		String result = sqlSession.selectOne("getSalt",phone);
		return result;
	}
	public int loginChk(MemberVo member) throws Exception{
		int result = sqlSession.selectOne("loginChk",member);
		return result;
	}

	// 아이디+비밀번호+탈퇴여부
	public int loginChk_del(MemberVo member) throws Exception{ 
		int result = sqlSession.selectOne("loginChk_del",member);
		return result;
	}
	public int insertMem(Map<String, Object> params) throws Exception {
		int result = sqlSession.insert("insertMem",params);
		return result;
	}
	public int insertCredit(Map<String, Object> params) throws Exception{
		return sqlSession.insert("member.insertCredit",params);
	}
	
	public int updateSub(String phone) throws Exception {
		int result = sqlSession.update("updateSub",phone);
		return result;
	}
}
