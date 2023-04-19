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


/*import com.itkey.member.MemberVo;
import com.itkey.subscribe.CreditDTO;*/


@Repository("EnquireDAO")
public class EnquireDAO{
	private static final Logger log = LoggerFactory.getLogger(EnquireDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String ASK = "enquire";
	
	// ■ 상담 내역
	List<EnquireVo> listEnqire() throws Exception{
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<EnquireVo> result = sqlSession.selectList(ASK + ".listEnqire");
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;	
	}
	
	// ■ 상담 내역 갯수
	int listCountEnqire(Criteria cri) throws Exception{
	    log.info("* [DAO] Input  ◀ (Service) : ");
		int result = sqlSession.selectOne(ASK + ".listCountEnqire", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;	
	}
	
	// ■ 문의 등록
	void registerEnqire(EnquireVo param) throws Exception{
	     log.info("* [DAO] Input  ◀ (Service) : " + param.toString());
		int result = sqlSession.insert(ASK + ".registerEnqire", param);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		
	}
	

	// ■ 서비스 해지문의 등록
	void registerEnqireCS(EnquireVo param) throws Exception{
	     log.info("* [DAO] Input  ◀ (Service) : " + param.toString());
		int result = sqlSession.insert(ASK + ".registerEnqireCS", param);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		
	}

	int getCScount(String id) throws Exception{
	     log.info("* [DAO] Input  ◀ (Service) : " + id.toString());
		int result = sqlSession.insert(ASK + ".getCScount", id);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	// ■ 1대1 문의 상세보기
	EnquireVo detailEnquire(int seq) throws Exception{
		log.info("* [DAO] Input  ◀ (Service) : ");
		EnquireVo result = sqlSession.selectOne(ASK + ".detailEnquire", seq);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;	
	}
	
	// ■ 상담내역(관리자)
	List<EnquireVo> listAdminEnquire(Criteria cri) throws Exception{
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<EnquireVo> result = sqlSession.selectList(ASK + ".listAdminEnquire", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;	
	}
	
	int untreatedEnqCnt(Criteria cri) throws Exception{
	     log.info("* [DAO] Input  ◀ (Service) : " + cri.toString());
		int result = sqlSession.selectOne(ASK + ".untreatedEnqCnt", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	// ■ 상담내역(관리자)
	List<EnquireVo> listAdminECS(Criteria cri) throws Exception{
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<EnquireVo> result = sqlSession.selectList(ASK + ".listAdminECS", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;	
	}
	
	int untreatedEnqCsCnt(Criteria cri) throws Exception{
	     log.info("* [DAO] Input  ◀ (Service) : " + cri.toString());
		int result = sqlSession.selectOne(ASK + ".untreatedEnqCsCnt", cri);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	

	// ■ 답변등록(관리자)
	void enquireAnswer(EnquireVo eDTO){
	     log.info("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.insert(ASK + ".enquireAnswer", eDTO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		
	}
	// ■ 서비스 해지 답변등록(관리자)
	void enquireAnswerCS(EnquireVo eDTO){
	     log.info("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.insert(ASK + ".enquireAnswerCS", eDTO);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		
	}
	// ■ 문의글 삭제(관리자)
	void enquireDelete(int seq){
	     log.info("* [DAO] Input  ◀ (Service) : " + seq);
		int result = sqlSession.update(ASK + ".enquireDelete", seq);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		
	}
	
	
	/*// ■ 결제내역 가져오기
	List<CreditDTO> historyCredit(String id) throws Exception;*/
}
