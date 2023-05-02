package com.itkey.enquire;

import java.util.List;
import java.util.Map;

import com.itkey.pageutil.PageCriteria;
import com.itkey.service.common.Criteria;

public interface EnquireService {
	
	// ■ 상담 목록 내역-sunae
	List<EnquireVo> listEnquire(PageCriteria criteria) throws Exception;
	// ■ 상담 내역 갯수-sunae
	int listCountEnquire(PageCriteria criteria) throws Exception;
	
	
	// ■ 해지 목록 내역 -sunae
	List<EnquireVo> cancelList(PageCriteria criteria) throws Exception;
	// ■ 해지 목록 갯수-sunae
	int cancelListCount(PageCriteria criteria) throws Exception;
	
	
	
	// ■ 문의 등록 -sunae 
	public int insertAsk(EnquireVo eVO) throws Exception;

	// ■ 서비스 문의 등록
	void registerEnquireCS(EnquireVo param) throws Exception;
	int getCSCount(String id) throws Exception;
	
	// ■ 1대1 문의 상세보기 -sunae 
	EnquireVo detailEnquire(int seq) throws Exception;
	// ■ 상담내역(관리자)-sunae 
	Map<String, Object> listAdminEnquire(Criteria cri) throws Exception;
	// ■ 해지문의내역(관리자)
	Map<String, Object> listAdminEnqCS(Criteria cri) throws Exception;
	// ■ 답변등록(관리자)-sunae 
	void enquireAnswer(EnquireVo eDTO);
	// ■ 서비스 해지 답변 등록(관리자)
	void enquireAnswerCS(EnquireVo eDTO);
	// ■ 문의글 삭제(관리자) -sunae 
	void enquireDelete(int seq);
	/*// ■ 결제내역 가져오기 - 삭제 
	List<CreditDTO> historyCredit(String id) throws Exception;*/
	
	//해지 문의내역 Detail
	EnquireVo cancelDetail(Map<String, Object> params) throws Exception;
	
	//문의내역 Detail
	EnquireVo enquireDetail(Map<String, Object> params) throws Exception;
	
	// ■ 서비스 해지 문의 등록
	public int insertCancel(EnquireVo eVO) throws Exception;
}
