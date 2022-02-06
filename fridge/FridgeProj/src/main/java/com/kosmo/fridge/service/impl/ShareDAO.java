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

	public List selectIngrediantList(Map map) {
		//System.out.println("DAO 아이디 : "+map.get("id"));
		List<IngrediantDTO> listIngrediant= template.selectList("shareSelectIngrediantList", map);
		return listIngrediant;
	}

	public int insertSharePost(Map map) {
		return template.insert("sharePostInsert", map);
	}

	public int insertSharePostImgs(Map map) {
		return template.insert("sharePostImgInsert", map);
	}

	public int insertShareProduct(Map map) {
		return template.insert("shareProductInsert", map);
	}

	public ShareDTO selectOne(Map map) {
		return template.selectOne("shareSelectOne",map);
	}
	public ShareDTO viewSelectOne(Map map) {
		return template.selectOne("viewSelectOne", map);
	}

	public void updateIngrediant(Map map) {
		template.update("ingrediantCountUpdate", map);
	}

	public int deleteSharePost(Map map) {
		return template.delete("sharePostDelete",map);
	}

	public int rollbackIngrediant(List list) {
		return template.update("ingrediantRollback",list);
		
	}
	//트레이드에서 재료에 더해줄 것들 개수, i_no 가져옴
	public List selectRollbackIngre(Map map) {
		System.out.println("롤백 dao 들어옴");
		List<IngrediantDTO> listIngrediant = template.selectList("shareSelectRollbackIngre",map);
		for(IngrediantDTO dto : listIngrediant) {
			System.out.println(dto);
		}
		
		return listIngrediant;
	}
	
}