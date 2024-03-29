package com.itkey.service.common;

import lombok.Data;

@Data
public class PageMaker {
	
	private int totalBoard;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum;

	private Criteria cri;
	
	
	public void calcData() {

		this.displayPageNum = 5;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)displayPageNum) * displayPageNum);
		
		this.startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int)(Math.ceil(totalBoard / (double)cri.getNumber()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getNumber() >= totalBoard ? false : true;
		
	}// calcData()
	
	
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;	
		calcData(); 
	}
	
}
