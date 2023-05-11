package com.itkey.member.controller;


import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.controller.HomeController;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.phone.service.PhoneService;

/**
  * @FileName : LoginController.java
  * @Date : 2023. 5. 11.
  * @작성자 : 이해리
  * @변경이력 :
  * @프로그램 설명 : 회원정보, 로그인 관련 컨트롤러
  */
@Controller
public class LoginController {

	@Autowired
    private LoginService loginService;
	@Autowired
	private PhoneService phoneService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/login")
    public String login() {
    	return "login";
    }

    /**
      * @Method Name : loginDo
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 로그인 기능
      * @param session
      * @param response
      * @param request
      * @param model
      * @return
      * @throws Exception
      */
    @RequestMapping(value = "/loginDo", method = RequestMethod.POST)
    public ModelAndView  loginDo(HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelMap model) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	MemberVo mVO = new MemberVo();

    	String boardWriter = request.getParameter("phone");
		String boardWriterPw = request.getParameter("pwd");

		mVO.setPhone(boardWriter);
		mVO.setPwd(boardWriterPw);

		if(boardWriter.trim().length() == 0 || boardWriterPw.trim().length() == 0 ) {
			//System.out.println("boardWriterPw" + boardWriterPw.trim().length());
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter result = response.getWriter();
			result.println("<script>alert('아이디 또는 비밀번호를 모두 입력해주세요.')");
			result.println("history.back()");
			result.println("</script>");
			result.flush();
			mv.setViewName("login");

		}else {
			int idCheck = loginService.idChk(boardWriter);
			if (idCheck == 1) { // 아이디가 있는 경우
				int selectMem = loginService.loginChk(mVO);
				int selectDelMem = loginService.loginChk_del(mVO);

				if(selectMem == 1 && selectDelMem == 0) { // 아이디와 비밀번호 일치
					mVO = loginService.loginDo(boardWriter);
					session.setAttribute("phone", mVO.getPhone());
					session.setAttribute("cuid", mVO.getCuid());
					session.setAttribute("email", mVO.getEmail());
					session.setAttribute("joinDate", mVO.getJoinDate());
					session.setAttribute("joinPath", mVO.getJoinPath());
					session.setAttribute("payYn", mVO.getPayYn());
					session.setAttribute("subDate", mVO.getSubDate());
					session.setAttribute("endSubDate", mVO.getEndSubDate());
					session.setAttribute("delYn", mVO.getDelYn());
					session.setAttribute("auth", mVO.getAuth());
					session.setAttribute("serviceCode", mVO.getServiceCode());

					mv.addObject("memberinfo",mVO);
					mv.setViewName("redirect:index");

					System.out.println("mVO.getSubscribe()"+mVO.getSubscribe());
					if (mVO.getSubscribe() == null || mVO.getSubscribe().equals("N") ) {
						session.setAttribute("subScribe", null);
					} else {
						session.setAttribute("subScribe",mVO.getSubscribe());
					}
				}else if(selectMem != 1 && selectDelMem == 0){ // 비밀번호 불일치
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter result = response.getWriter();
					result.println("<script>alert('비밀번호가 틀렸습니다. 다시 입력해 주십시오.')");
					result.println("history.back()");
					result.println("</script>");
					result.flush();
					mv.setViewName("login");
				}else if(selectMem == 1 && selectDelMem == 1){ // 탈퇴회원
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter result = response.getWriter();
					result.println("<script>alert('탈퇴한 아이디입니다.(사용불가)')");
					result.println("history.back()");
					result.println("</script>");
					result.flush();
					mv.setViewName("login");
				}
			}if(idCheck == 0 ) { // 아이디가 없는 경우 회원가입페이지로 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter result = response.getWriter();
				result.println(""
						+ "<script>"
						+ "if(confirm('아이디가 존재하지 않습니다.회원가입 하시겠습니까?')){"
						+ "document.location = 'join';"
						+ "}; </script>");
				result.flush();
				mv.setViewName("login");
			}
		}
		return mv;

    }

    @RequestMapping("/join")
    public String join(@RequestParam Map<String,Object> params, ModelMap model) {
    	model.addAttribute("params", params);
    	return "join";
    }

	/**
	  * @Method Name : joinChk
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 이해리
	  * @변경이력 :
	  * @Method 설명 : 회원가입 페이지에서 탈퇴여부 확인하는 메소드
	  * @param mDTO
	  * @param request
	  * @return
	  * @throws Exception
	  */
	@ResponseBody
	@PostMapping(value = "/joinChk.do")
	public String joinChk(MemberVo mDTO, HttpServletRequest request) throws Exception {

		String phone = request.getParameter("phone");

		int idChk = loginService.idChk(phone);
		int idChk_DEL = loginService.idChk_DEL(phone);

		if(idChk_DEL == 1) {
			return "2"; // 탈퇴한 아이디
		} if (idChk == 1) {
			return "1";
		} else {
			return "0";
		}
	}

	/**
	  * @Method Name : sendSMS
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 이해리
	  * @변경이력 :
	  * @Method 설명 : 회원가입 시 핸드폰 본인인증
	  * @param userPhoneNumber
	  * @return
	  */
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		//phoneService.certifiedPhoneNumber(userPhoneNumber,randomNumber);

		logger.info("인증번호 : " + Integer.toString(randomNumber));

		return Integer.toString(randomNumber);
	}


	/**
	  * @Method Name : joinDo
	  * @작성일 : 2023. 5. 11.
	  * @작성자 : 이해리
	  * @변경이력 :
	  * @Method 설명 : 회원가입/이벤트 배너타고 들어와서 100원 결제 후 가입하는 경우 credit 테이블에 (정기결제를 위한) 결제내역 저장
	  * @param params
	  * @param response
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("/joinDo")
    public ModelAndView joinDo(@RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	System.out.println(params);
    	int joinOk = loginService.insertMem(params);
    	if(params.get("joinPath").equals("2")){
    		loginService.insertCredit(params);
    	}

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

    /**
      * @Method Name : modify
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 회원정보수정 페이지로 이동
      * @param model
      * @param session
      * @return
      * @throws Exception
      */
    @RequestMapping("/modify")
    public String modify(Model model ,HttpSession session) throws Exception {
    	String phone = (String) session.getAttribute("phone");
    	MemberVo mVO = new MemberVo();
    	mVO = loginService.loginDo(phone);

    	model.addAttribute("memberinfo",mVO);
       return "modify";
    }

    /**
      * @Method Name : updateModifyDo
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 회원정보 수정 등록
      * @param model
      * @param mVO
      * @param session
      * @return
      * @throws Exception
      */
    @ResponseBody
    @RequestMapping("/modifyDo.do")
    public String updateModifyDo (Model model
    		,MemberVo mVO
    		,HttpSession session
    		)throws Exception {
    	logger.info(" modifyDo  ajax data : " + mVO);
    	//세션값 불러오기
		String phone = (String) session.getAttribute("phone");
		logger.info(phone);

		mVO.setPhone(phone);

    	logger.info("* updateModifyDo [CONTROLLER] input ◀ (Service) : ");
		int result = loginService.updateModifyDo(mVO);
		logger.info("* updateModifyDo [CONTROLLER] out ◀ (Service) : " + result);


		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
    }

    /**
      * @Method Name : logout
      * @작성일 : 2023. 5. 11.
      * @작성자 : 이해리
      * @변경이력 :
      * @Method 설명 : 로그아웃-세션 삭제
      * @param session
      * @return
      */
    @RequestMapping(value = "/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:index";
	}


}

