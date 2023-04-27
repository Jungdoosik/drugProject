package com.itkey.member.service;

public class MemberVo {

	private String phone;
	private String cuid;
	private String pwd;
	private String email;  
	private String joinDate; // 회원 가입일자
	private String joinPath;
	private String subscribe;
	private String payYn;
	private String subDate; // 서비스 가입일자
	private String endSubDate;
	private String delYn;
	private String auth;
	private String serviceCode;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCuid() {
		return cuid;
	}
	public void setCuid(String cuid) {
		this.cuid = cuid;
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
	public String getPayYn() {
		return payYn;
	}
	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}
	public String getSubDate() {
		return subDate;
	}
	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}
	public String getEndSubDate() {
		return endSubDate;
	}
	public void setEndSubDate(String endSubDate) {
		this.endSubDate = endSubDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public MemberVo(String phone, String cuid, String pwd, String email, String joinDate, String joinPath,
			String subscribe, String payYn, String subDate, String endSubDate, String delYn, String auth,
			String serviceCode) {
		super();
		this.phone = phone;
		this.cuid = cuid;
		this.pwd = pwd;
		this.email = email;
		this.joinDate = joinDate;
		this.joinPath = joinPath;
		this.subscribe = subscribe;
		this.payYn = payYn;
		this.subDate = subDate;
		this.endSubDate = endSubDate;
		this.delYn = delYn;
		this.auth = auth;
		this.serviceCode = serviceCode;
	}
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
