package com.itkey.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.vo.CalendarVO;

@Repository("CalendarDAO")
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int enroll(CalendarVO cVo) {
		int result = sqlSession.insert("enroll", cVo);
		return result;
	}

	public List<CalendarVO> getCalendar(CalendarVO cVo) {
		List<CalendarVO> list = sqlSession.selectList("getCalendar", cVo);
		return list;
	}
	
	public List<CalendarVO> getAllCalendar( ) {
		List<CalendarVO> list = sqlSession.selectList("getAllCalendar");
		return list;
	}

	public List<CalendarVO> getDate(CalendarVO cVo) {
		return sqlSession.selectList("getDate", cVo);
	}

	public List<CalendarVO> getMemo(CalendarVO cVo) {
		return sqlSession.selectList("getMemo", cVo);
	}

	public int deleteMemo(CalendarVO cVo) {
		return sqlSession.delete("deleteMemo", cVo);
	}

	public int modifyMemo(CalendarVO cVo) {
		return sqlSession.update("modifyMemo", cVo);
	}

	public int updateSmsCnt(String calNo) {
		return sqlSession.update("updateSmsCnt", calNo);
	}
}