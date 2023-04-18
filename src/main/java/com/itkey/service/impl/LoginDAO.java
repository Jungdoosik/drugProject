package com.itkey.service.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LoginDAO")
public class LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Map<String, Object> loginMember(Map<String, Object> params) {
		
		return sqlSession.selectOne("memberLogin.member",params);
	}
	
	

}
