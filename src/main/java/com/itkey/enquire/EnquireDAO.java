package com.itkey.enquire;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.service.common.Criteria;
import com.itkey.pageutil.PageCriteria;
/*import com.itkey.member.MemberVo;
import com.itkey.subscribe.CreditDTO;*/

@Repository("EnquireDAO")
public class EnquireDAO {

	private static final Logger log = LoggerFactory.getLogger(EnquireDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String ASK = "enquire";

	// ■ 문의 등록-sunae 
	public int insertAsk(EnquireVo eVO) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : " + eVO.toString());
		int result = sqlSession.insert("enquire.insertAsk", eVO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	// ■ 상담목록 내역 -sunae 
	List<EnquireVo> listEnquire(PageCriteria criteria) throws Exception {
		log.info("다오다오다오* [DAO] Input  ◀ (Service) : "+ criteria.toString());
		log.info("select_list() 호출");
		log.info("start = " + criteria.getStart() + ", end = " + criteria.getEnd());
		List<EnquireVo> result = sqlSession.selectList("enquire.listEnquire",criteria);
		log.info("다오다오다오* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	// ■ 상담 목록 내역 갯수-sunae 
	int listCountEnquire(PageCriteria criteria) throws Exception {
		log.info("Count* [DAO] Input  ◀ (Service) : "+ criteria.toString());
		int result = sqlSession.selectOne("enquire.listCountEnquire", criteria);
		log.info("Count* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	// ■ 해지 목록 내역 -sunae 
	List<EnquireVo> cancelList(PageCriteria criteria) throws Exception {
		log.info("해지 목록 내역* [DAO] Input  ◀ (Service) : "+ criteria.toString());
		log.info("select_list() 호출");
		log.info("start = " + criteria.getStart() + ", end = " + criteria.getEnd());
		List<EnquireVo> result = sqlSession.selectList("enquire.cancelList",criteria);
		log.info("해지 목록 내역* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	// ■ 해지 목록 내역 갯수-sunae 
	int cancelListCount(PageCriteria criteria) throws Exception {
		log.info("해지 목록Count* [DAO] Input  ◀ (Service) : "+ criteria.toString());
		int result = sqlSession.selectOne("enquire.cancelListCount", criteria);
		log.info("해지 목록Count* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	
	// ■ 서비스 해지문의 등록
	void registerEnqireCS(EnquireVo param) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : " + param.toString());
		int result = sqlSession.insert("enquire.registerEnqireCS", param);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);

	}

	int getCScount(String id) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : " + id.toString());
		int result = sqlSession.insert("enquire.getCScount", id);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	// ■ 1대1 문의 상세보기
	EnquireVo detailEnquire(int seq) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : ");
		EnquireVo result = sqlSession.selectOne("enquire.detailEnquire", seq);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	// ■ 상담내역(관리자)
	List<EnquireVo> listAdminEnquire(Criteria cri) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<EnquireVo> result = sqlSession.selectList("enquire.listAdminEnquire", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	int untreatedEnqCnt(Criteria cri) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : " + cri.toString());
		int result = sqlSession.selectOne("enquire.untreatedEnqCnt", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	// ■ 상담내역(관리자)
	List<EnquireVo> listAdminECS(Criteria cri) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<EnquireVo> result = sqlSession.selectList("enquire.listAdminECS", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	int untreatedEnqCsCnt(Criteria cri) throws Exception {
		log.info("* [DAO] Input  ◀ (Service) : " + cri.toString());
		int result = sqlSession.selectOne("enquire.untreatedEnqCsCnt", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	// ■ 답변등록(관리자)
	void enquireAnswer(EnquireVo eDTO) {
		log.info("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.insert("enquire.enquireAnswer", eDTO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);

	}

	// ■ 서비스 해지 답변등록(관리자)
	void enquireAnswerCS(EnquireVo eDTO) {
		log.info("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.insert("enquire.enquireAnswerCS", eDTO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);

	}

	// ■ 문의글 삭제(관리자)
	void enquireDelete(int seq) {
		log.info("* [DAO] Input  ◀ (Service) : " + seq);
		int result = sqlSession.update("enquire.enquireDelete", seq);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);

	}

	//문의내역
	public EnquireVo enquireDetail(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("enquire.enquireDetail", params);
	}
	
	//해지 문의 상세 
		public EnquireVo cancelDetail(Map<String, Object> params) {
			log.info("* 해지 문의 상세 [DAO] Input  ◀ (Service) : " + params.toString());
			EnquireVo result = sqlSession.selectOne("enquire.cancelDetail", params);
			log.info("*해지 문의 상세   [DAO] Output ◀ (Mybatis) : " + result);
			return result;
		}
	
	// 서비스 해지 문의 글쓰기
	public int insertCancel(EnquireVo eVO) {
		log.info("* [DAO] Input  ◀ (Service) : " + eVO.toString());
		int result = sqlSession.insert("enquire.insertCancel", eVO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

}
