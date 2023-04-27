package com.itkey.member.service;

import java.util.Map;

import com.itkey.controller.DrugShapeVo;


public interface LoginService {

	public MemberVo loginDo(String phone) throws Exception;
	public int idChk(String phone) throws Exception;
	public int idChk_DEL(String phone) throws Exception;
	public String getSalt(String phone) throws Exception; // salt값 가져오기
	public int loginChk(MemberVo member) throws Exception;
	public int loginChk_del(MemberVo member) throws Exception; // 아이디+비밀번호+탈퇴여부
	public int updateModifyDo(MemberVo mVO) throws Exception; // 회원 수정
	
	
	public int insertMem(Map<String, Object> params) throws Exception;
	public int insertCredit(Map<String, Object> params) throws Exception;
	
	public int updateSub(Map<String, Object> paramse) throws Exception;
	public int dataGogo(DrugShapeVo dVo)throws Exception;
	
}
