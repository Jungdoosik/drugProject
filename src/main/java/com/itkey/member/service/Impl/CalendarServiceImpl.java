package com.itkey.member.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.CalendarDAO;
import com.itkey.member.service.CalendarService;
import com.itkey.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService{
   
   @Autowired
   CalendarDAO cDao;
   
   @Override
   public int enroll(CalendarVO cVo) {
      
      return cDao.enroll(cVo);
   }

   @Override
   public List<CalendarVO> getCalendar(CalendarVO cVo) {
      List<CalendarVO> list = cDao.getCalendar(cVo);
      return list;
   }

   @Override
   public List<CalendarVO> getDate(CalendarVO cVo) throws Exception {
      return cDao.getDate(cVo);
   }

   @Override
   public List<CalendarVO> getMemo(CalendarVO cVo) throws Exception {
      return cDao.getMemo(cVo);
   }

   @Override
   public int deleteMemo(CalendarVO cVo) throws Exception {
      return cDao.deleteMemo(cVo);
   }

   @Override
   public int modifyMemo(CalendarVO cVo) throws Exception {
      return cDao.modifyMemo(cVo);
   }

}