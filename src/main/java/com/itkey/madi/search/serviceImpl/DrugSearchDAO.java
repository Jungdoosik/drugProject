package com.itkey.madi.search.serviceImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.madi.search.service.DrugShapeVo;

@Repository("DrugSearchDAO")
public class DrugSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<DrugShapeVo> searchShapeList(Map<String, Object> params) {
		return sqlSession.selectList("search.searchShapeList",params);
	}

	public int searchShapeListCnt(Map<String, Object> params) {
		return sqlSession.selectOne("search.searchShapeListCnt",params);
	}
}
