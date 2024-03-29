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
import com.itkey.enquire.EnquireService;
import com.itkey.enquire.EnquireVo;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.phone.service.PhoneService;
import com.itkey.util.SHA256Util;
import org.springframework.ui.Model;

/**
  * @FileName : ServiceController.java
  * @Date : 2023. 5. 11.
  * @작성자 : 이해리
  * @변경이력 :
  * @프로그램 설명 : 서비스 관련 컨트롤러(가입/해지)
  */
@Controller
public class ServiceController {

	@Autowired
    private LoginService loginService;
	@Autowired
	private PhoneService phoneService;
	@Autowired
	private EnquireService enquireService;

	private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);

	/**
	  * @Method Name : cancel
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 이해리
	  * @변경이력 :
	  * @Method 설명 : 서비스 해지 신청 메소드
	  * @param response
	  * @param session
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("/cancel")
	public ModelAndView cancel(HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("서비스 해지 /cancel");

		ModelAndView mv = new ModelAndView();
    	MemberVo mVO = new MemberVo();
    	String phone = (String) session.getAttribute("phone");
		mVO = loginService.loginDo(phone);

		String subScribe = mVO.getSubscribe(); // 서비스 가입 여부
		String getJoinDate = mVO.getJoinDate(); // 가입날짜

		if(subScribe == null || !subScribe.equals("Y") || subScribe == "" || getJoinDate == null) { // 서비스 미가입 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter result = response.getWriter();
			result.println(""
					+ "<script>"
					+ "if(!confirm('서비스에 가입되어 있지 않습니다.서비스를 가입하시겠습니까?')){"
					+ "history.back()}"
					+ "else {"
					+ "document.location = 'servicesJoin'"
					+ "}; </script>");
			result.flush();
			mv.setViewName("index");
		}else {
			// 날짜 차이를 담을 변수 생성
			long calDateDays = 0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat format0 = new SimpleDateFormat("yyyy년MM월dd일HH시");

			// 회원정보(가입 후 7일 이내 체크)
			String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())); // 오늘 날짜

			String getSubDate = mVO.getSubDate();

			Date currentDate = format.parse(current);
		    Date lastDate = format0.parse(getSubDate);

		    long calDate = (currentDate.getTime() - lastDate.getTime())/1000;
		    calDateDays = calDate / ( 24*60*60);
		    calDateDays = Math.abs(calDateDays);

			System.out.println("날짜차이 : "+calDateDays);

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

    /**
      * @Method Name : cancelAuth
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 서비스 해지 문의를 위한 핸드폰 본인 인증 페이지
      * @return
      * @throws Exception
      */
    @RequestMapping("/cancelAuth")
    public String cancelAuth() throws Exception{
    	return "cancelAuth";
    }

    /**
      * @Method Name : cancelWrite
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : (핸드폰 본인 인증 완료 시)해지 문의 글쓰기 페이지로 이동
      * @return
      * @throws Exception
      */
    @RequestMapping("/cancelWrite")
    public String cancelWrite() throws Exception{

    	return "cancelWrite";
    }

 	/**
 	  * @Method Name : cancelWriteOk
 	  * @작성일 : 2023. 5. 11.
 	  * @작성자 : 이해리
 	  * @변경이력 :
 	  * @Method 설명 : 해지문의 글 등록
 	  * @param eVO
 	  * @param session
 	  * @return
 	  * @throws Exception
 	  */
 	@ResponseBody
 	@PostMapping(value = "/cancelWriteOk")
 	public String cancelWriteOk(EnquireVo eVO, HttpSession session) throws Exception {
 		logger.info("문의 등록  ajax data : " + eVO);

 		String phone = (String) session.getAttribute("phone");
 	    logger.info(phone);
 		eVO.setWriter(phone);

 		logger.info("* cancelWriteOk [CONTROLLER] input ◀ (Service) : ");
 		int result = enquireService.insertCancel(eVO);
 		logger.info("* cancelWriteOk [CONTROLLER] out ◀ (Service) : " + result);

 		if (result == 1) {
 			return "success";
 		} else {
 			return "FAIL";
 		}
 	}

    /**
      * @Method Name : servicesJoin
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 서비스 가입 페이지(servicesJoin)에서 결제 완료 시 세션 subScribe 값 입력
      * @param session
      * @return
      * @throws Exception
      */
    @RequestMapping("/servicesJoin")
    public String servicesJoin(HttpSession session) throws Exception{
    	MemberVo mVO = new MemberVo();
    	String phone = (String) session.getAttribute("phone");
		if (phone != null) {
			mVO = loginService.loginDo(phone);

			String subScribe = mVO.getSubscribe();
			session.setAttribute("subScribe", subScribe);
		}
    	return "servicesJoin";
    }

    /**
      * @Method Name : paymentOk
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 서비스 가입 페이지(servicesJoin)에서 결제 완료 시 결제 데이터 DB(credit)에 저장
      * @param params
      * @param response
      * @param session
      * @return
      * @throws Exception
      */
    @ResponseBody
    @RequestMapping(value = "/paymentOk", method = RequestMethod.POST)
    public String paymentOk(@RequestParam Map<String, Object> params, HttpServletResponse response, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	String phone = (String) session.getAttribute("phone");

    	params.put("phone", phone);
    	int result = loginService.insertCredit(params);
    	logger.debug("결제정보 DB 저장/insertCredit : " + result);
    	if (result==1) {
    		int result1 = loginService.updateSub(params);
    		logger.debug("서비스 가입정보 DB 저장/updateSub : " + result1);
    		if (result1==1) {
    			result= result1;
        	} else {
        		result= result1;
        	}
    	}
    	return String.valueOf(result);
    }

    @RequestMapping(value = "/servicesJoinOk", method = RequestMethod.GET)
    public String servicesJoinOk() throws Exception{
    	return "servicesJoinOk";
    }
}
