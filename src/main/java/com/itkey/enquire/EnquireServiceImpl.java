package com.itkey.enquire;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itkey.controller.HomeController;
import com.itkey.pageutil.PageCriteria;
import com.itkey.service.common.Criteria;


@Service("EnquireService")
public class EnquireServiceImpl implements EnquireService{
	private Logger log = Logger.getLogger(EnquireController.class);

	@Autowired
	private EnquireDAO eDAO;
	
	// ■ 상담 목록 내역-sunae
	@Override
	public List<EnquireVo> listEnquire(PageCriteria criteria) throws Exception {
		log.info("리스트 * [SERVICE] Input  ◀ (Controller) : " + criteria.toString());
		log.info("read() 호출 : start = " + criteria.getStart());
		log.info("read() 호출 : end = " + criteria.getEnd());
		List<EnquireVo> result = eDAO.listEnquire(criteria);
		log.info("리스트 * [SERVICE] Output ◀ (DAO) : " + result.toString());
		return result;
	}
	// ■ 상담 내역 갯수-sunae
	@Override
	public int listCountEnquire(PageCriteria criteria) throws Exception {
		log.info("Count * [SERVICE] Input  ◀ (Controller) : " + criteria.toString());
		int result = eDAO.listCountEnquire(criteria);
		log.info("Count * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	
	// ■ 해지 목록 내역 -sunae
	@Override
	public List<EnquireVo> cancelList(PageCriteria criteria) throws Exception {
		log.info("해지 리스트 * [SERVICE] Input  ◀ (Controller) : " + criteria.toString());
		log.info("read() 호출 : start = " + criteria.getStart());
		log.info("read() 호출 : end = " + criteria.getEnd());
		List<EnquireVo> result = eDAO.cancelList(criteria);
		log.info("해지 리스트 * [SERVICE] Output ◀ (DAO) : " + result.toString());
		return result;
	}
	// ■ 해지 목록 갯수-sunae
	@Override
	public int cancelListCount(PageCriteria criteria) throws Exception {
		log.info("해지 Count * [SERVICE] Input  ◀ (Controller) : " + criteria.toString());
		int result = eDAO.cancelListCount(criteria);
		log.info("해지 Count * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	
	@Override
	public int insertAsk(EnquireVo eVO) throws Exception {
		log.info("문의 등록 * [SERVICE] Input  ◀ (Controller) : " + eVO.toString());
		int result = eDAO.insertAsk(eVO);
		log.info("문의 등록 * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	
	@Override
	public void registerEnquireCS(EnquireVo param) throws Exception {
		log.info("서비스 해지문의 등록");
		eDAO.registerEnqireCS(param);
	}
	@Override
	public int getCSCount(String id) throws Exception{
		return eDAO.getCScount(id);
	}
	
	// ■ 1대1 문의 상세보기
	@Override
	public EnquireVo detailEnquire(int seq) throws Exception {
		return eDAO.detailEnquire(seq);
	}
	@Override
	public Map<String, Object> listAdminEnquire(Criteria cri) throws Exception {
		Map<String, Object> result = new HashMap<>();
		Map<String, Object> returnMap = new HashMap<>();
		
		int untreatedEnqCnt = eDAO.untreatedEnqCnt(cri);
		
		List<EnquireVo> list = eDAO.listAdminEnquire(cri);

		returnMap.put("List", list);
		returnMap.put("cnt", untreatedEnqCnt);
	
		return returnMap;
	}

	
	@Override
	public void enquireAnswer(EnquireVo eDTO) {
		eDAO.enquireAnswer(eDTO);
	}

	@Override
	public void enquireDelete(int seq) {
		eDAO.enquireDelete(seq);
	}
	@Override
	public EnquireVo enquireDetail(Map<String, Object> params) throws Exception {
		
		return eDAO.enquireDetail(params);
	}
	// 해지 문의 상세 
	@Override
	public EnquireVo cancelDetail(Map<String, Object> params) throws Exception {
		log.info("해지 문의 상세  * [SERVICE] Input  ◀ (Controller) : " + params.toString());
		EnquireVo result = eDAO.cancelDetail(params);
		log.info("해지 문의 상세  * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}

	// 서비스 해지 문의 글쓰기
	@Override
	public int insertCancel(EnquireVo eVO) throws Exception {
		log.info("해지 문의 등록 * [SERVICE] Input  ◀ (Controller) : " + eVO.toString());
		int result = eDAO.insertCancel(eVO);
		log.info("해지 등록 * [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}

	
	
	
}