package com.itkey.member.service;

import java.util.List;

import com.itkey.vo.CalendarVO;

/**
  * @FileName : CalendarService.java
  * @Date : 2023. 5. 11. 
  * @작성자 : 김윤경
  * @변경이력 :
  * @프로그램 설명 : CalendarService(interface)
  */

public interface CalendarService {
	
	/**
	  * @Method Name : enroll
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 김윤경
	  * @변경이력 : 
	  * @Method 설명 : 달력날짜클릭시 일정을 등록
	  * @param cVo
	  * @return
	  */
	public int enroll(CalendarVO cVo);
	
	/**
	  * @Method Name : getAllCalendar
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 김윤경
	  * @변경이력 : 
	  * @Method 설명 :문자를 보내주기위해 추가된 일정을 불러옴(sms컬럼  'N'인 것들만)
	  * @return
	  * @throws Exception
	  */
	public List<CalendarVO> getAllCalendar()throws Exception;
	
	/**
	  * @Method Name : getCalendar
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 김윤경
	  * @변경이력 : 
	  * @Method 설명 : 전체 달력을 불러옴
	  * @param cVo
	  * @return
	  * @throws Exception
	  */
	public List<CalendarVO> getCalendar(CalendarVO cVo)throws Exception;

	/**
	  * @Method Name : getDate
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : USER
	  * @변경이력 : 
	  * @Method 설명 : 달력의 day 불러옴
	  * @param cVo
	  * @return
	  * @throws Exception
	  */
	public List<CalendarVO> getDate(CalendarVO cVo)throws Exception;
   
	/**
	  * @Method Name : getMemo
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : USER
	  * @변경이력 : 
	  * @Method 설명 : 등록된 메모를 불러옴
	  * @param cVo
	  * @return
	  * @throws Exception
	  */
	public List<CalendarVO> getMemo(CalendarVO cVo)throws Exception;
   
	/**
	  * @Method Name : deleteMemo
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : USER
	  * @변경이력 : 
	  * @Method 설명 : 등록된 메모 삭제
	  * @param cVo
	  * @return
	  * @throws Exception
	  */
	public int deleteMemo(CalendarVO cVo)throws Exception;
   
	/**
	  * @Method Name : modifyMemo
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : USER
	  * @변경이력 : 
	  * @Method 설명 : 등록된 메모 수정
	  * @param cVo
	  * @return
	  * @throws Exception
	  */
	public int modifyMemo(CalendarVO cVo)throws Exception;

	/**
	  * @Method Name : updateSmsCnt
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : USER
	  * @변경이력 : 
	  * @Method 설명 : 문자를 보내주기위해 추가된 일정 수정
	  * @param calNo
	  * @return
	  * @throws Exception
	  */
	public int updateSmsCnt(String calNo) throws Exception;	
   
}