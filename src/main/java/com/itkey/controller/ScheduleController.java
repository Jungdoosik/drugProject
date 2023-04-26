package com.itkey.controller;

import java.util.List;

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
	    

	    @PostMapping(value = "/enrollCalendar")
	    public @ResponseBody String enrollCal(CalendarVO cVo) {
	    	logger.debug("enrollCalendar is Running...");
	    	logger.debug(cVo.toString());
	    	
	    	int result = cSvc.enroll(cVo);
	    	return "hello";
	    }
	    
	    @GetMapping(value = "/getCalendar")
	    public @ResponseBody List<CalendarVO> getCalendar(CalendarVO cVo){
	    	List<CalendarVO> list = cSvc.getCalendar(cVo);
	    	System.out.println("list : " + list);
	    	return list;
	    }
	    
}
