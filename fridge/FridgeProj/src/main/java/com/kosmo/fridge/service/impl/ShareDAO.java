package com.kosmo.fridge.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.TradeDTO;

@Repository
public class ShareDAO {
	/*@Resource(name="template")
	private SqlSessionTemplate template;*/
	
	@Autowired
	private SqlSessionTemplate template;

	public int getTotalRowCount(Map map) {
		return template.selectOne("shareTotalRowCount",map);
	}

	public List selectList(Map map) {
		List<ShareDTO> listShare=template.selectList("shareSelectList",map);
		return listShare;
	}

	public List selectIngrediantList() {
		List<IngrediantDTO> listIngrediant= template.selectList("shareSelectIngrediantList");
		return listIngrediant;
	}
	
}