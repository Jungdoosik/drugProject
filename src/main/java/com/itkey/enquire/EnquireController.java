package com.itkey.enquire;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.controller.HomeController;
import com.itkey.service.common.Criteria;
import com.itkey.service.common.PageMaker;


@Controller
public class EnquireController {
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private EnquireService eService;
	
	
	// ■ 상담 내역 (개인)
	@GetMapping("/list")
	public String enquireList(Criteria cri, Model model
			/*, Authentication authentication*/
			) throws Exception {
		
		log.info("상담내역");
		
		//UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		//cri.setId(userDetails.getUsername());
		//cri.setCode("MS");
		
		//List<EnquireVo> eList = eService.listEnquire(cri);
		List<EnquireVo> eList = eService.listEnquire();
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri); 
//		int countPage = eService.listCountEnquire(cri);
//		pageMaker.setTotalBoard(countPage);
		
//		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("List", eList);

		return "/enquire/enquireListView";
	}
	// ■ 고객문의 화면
	@GetMapping(value="/write")
	public String writeEnquire(Model model) throws Exception{
		log.info("문의등록 페이지");
		return "/enquire/enquireWrite";
		
	}
	
	// ■ 고객문의 등록
		@ResponseBody
		@PostMapping(value="/register", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> enquireRegister(@RequestBody EnquireVo eDTO) throws Exception{
			log.info("문의등록" + eDTO);
			
			String a ="01064864033"; //하드코딩
			eDTO.setWriter(a);
			
			ResponseEntity<String> entity = null;
			try {
				
				eService.registerEnquire(eDTO);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
		
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	
	//	■ 서비스 해지 문의 화면 (개인)
	@GetMapping(value = "/eCS")
	public String enquireCS(Model model) throws Exception {
		log.info("서비스 해지 문의등록");
		
		/*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String member_id = "";
		if (authentication != null) {
			member_id = authentication.getName();
			log.info(member_id);
		}
		String isMyCS = eService.getCSCount(member_id) == 0 ? "APPLY" : "APPLYING";
		*/
		String isMyCS = ""; // 임의값 지정
		
		model.addAttribute("apply", isMyCS);
		return "/enquire/enquireCS";
	}
	
	//	■ 상담 내역 (관리자)
/*	@PreAuthorize("hasRole('ADMIN')")*/
	@GetMapping("/admin")
	public String adminList(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {		

		log.info("관리자 상담내역");
		
		Map<String, Object> map = eService.listAdminEnquire(cri);

		model.addAttribute("List", map.get("List"));
		model.addAttribute("untreatedCnt", map.get("cnt"));
		
		model.addAttribute("ServiceCode", cri.getServiceCode());
		
		return "/enquire/enquireAdminView";
	}

	//	■ 문의 챗봇
	@GetMapping(value="/chatBot")
	public String enquireChatBot(Model model) throws Exception{
		log.info("문의챗봇");
		return "/enquire/enqChatBot";
		
	}
	

	//	■ 해지문의 내역 (관리자)
/*	@PreAuthorize("hasRole('ADMIN')")*/
	@GetMapping("/adminECS")
	public String adminECS(@RequestParam Map<String, Object> param, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		
		Map<String, Object> map = eService.listAdminEnqCS(cri);

		model.addAttribute("List", map.get("List"));
		model.addAttribute("untreatedEnqCsCnt", map.get("cnt"));
		model.addAttribute("param", param);
		
		model.addAttribute("ServiceCode", cri.getServiceCode());
		
		return "/enquire/enquireAdminCS";
	}
	
	
	
	// ■ 고객 서비스 해지 문의 등록
	@ResponseBody
	@PostMapping(value="/registerCS", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> enquireRegisterCS(@RequestBody EnquireVo eDTO) throws Exception{
		log.info("문의등록" + eDTO);
		
		ResponseEntity<String> entity = null;
		try {
			eService.registerEnquireCS(eDTO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
	
		entity = new ResponseEntity<String>(
				e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ■ 상담 상세
	@ResponseBody
	@GetMapping(value="/detail/{seq}", 
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<EnquireVo> detailEnqire(@PathVariable("seq") int seq){
			
		log.info("문의 상세내역");
	
		ResponseEntity<EnquireVo> entity = null;
			
		try {
			
			entity = new ResponseEntity<>(eService.detailEnquire(seq), HttpStatus.OK);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	// ■ 문의답변 등록
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value="/answer/{seq}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> enquireAnswer(@RequestBody EnquireVo eDTO, 
										@PathVariable("seq") int seq) {
		
		log.info("답변 등록");
		
		ResponseEntity<String> entity = null;
		
		try {
			eDTO.setSeq(seq);
			log.info("eDTO : " + eDTO);
			eService.enquireAnswer(eDTO);
	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// ■ 서비스 해지 문의 답변 등록
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value="/answerCS/{seq}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> enquireAnswerCS(@RequestBody EnquireVo eDTO, 
										@PathVariable("seq") int seq) {
		
		log.info("답변 등록");
		
		ResponseEntity<String> entity = null;
		
		try {
			eDTO.setSeq(seq);
			log.info("eDTO : " + eDTO);
			eService.enquireAnswerCS(eDTO);
	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ■ 문의답변 삭제
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value="/delete/{seq}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> enquireDelete(@PathVariable("seq") int seq) {
		
		log.info("문의글 삭제");
	
		ResponseEntity<String> entity = null;
			
		try {
			eService.enquireDelete(seq);
	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*// ■ 결제내역 팝업 - 삭제 됨 
	@GetMapping("/paylist/{id}")
	public String payList(@PathVariable("id") String id, Model model) throws Exception{
		
		log.info("id : " + id);
		List<CreditDTO> list =	eService.historyCredit(id);
		log.info("가져온 리스트 + " + list);
		
		model.addAttribute("List", list);
		model.addAttribute("id", id);
		
		return "/enquire/enquirePopView";
	}*/
	
	@GetMapping("/faq")
	public String faq() throws Exception{
		log.info("자주 묻는 질문 페이지로");
		return "/enquire/faqList";
	}
	
	
}