package com.itkey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.member.service.CalendarService;
import com.itkey.vo.CalendarVO;

@Controller
public class ScheduleController {
      
      private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
      
      @Autowired
      CalendarService cSvc;
      
       @RequestMapping("/calendar")
       public String calendar() {
          return "calendar";
       }
       
       @ResponseBody
       @RequestMapping(value = "/enrollCalendar")
       public Map<String, Object> enrollCal(CalendarVO cVo) throws Exception{
          logger.debug("enrollCalendar is Running...");
          logger.debug(cVo.toString());
          
          int result = cSvc.enroll(cVo);
          System.out.println("=================");
          System.out.println(cVo.toString());
          List<CalendarVO> list = cSvc.getDate(cVo);
          Map<String,Object> map = new HashMap<String,Object>();
          map.put("list", list);
          
          return map;
       }
       
       @GetMapping(value = "/getCalendar")
       public @ResponseBody List<CalendarVO> getCalendar(CalendarVO cVo) throws Exception{
          List<CalendarVO> list = cSvc.getCalendar(cVo);
          System.out.println("list : " + list);
          return list;
       }
       
       @GetMapping(value = "/getMemo")
       public @ResponseBody List<CalendarVO> getMemo(CalendarVO cVo) throws Exception{
          List<CalendarVO> list = cSvc.getMemo(cVo);
          System.out.println("list : " + list);
          return list;
       }
       
       @PostMapping(value = "/deleteMemo")
       public @ResponseBody int deleteMemo(CalendarVO cVo) throws Exception{
          logger.debug(cVo.getCalNo());
          int result = cSvc.deleteMemo(cVo);
          return result;
       }
       
       @PostMapping(value = "/modifyMemo")
       public @ResponseBody int modifyMemo(CalendarVO cVo) throws Exception{
          int result = cSvc.modifyMemo(cVo);
          return result;
       }
}