package com.itkey.member.service;

public class MemberVo {

	private String phone;
	private String pwd;
	private String email;  
	private String joinDate;
	private String joinPath;
	private String salt;
	
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
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVo(String phone, String pwd, String email, String joinDate, String joinPath, String salt) {
		super();
		this.phone = phone;
		this.pwd = pwd;
		this.email = email;
		this.joinDate = joinDate;
		this.joinPath = joinPath;
		this.salt = salt;
	}
	
	
}
