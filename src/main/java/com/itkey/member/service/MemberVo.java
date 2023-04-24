package com.itkey.member.service;

public class MemberVo {

	private String phone;
	private String pwd;
	private String email;  
	private String joinDate; // 회원 가입일자
	private String joinPath;
	private String subscribe;
	private String subDate; // 서비스 가입일자
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}

	public String getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}

	public String getSubDate() {
		return subDate;
	}
	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVo(String phone, String pwd, String email, String joinDate, String joinPath, String subscribe,
			String subDate) {
		super();
		this.phone = phone;
		this.pwd = pwd;
		this.email = email;
		this.joinDate = joinDate;
		this.joinPath = joinPath;
		this.subscribe = subscribe;
		this.subDate = subDate;
	}

	
	
}
