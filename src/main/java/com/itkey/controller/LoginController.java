package com.itkey.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.service.LoginService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Autowired
    private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
    @RequestMapping("/login")
    public String login() {
    	return "login";
    }
    
    @ResponseBody
    @RequestMapping("/memberLogin")
    public String memberLogin(@RequestParam Map<String,Object> params) throws Exception{
    	
    	Map<String, Object> member = loginService.login(params);
    	
    	return "login";
    }
    
    @RequestMapping("/join")
    public String join() {
    	return "join";
    }
    
    @RequestMapping("/mypage")
    public String mypage() {
       return "mypage";
    }
}

