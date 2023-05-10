package com.itkey.member.service;

import java.util.List;

import com.itkey.vo.CalendarVO;

public interface CalendarService {
   public int enroll(CalendarVO cVo);
   
   public List<CalendarVO> getAllCalendar()throws Exception;
   public List<CalendarVO> getCalendar(CalendarVO cVo)throws Exception;

   public List<CalendarVO> getDate(CalendarVO cVo)throws Exception;
   
   public List<CalendarVO> getMemo(CalendarVO cVo)throws Exception;
   
   public int deleteMemo(CalendarVO cVo)throws Exception;
   
   public int modifyMemo(CalendarVO cVo)throws Exception;

   public int updateSmsCnt(String calNo) throws Exception;	
   
}