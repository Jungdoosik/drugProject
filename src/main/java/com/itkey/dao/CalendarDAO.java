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
	
	public int enroll(CalendarVO cVo){
		int result = sqlSession.insert("enroll", cVo);
		return result;
	}
	
	public List<CalendarVO> getCalendar(CalendarVO cVo){
		List<CalendarVO> list = sqlSession.selectList("getCalendar", cVo);
		return list;
	}
	
}
