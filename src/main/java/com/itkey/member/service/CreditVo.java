package com.itkey.member.service;

public class CreditVo {
	private String id;
	private String itemname;
	private String merchant_uid;
	private int amount;
	private String creditDate; 
	private String serviceCode;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getCreditDate() {
		return creditDate;
	}
	public void setCreditDate(String creditDate) {
		this.creditDate = creditDate;
	}
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	@Override
	public String toString() {
		return "CreditVo [id=" + id + ", itemname=" + itemname + ", merchant_uid=" + merchant_uid + ", amount=" + amount
				+ ", creditDate=" + creditDate + ", serviceCode=" + serviceCode + ", getId()=" + getId()
				+ ", getItemname()=" + getItemname() + ", getMerchant_uid()=" + getMerchant_uid() + ", getAmount()="
				+ getAmount() + ", getCreditDate()=" + getCreditDate() + ", getServiceCode()=" + getServiceCode()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
