package com.kosmo.fridge.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IngredientDAO {
	
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public String selectStock(Map map) {		
		return template.selectOne("recipe_stock", map);
	}
	
	public String selectDate(Map map) {		
		return template.selectOne("recipe_date", map);
	}

}
