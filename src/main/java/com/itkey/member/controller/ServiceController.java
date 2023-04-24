package com.itkey.member.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.controller.HomeController;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.phone.service.PhoneService;
import com.itkey.util.SHA256Util;
import org.springframework.ui.Model;

@Controller
public class ServiceController {
	
	@Autowired
    private LoginService loginService;
	@Autowired
	private PhoneService phoneService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 서비스 해지
	@RequestMapping("/cancel")
	public ModelAndView cancel(HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("서비스 해지 /cancel");
		
		ModelAndView mv = new ModelAndView();
    	MemberVo mVO = new MemberVo();
    	String member = (String) session.getAttribute("member");
		mVO = loginService.loginDo(member);
		
		// 서비스 가입 여부
		String subScribe = mVO.getSubscribe(); 
		
		// 날짜 차이를 담을 변수 생성
		long calDateDays = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// 회원정보(가입 후 7일 이내 체크)
		String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())); // 오늘 날짜
		
		String getJoinDate = mVO.getJoinDate(); // 가입날짜
		
		Date currentDate = format.parse(current);
	    Date lastDate = format.parse(getJoinDate);
	    
	    long calDate = (currentDate.getTime() - lastDate.getTime())/1000; 
	    calDateDays = calDate / ( 24*60*60); 
	    calDateDays = Math.abs(calDateDays);
	    
		System.out.println("날짜차이 : "+calDateDays);
		
		if(subScribe == null || !subScribe.equals("Y") || subScribe == "" || getJoinDate == null) { // 서비스 미가입 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter result = response.getWriter();
			result.println(""
					+ "<script>"
					+ "if(!confirm('서비스에 가입되어 있지 않습니다.서비스를 가입하시겠습니까?')){"
					+ "history.back()}; </script>");
			result.flush();
			mv.setViewName("index");
		}else {
			if (calDateDays<7) { // 가입 후 7일 이내
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter result = response.getWriter();
				result.println(""
						+ "<script>"
						+ "if(alert('가입 후 7일 이후에 해지하실 수 있습니다.')){"
						+ "}; </script>");
				result.flush();
				mv.setViewName("index");
			} else { // 가입 후 7일 이후
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter result = response.getWriter();
				result.println(""
						+ "<script>"
						+ "if(confirm('서비스를 해지하려면 휴대전화 인증을 하셔야 합니다.\\n인증 페이지로 이동하시겠습니까?')){"
						+ "document.location = 'cancelAuth'"
						+ "}; </script>");
				result.flush();
				mv.setViewName("index");
			}
		}
		return mv;
	}
	
    @RequestMapping("/cancelAuth")
    public String searchDrugName() throws Exception{
    	// 핸드폰 본인인증 후 해지문의 글쓰기로 이동
    	return "cancelAuth";
    }
}