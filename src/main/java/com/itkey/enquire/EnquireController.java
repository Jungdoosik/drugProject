package com.itkey.enquire;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
/*
 *  시큐리 -  pom.xml  의존성 주입 
 * import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.common.Criteria;




@Controller
public class EnquireController {
	private Logger log = Logger.getLogger(EnquireController.class);
	
	@Autowired
	private EnquireService eService;

	// ■ 상담 내역  리스트(개인)
	@GetMapping("/question")
	public String enquireList( Model model
			,HttpSession session
			, Integer page
			, Integer numsPerPage
	) throws Exception {
		log.info("question 상담내역");
		//세션값 불러오기
		String phone = (String) session.getAttribute("phone");
		log.info(phone);
		
	
		PageCriteria criteria = new PageCriteria();
		//log.info("======1111===============");
		criteria.setKeyword(phone);// 회원id criteria 객체 set
		
		if (page != null) {
			//페이지
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			//페이지번호
			criteria.setNumsPerPage(numsPerPage);
		}
		//log.info(criteria);
	
		List<EnquireVo> eList = eService.listEnquire(criteria); //유저1 문의리스트 
		model.addAttribute("List", eList);
		
		PageMaker pageMaker = new PageMaker(); // 페이지메이커 
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(eService.listCountEnquire(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("phone", phone);
		return "/enquire/enquireListView";
	}

	// ■ 고객 회원탈퇴 리스트(개인)
	/*	@GetMapping("/memberWithdrawal")
		public String memberWithdrawal( Model model
				,HttpSession session
				, Integer page
				, Integer numsPerPage
		) throws Exception {
			log.info("문의 탈퇴  리스트");
			
			// 작업 보류
			
			return "/memberWithdrawalListView";
		}*/
	
	
	// ■ 고객 회원탈퇴 문의하기 페이지 
		/*@GetMapping(value = "/memberWithdrawalView")
		public String memberQuestionDeleteView(Model model
				,HttpSession session
				, HttpServletRequest request) throws Exception {

			log.info("회원탈퇴 문의 페이지 ");
			 // 작업 보류
			return "/memberWithdrawalView";
			
		}*/
		
	
		
		
	
	// ■ 고객 문의하기 : 글쓰기 insert
	@GetMapping(value = "/enquireWriteView")
	public String writeEnquire(Model model,HttpSession session, HttpServletRequest request) throws Exception {

		log.info("문의등록  페이지");
		return "/enquire/enquireWrite";

	}
	
	// ■ 고객문의 등록
	@ResponseBody
	@PostMapping(value = "/doAsk.do")
	public String insertAsk(EnquireVo eVO, HttpSession session) throws Exception {
		log.info("문의 등록  ajax data : " + eVO);

		//세션값 불러오기
		String phone = (String) session.getAttribute("phone");
	     log.info(phone);
		eVO.setWriter(phone);

		log.info("* insertAsk [CONTROLLER] input �뼳 (Service) : ");
		int result = eService.insertAsk(eVO);
		log.info("* insertAsk [CONTROLLER] out �뼳 (Service) : " + result);

		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	}

	
	// ■ 서비스 해지 문의 화면 (개인)
	@GetMapping(value = "/eCS")
	public String enquireCS(Model model) throws Exception {
		log.info("서비스 해지 문의등록");

		/*
		 * Authentication authentication =
		 * SecurityContextHolder.getContext().getAuthentication(); String member_id =
		 * ""; if (authentication != null) { member_id = authentication.getName();
		 * log.info(member_id); } String isMyCS = eService.getCSCount(member_id) == 0 ?
		 * "APPLY" : "APPLYING";
		 */
		String isMyCS = ""; // 임의값 지정

		model.addAttribute("apply", isMyCS);
		return "/enquire/enquireCS";
	}

	// ■ 상담 내역 (관리자)
	/* @PreAuthorize("hasRole('ADMIN')") */
	@GetMapping("/admin")
	public String adminList(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {

		log.info("관리자 상담내역");

		Map<String, Object> map = eService.listAdminEnquire(cri);

		model.addAttribute("List", map.get("List"));
		model.addAttribute("untreatedCnt", map.get("cnt"));

		model.addAttribute("ServiceCode", cri.getServiceCode());

		return "/enquire/enquireAdminView";
	}

	// ■ 문의 챗봇
	@GetMapping(value = "/chatBot")
	public String enquireChatBot(Model model) throws Exception {
		log.info("문의챗봇");
		return "/enquire/enqChatBot";

	}

	// ■ 해지문의 내역 (관리자)
	/* @PreAuthorize("hasRole('ADMIN')") */
	@GetMapping("/adminECS")
	public String adminECS(@RequestParam Map<String, Object> param, Model model, @ModelAttribute("cri") Criteria cri)
			throws Exception {

		Map<String, Object> map = eService.listAdminEnqCS(cri);

		model.addAttribute("List", map.get("List"));
		model.addAttribute("untreatedEnqCsCnt", map.get("cnt"));
		model.addAttribute("param", param);

		model.addAttribute("ServiceCode", cri.getServiceCode());

		return "/enquire/enquireAdminCS";
	}

	// ■ 고객 서비스 해지 문의 등록
	@ResponseBody
	@PostMapping(value = "/registerCS", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> enquireRegisterCS(@RequestBody EnquireVo eDTO) throws Exception {
		log.info("문의등록" + eDTO);

		ResponseEntity<String> entity = null;
		try {
			eService.registerEnquireCS(eDTO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ■ 상담 상세
	@ResponseBody
	@GetMapping(value = "/detail/{seq}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<EnquireVo> detailEnqire(@PathVariable("seq") int seq) {

		log.info("문의 상세내역");

		ResponseEntity<EnquireVo> entity = null;

		try {

			entity = new ResponseEntity<>(eService.detailEnquire(seq), HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	// ■ 문의답변 등록
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/answer/{seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> enquireAnswer(@RequestBody EnquireVo eDTO, @PathVariable("seq") int seq) {

		log.info("답변 등록");

		ResponseEntity<String> entity = null;

		try {
			eDTO.setSeq(seq);
			log.info("eDTO : " + eDTO);
			eService.enquireAnswer(eDTO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ■ 서비스 해지 문의 답변 등록
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/answerCS/{seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> enquireAnswerCS(@RequestBody EnquireVo eDTO, @PathVariable("seq") int seq) {

		log.info("답변 등록");

		ResponseEntity<String> entity = null;

		try {
			eDTO.setSeq(seq);
			log.info("eDTO : " + eDTO);
			eService.enquireAnswerCS(eDTO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ■ 문의답변 삭제
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/delete/{seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> enquireDelete(@PathVariable("seq") int seq) {

		log.info("문의글 삭제");

		ResponseEntity<String> entity = null;

		try {
			eService.enquireDelete(seq);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * // ■ 결제내역 팝업 - 삭제 됨
	 * 
	 * @GetMapping("/paylist/{id}") public String payList(@PathVariable("id") String
	 * id, Model model) throws Exception{
	 * 
	 * log.info("id : " + id); List<CreditDTO> list = eService.historyCredit(id);
	 * log.info("가져온 리스트 + " + list);
	 * 
	 * model.addAttribute("List", list); model.addAttribute("id", id);
	 * 
	 * return "/enquire/enquirePopView"; }
	 */

	@GetMapping("/faq")
	public String faq() throws Exception {
		log.info("자주 묻는 질문 페이지로");
		return "/enquire/faqList";
	}
	
	//
	@RequestMapping("/enquireDetail")
	public String enquireDetail(@RequestParam Map<String, Object> params, ModelMap model) throws Exception{
		
		System.out.println(params);
		EnquireVo eVo = eService.enquireDetail(params);
		
		model.addAttribute("eVo", eVo);
		
		return "/enquire/enquireDetail";
	}

}