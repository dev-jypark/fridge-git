package com.kosmo.fridge.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.AdminNoticeDTO;

@Repository
public class AdminNoticeDAO {
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public boolean isAdmin(Map map) {
	
		int count=template.selectOne("isAdmin",map);	
		return count==1 ? true : false;
	}
	
	public List<AdminNoticeDTO> selectList(Map map){
		return template.selectList("adminNoticeSelectList",map);
	}
	
	public int getTotalRowCount(Map map) {
		return template.selectOne("adminNoticeTotalRowCount",map);
	}
	
	public int insert(Map map) {
		
		int affected=template.insert("adminNoticeInsert", map);	
		return affected;		
	}
	
	public AdminNoticeDTO selectOne(Map map) {		
		return template.selectOne("adminNoticeSelectOne",map);
	}
	
	public int update(Map map) {
		
		return template.update("adminNoticeUpdate", map);
	}
	
	public void delete(Map map) {
		
		template.delete("adminNoticeDelete", map);		
	} 
	
	public int increaseHit(String n_no) {
		
		return template.update("adminIncreaseHit",n_no);
	}
	
}//
