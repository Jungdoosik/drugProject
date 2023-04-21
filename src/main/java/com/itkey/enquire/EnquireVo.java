package com.itkey.enquire;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class EnquireVo {		// 문의게시판

	private int seq;			// 문의번호
	private String title;		// 문의제목
	private String writer;		// 작성자
	private String question;	// 문의내용
	private String answer;		// 답변내용
	private String qdate;		// 문의일
	private String adate;		// 답변일
	private String delyn;		// 삭제여부
	private String service_code; // 서비스별 코드 

}
