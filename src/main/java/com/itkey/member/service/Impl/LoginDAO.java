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

	public MemberVo loginMember(MemberVo member) {
		
		return sqlSession.selectOne("member.memberLogin",member);
	}
	
	

}
