package com.itkey.service.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {

	private String id;
	private String code;
	
	private String serviceCode;
	
	private int pageNum = 1;
	private int number = 5;
	
	public int getPageStart() {
		return(this.pageNum - 1) * number;
	}
	
	public int getPageEnd() {
		return(this.pageNum * number);
	}
	
}
