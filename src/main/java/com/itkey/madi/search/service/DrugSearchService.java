package com.itkey.madi.search.service;

import java.util.List;
import java.util.Map;

public interface DrugSearchService {

	//약 모양 List
	List<DrugShapeVo> searchShapeList(Map<String, Object> params) throws Exception;

	//약 모양 List 총개수
	int searchShapeListCnt(Map<String, Object> params) throws Exception;

}
