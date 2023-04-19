package com.itkey.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.controller.HomeController;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.util.SHA256Util;


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
    public String memberLogin(MemberVo member, HttpServletRequest request, ModelMap model) throws Exception{
    	
    	MemberVo mb = loginService.login(member);
    	
    	System.out.println(mb);
    	
    	if (mb != null)
		{
			HttpSession session = request.getSession();
			
			session.setAttribute("member", mb);
			session.setAttribute("bizMember", null);
			return "/";

		} else
		{
			model.addAttribute("msg1", "로그인 실패");
			model.addAttribute("msg2", "아이디와 비밀번호를 확인해주세요.");
			return "login";
		}
    	
    }
    
    @RequestMapping("/join")
    public String join() {
    	return "join";
    }
    
    @RequestMapping("/joinDo")
    public ModelAndView joinDo(MemberVo member, HttpServletResponse response) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	

    	member.setSalt(SHA256Util.generateSalt());
    	member.setPwd(SHA256Util.getEncrypt(member.getPwd(), member.getSalt()));
    	int joinOk = loginService.insertMem(member);
    	
    	
    	if(joinOk == 1){
    		response.setContentType("text/html; charset=UTF-8");
			PrintWriter result = response.getWriter();
			result.println(""
					+ "<script>"
					+ "if(alert('회원가입이 완료되었습니다. 로그인 후 이용해주세요.')){"
					+ "}; </script>");
			result.flush();
			mv.setViewName("login");
		}
    	
    	return mv;
    }
    
    @RequestMapping("/mypage")
    public String mypage() {
       return "mypage";
    }
}

