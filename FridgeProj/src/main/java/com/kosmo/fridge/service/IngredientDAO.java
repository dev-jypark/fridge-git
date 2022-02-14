package com.kosmo.fridge.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IngredientDAO {
	
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public String selectStock(Map map){
	SqlSession session= sqlMapper.openSession();
	String result=session.selectOne("recipe_stock",map);
	System.out.println("serviceid"+map.get("id"));
	return result;		 
	}	
	/*
	public String selectStock(Map map) {		
		return template.selectOne("recipe_stock", map);
	}*/
	public String selectDate(Map map){
	SqlSession session= sqlMapper.openSession();
	System.out.println("DAO에서 아이디 출력");
	System.out.println(map.get("id"));
	System.out.println("id---dao---dd-------"+map.get("id"));
	String result=session.selectOne("recipe_date",map);
	return result;		 
	}	
/*	public String selectDate(Map map) {		
		return template.selectOne("recipe_date", map);
	}*/

}
