package com.itkey.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {
		
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	   
	    @RequestMapping("/calendar")
	    public String calendar() {
	    	return "calendar";
	    }
	    

	    @PostMapping(value = "/enrollCalendar")
	    public @ResponseBody String enrollCal(@RequestParam("cal_data") String cal_data, @RequestParam("memo") String memo ) throws ParseException {
	    	logger.debug("enrollCalendar is Running...");
	    	logger.debug("cal_data >>> "+ cal_data);
	    	logger.debug("memo >>> "+ memo);
	    	
	    	//db로 insert 로직 추가해야함
	    	//service
	    	return "enrollCalendar";
	    }
	    
	    
}
