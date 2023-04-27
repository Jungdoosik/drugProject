package com.itkey.madi.search.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itkey.madi.search.service.DrugSearchService;
import com.itkey.madi.search.service.DrugShapeVo;

@Service("DrugSearchService")
public class DrugSearchServiceImpl implements DrugSearchService {

	@Resource(name = "DrugSearchDAO")
	private DrugSearchDAO drugSearchDAO;

	@Override
	public List<DrugShapeVo> searchShapeList(Map<String, Object> params) throws Exception {
		return drugSearchDAO.searchShapeList(params);
	}

	@Override
	public int searchShapeListCnt(Map<String, Object> params) throws Exception {
		return drugSearchDAO.searchShapeListCnt(params);
	}
}
