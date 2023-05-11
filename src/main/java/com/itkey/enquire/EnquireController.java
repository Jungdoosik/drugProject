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

import com.itkey.member.service.CalendarService;
import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.common.Criteria;


/**
 * 
 * @FileName : EnquireController.java
 * 
 * 
 * @Date : 2023. 5. 11.
 * 
 * @작성자 : 황선애
 * 
 * @변경이력 :
 * 
 * @프로그램 설명 : 문의하기외 컨트롤러
 * 
 */
@Controller
public class EnquireController {
	private Logger log = Logger.getLogger(EnquireController.class);

	@Autowired
	private EnquireService eService;

	@Autowired
	CalendarService cSvc;

	/**
	 * 
	 * @Method Name : enquireList
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 : 1:1문의하기 내역 리스트(개인)
	 * 
	 * @param model
	 * @param session
	 * @param page
	 * @param numsPerPage
	 * @return
	 * @throws Exception
	 * 
	 */
	@GetMapping("/question")
	public String enquireList(Model model, HttpSession session, Integer page, Integer numsPerPage) throws Exception {
		log.info("question 상담내역");
		// 세션값 불러오기
		String phone = (String) session.getAttribute("phone");
		log.info(phone);

		PageCriteria criteria = new PageCriteria();
		// log.info("======1111===============");
		criteria.setKeyword(phone);// 회원id criteria 객체 set

		if (page != null) {
			// 페이지
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			// 페이지번호
			criteria.setNumsPerPage(numsPerPage);
		}

		List<EnquireVo> eList = eService.listEnquire(criteria); // 유저1 문의리스트
		model.addAttribute("List", eList);

		PageMaker pageMaker = new PageMaker(); // 페이지메이커
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(eService.listCountEnquire(criteria)); // 총갯수
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("phone", phone);
		return "/enquire/enquireListView";
	}

	/**
	 * 
	 * @Method Name : cancelList
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 : 해지 문의 목록
	 * 
	 * @param model
	 * @param session
	 * @param page
	 * @param numsPerPage
	 * @return
	 * @throws Exception
	 * 
	 */
	@GetMapping("/cancelList")
	public String cancelList(Model model, HttpSession session, Integer page, Integer numsPerPage) throws Exception {
		log.info("cancelList  목록 ");
		// 세션값 불러오기
		String phone = (String) session.getAttribute("phone");
		log.info(phone);

		PageCriteria criteria = new PageCriteria();
		// log.info("======1111===============");
		criteria.setKeyword(phone);// 회원id criteria 객체 set

		if (page != null) {
			// 페이지
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			// 페이지번호
			criteria.setNumsPerPage(numsPerPage);
		}
		List<EnquireVo> cList = eService.cancelList(criteria); // 유저1 해지 문의 리스트
		model.addAttribute("List", cList);

		PageMaker pageMaker = new PageMaker(); // 페이지메이커
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(eService.cancelListCount(criteria)); // 총갯수

		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("phone", phone);
		return "/enquire/cancelListView";
	}

	/**
	 * 
	 * @Method Name : cancelDetail
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :해지문의 상세
	 * 
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */
	@RequestMapping("/cancelDetail")
	public String cancelDetail(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		log.info("cancelDetail   서비스 해지 상세  ");
		System.out.println(params);
		EnquireVo cVo = eService.cancelDetail(params);

		model.addAttribute("eVo", cVo);
		return "/enquire/cancelDetail";
	}

	/**
	 * 
	 * @Method Name : enquireWriteView
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 : 고객 문의하기 페이지 이동
	 * 
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 * 
	 */
	@GetMapping(value = "/enquireWriteView")
	public String enquireWriteView(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		log.info("문의등록  페이지");
		return "/enquire/enquireWrite";
	}

	/**
	 * 
	 * @Method Name : enquireWriteInsert
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :1:1 고객문의 등록
	 * 
	 * @param eVO
	 * @param session
	 * @return
	 * @throws Exception
	 * 
	 */
	@ResponseBody
	@PostMapping(value = "/doAsk.do")
	public String enquireWriteInsert(EnquireVo eVO, HttpSession session) throws Exception {
		log.info("문의 등록  ajax data : " + eVO);
		// 세션값 불러오기
		String phone = (String) session.getAttribute("phone");
		log.info(phone);
		String serviceCode = "MS";
		eVO.setWriter(phone);
		eVO.setService_code(serviceCode);

		log.info("* insertAsk [CONTROLLER] input �뼳 (Service) : ");
		int result = eService.insertAsk(eVO);
		log.info("* insertAsk [CONTROLLER] out �뼳 (Service) : " + result);

		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 
	 * @Method Name : adminList
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :문의하기 관리자 목록 (관리자)
	 * 
	 * @param model
	 * @param cri
	 * @return
	 * @throws Exception
	 * 
	 */
	@GetMapping("/enquireAdmin")
	public String adminList(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {

		log.info("관리자 상담내역");
		Map<String, Object> map = eService.listAdminEnquire(cri);

		model.addAttribute("List", map.get("List"));
		model.addAttribute("untreatedCnt", map.get("cnt"));
		model.addAttribute("ServiceCode", cri.getServiceCode());
		return "/enquire/enquireAdminView";
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

	/**
	 * 
	 * @Method Name : detailEnqire
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :문의 상담 상세 (관리자)
	 * 
	 * @param seq
	 * @return
	 * 
	 */
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

	/**
	 * 
	 * @Method Name : enquireAnswer
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :문의 답변 등록(관리자)
	 * 
	 * @param eDTO
	 * @param seq
	 * @return
	 * 
	 */
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

	/**
	 * 
	 * @Method Name : enquireDelete
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 황선애
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 :문의 답변 삭제(관리자)
	 * 
	 * @param seq
	 * @return
	 * 
	 */
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

	/**
	 * 
	 * @Method Name : enquireDetail
	 * 
	 * @작성일 : 2023. 5. 11.
	 * 
	 * @작성자 : 정두식
	 * 
	 * @변경이력 :
	 * 
	 * @Method 설명 : 1:1 문의 상세
	 * 
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */
	@RequestMapping("/enquireDetail")
	public String enquireDetail(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {

		System.out.println(params);
		EnquireVo eVo = eService.enquireDetail(params);

		model.addAttribute("eVo", eVo);

		return "/enquire/enquireDetail";
	}

}