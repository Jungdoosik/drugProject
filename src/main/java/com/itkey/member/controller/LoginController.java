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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.controller.DrugShapeVo;
import com.itkey.controller.HomeController;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.phone.service.PhoneService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Autowired
    private LoginService loginService;
	@Autowired
	private PhoneService phoneService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
    @RequestMapping("/login")
    public String login() {
    	return "login";
    }
    
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
			result.println("history.back()");    // 이전 페이지로 사용자를 보냄
			result.println("</script>");
			result.flush();
			mv.setViewName("login");

		}else {
			int idCheck = loginService.idChk(boardWriter);
			if (idCheck == 1) { // 아이디가 있는 경우
				// DB SALT 값 조회
				//String checkSalt = loginService.getSalt(boardWriter);
				// 입력한 비밀번호와 salt 값을 더하여 암호화한 후 비교
				int selectMem = loginService.loginChk(mVO);
				int selectDelMem = loginService.loginChk_del(mVO);
				
				if(selectMem == 1 && selectDelMem == 0) {
					mVO = loginService.loginDo(boardWriter);
					session.setAttribute("phone", mVO.getPhone());
					session.setAttribute("cuid", mVO.getCuid());
					session.setAttribute("email", mVO.getEmail());
					session.setAttribute("joinDate", mVO.getJoinDate());
					session.setAttribute("joinPath", mVO.getJoinPath());
					session.setAttribute("subScribe", mVO.getSubscribe());
					session.setAttribute("payYn", mVO.getPayYn());
					session.setAttribute("subDate", mVO.getSubDate());
					session.setAttribute("endSubDate", mVO.getEndSubDate());
					session.setAttribute("delYn", mVO.getDelYn());    
					session.setAttribute("auth", mVO.getAuth());    
					session.setAttribute("serviceCode", mVO.getServiceCode());
					
					mv.addObject("memberinfo",mVO);
					mv.setViewName("redirect:index");
				}else if(selectMem != 1 && selectDelMem == 0){
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter result = response.getWriter();
					result.println("<script>alert('비밀번호가 틀렸습니다. 다시 입력해 주십시오.')");
					result.println("history.back()");    // 이전 페이지로 사용자를 보냄
					result.println("</script>");
					result.flush();
					mv.setViewName("login");
				}else if(selectMem == 1 && selectDelMem == 1){
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter result = response.getWriter();
					result.println("<script>alert('탈퇴한 아이디입니다.(사용불가)')");
					result.println("history.back()");    // 이전 페이지로 사용자를 보냄
					result.println("</script>");
					result.flush();
					mv.setViewName("login");
				}
			}if(idCheck == 0 ) { // 아이디가 없는 경우
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
	
	// 인증요청
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		//phoneService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		logger.info("인증번호 : " + Integer.toString(randomNumber));
		
		return Integer.toString(randomNumber);
	}
	
	
	@RequestMapping("/joinDo")
    public ModelAndView joinDo(@RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	System.out.println(params);
    	//member.setSalt(SHA256Util.generateSalt());
    	//member.setPwd(SHA256Util.getEncrypt(member.getPwd(), member.getSalt()));
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
    
    @RequestMapping("/modify") // 개인정보수정
    public String modify(Model model ,HttpSession session) throws Exception {
    	String phone = (String) session.getAttribute("phone");
    	MemberVo mVO = new MemberVo();
    	mVO = loginService.loginDo(phone);
    	
    	model.addAttribute("memberinfo",mVO);
       return "modify";
    }
    
    @RequestMapping(value = "/logout") // 로그아웃 클릭하면
	public String logout(HttpSession session) {

		session.invalidate(); //  세션 삭제

		return "redirect:index";
	}
    
  //검색페이지
    @RequestMapping("/searchDrugName")
    public String searchDrugName() throws Exception{
    	return "searchDrugName";
    }
    
    //ah양검색페이지
    @RequestMapping("/searchDrugShape")
    public String searchDrugShape() throws Exception{
    	return "searchDrugShape";
    }
    
    @RequestMapping("/dataGogo")
	public Map<String,Object> dataGogo(@RequestParam Map<String,Object> params, DrugShapeVo dVo) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(params);
		int result = 0;
		for(int i = 0; i <= 300; i++){
			dVo.setItemSeq((String) params.get("itemSeq"+ i));
			dVo.setItemName((String) params.get("itemName"+ i));
			dVo.setEntpSeq((String) params.get("entpSeq"+ i));
			dVo.setEntpName((String) params.get("entpName"+ i));
			dVo.setChart((String) params.get("chart"+ i));
			dVo.setItemImage((String) params.get("itemImage"+ i));
			dVo.setPrintFront((String) params.get("printFront"+ i));
			dVo.setPrintBack((String) params.get("printBack"+ i));
			dVo.setDrugShape((String) params.get("drugShape"+ i));
			dVo.setColorClass1((String) params.get("colorClass"+ i));
			dVo.setColorClass2((String) params.get("colorClasss"+ i));
			dVo.setLineFront((String) params.get("lineFront"+ i));
			dVo.setLineBack((String) params.get("lineBack"+ i));
			dVo.setLengLong((String) params.get("lengLong"+ i));
			dVo.setLengShort((String) params.get("lengShort"+ i));
			dVo.setThick((String) params.get("thick"+ i));
			dVo.setImgRegistTs((String) params.get("imgRegistTs"+ i));
			dVo.setClassNo((String) params.get("classNo"+ i));
			dVo.setClassName((String) params.get("className"+ i));
			dVo.setEtcOtcName((String) params.get("etcOtcName"+ i));
			dVo.setItemPermitDate((String) params.get("itemPermitDate"+ i));
			dVo.setFormCodeName((String) params.get("formCodeName"+ i));
			dVo.setMarkCodeFrontAnal((String) params.get("markCodeFrontAnal"+ i));
			dVo.setMarkCodeBackAnal((String) params.get("markCodeBackAnal"+ i));
			dVo.setMarkCodeFrontImg((String) params.get("markCodeFrontImg"+ i));
			dVo.setMarkCodeBackImg((String) params.get("markCodeBackImg"+ i));
			dVo.setChangeDate((String) params.get("changeDate"+ i));
			dVo.setMarkCodeFront((String) params.get("markCodeFront"+ i));
			dVo.setMarkCodeBack((String) params.get("markCodeBack"+ i));
			dVo.setItemEngName((String) params.get("itemEngName"+ i));
			dVo.setEdlCode((String) params.get("edlCode"+ i));
			result = loginService.dataGogo(dVo);
		}
		
		if(result > 0){
			System.out.println("ok");
		}else{
			System.out.println("no");
		}
		return map;
	}
}

