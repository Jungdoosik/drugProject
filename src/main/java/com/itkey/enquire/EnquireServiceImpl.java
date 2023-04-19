package com.itkey.enquire;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*import com.itkey.subscribe.CreditDTO;*/
import com.itkey.controller.HomeController;
import com.itkey.service.common.Criteria;



@Service("EnquireService")
public class EnquireServiceImpl implements EnquireService{
	private Logger log = Logger.getLogger(EnquireServiceImpl.class);

	@Autowired
	private EnquireDAO eDAO;
	
	@Override
	public List<EnquireVo> listEnquire() throws Exception {
		List<EnquireVo> result = eDAO.listEnqire();
		log.info("* [SERVICE] Output ◀ (DAO) : " + result.toString());
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
	public int listCountEnquire(Criteria cri) throws Exception {
		return eDAO.listCountEnqire(cri);
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
	public Map<String, Object> listAdminEnqCS(Criteria cri) throws Exception{
		Map<String, Object> result = new HashMap<>();
		Map<String, Object> returnMap = new HashMap<>();

		
		int untreatedEnqCsCnt = eDAO.untreatedEnqCsCnt(cri);
		List<EnquireVo> list = eDAO.listAdminECS(cri);
		
		returnMap.put("List", list);
		returnMap.put("cnt", untreatedEnqCsCnt);
	
		return returnMap;
	}
	
	@Override
	public void enquireAnswer(EnquireVo eDTO) {
		eDAO.enquireAnswer(eDTO);
	}
	
	@Override
	public void enquireAnswerCS(EnquireVo eDTO) {
		eDAO.enquireAnswerCS(eDTO);
	}
	
	@Override
	public void enquireDelete(int seq) {
		eDAO.enquireDelete(seq);
	}
	
	/*@Override
	public List<CreditDTO> historyCredit(String id) throws Exception {
		return eDAO.historyCredit(id);
	}*/
}