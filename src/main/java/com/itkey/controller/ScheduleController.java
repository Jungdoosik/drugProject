package com.itkey.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.member.service.CalendarService;
import com.itkey.member.service.LoginService;
import com.itkey.member.service.MemberVo;
import com.itkey.vo.CalendarVO;

@Controller
public class ScheduleController {
      
      private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
      
      @Autowired
      CalendarService cSvc;
      
      @Autowired
      private LoginService loginService;
      
       @RequestMapping("/calendar")
       public ModelAndView calendar(HttpServletResponse response, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		MemberVo mVO = new MemberVo();
		String phone = (String) session.getAttribute("phone");
		mVO = loginService.loginDo(phone);
		String subScribe = mVO.getSubscribe(); // 서비스 가입 여부
		String getJoinDate = mVO.getJoinDate(); // 가입날짜

            if(subScribe == null || !subScribe.equals("Y") || subScribe == "") { // 서비스 미가입 시
              response.setContentType("text/html; charset=UTF-8");
              PrintWriter result = response.getWriter();
              result.println(""
                    + "<script>"
                    + "if(!confirm('서비스 가입 후 이용가능합니다.서비스를 가입하시겠습니까?')){"
                    + "document.location = 'index'}"
                    + "else {"
                    + "document.location = 'servicesJoin'"
                    + "}; </script>");
              result.flush();
              mv.setViewName("calendar");
           }
            return mv;
       }
       
       @ResponseBody
       @RequestMapping(value = "/enrollCalendar")
       public int enrollCal(CalendarVO cVo, HttpSession session) throws Exception{
          logger.debug("enrollCalendar is Running...");
          logger.debug(cVo.toString());
          
          String phone = (String) session.getAttribute("phone");
    	  cVo.setPhone(phone);
    	  
          int result = cSvc.enroll(cVo);
          return result;
//          System.out.println("=================");
//          System.out.println(cVo.toString());
//          List<CalendarVO> list = cSvc.getDate(cVo);
//          Map<String,Object> map = new HashMap<String,Object>();
//          map.put("list", list);
//          
//          return map;
       }
       
       @GetMapping(value = "/getCalendar")
       public @ResponseBody List<CalendarVO> getCalendar(CalendarVO cVo, HttpSession session) throws Exception{
    	  String phone = (String) session.getAttribute("phone");
    	  cVo.setPhone(phone);
    	  System.out.println("phone : " + phone);
    	  
          List<CalendarVO> list = cSvc.getCalendar(cVo);
          
          System.out.println("list : " + list);
          return list;
       }
       
       @GetMapping(value = "/getMemo")
       public @ResponseBody List<CalendarVO> getMemo(CalendarVO cVo, HttpSession session) throws Exception{
    	  String phone = (String) session.getAttribute("phone");
    	  cVo.setPhone(phone);
    	  
    	  List<CalendarVO> list = cSvc.getMemo(cVo);
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
       
       //공휴일API
       
}