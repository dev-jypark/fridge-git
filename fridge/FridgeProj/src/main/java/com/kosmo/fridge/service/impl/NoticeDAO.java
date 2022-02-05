package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.NoticeDTO;

@Repository
public class NoticeDAO {
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public boolean isAdmin(Map map) {
	
		int count=template.selectOne("isAdmin",map);	
		return count==1 ? true : false;
	}
	
	public List<NoticeDTO> selectList(Map map){
		return template.selectList("noticeSelectList",map);
	}
	
	public int getTotalRowCount(Map map) {
		return template.selectOne("noticeTotalRowCount",map);
	}
	
	public int insert(Map map) {
		
		int affected=template.insert("noticeInsert", map);	
		return affected;		
	}
	
	public NoticeDTO selectOne(Map map) {		
		return template.selectOne("noticeSelectOne",map);
	}
	
	public int update(Map map) {
		
		return template.update("noticeUpdate", map);
	}
	
	public void delete(Map map) {
		
		template.delete("noticeDelete", map);		
	} 
	
	public int increaseHit(String n_no) {
		
		return template.update("increaseHit",n_no);
	}
	
}//
