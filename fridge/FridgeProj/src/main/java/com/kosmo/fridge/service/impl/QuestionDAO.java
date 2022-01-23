package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.QuestionDTO;


@Repository
public class QuestionDAO {
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public boolean isLogin(Map map) {
	
		int count=template.selectOne("isLogin",map);	
		return count==1 ? true : false;
	}
	
	public List<QuestionDTO> selectList(Map map){
		return template.selectList("questionSelectList",map);
	}
	
	public int getTotalRowCount(Map map) {
		return template.selectOne("questionTotalRowCount",map);
	}
	
	public int insert(Map map) {
		
		int affected=template.insert("questionInsert", map);	
		return affected;		
	}
	
	public QuestionDTO selectOne(Map map) {		
		return template.selectOne("questionSelectOne",map);
	}
	
	public int update(Map map) {
		
		return template.update("questionUpdate", map);
	}
	
	public void delete(Map map) {
		
		template.delete("questionDelete", map);		
	} 
	
	public QuestionDTO getBoardReplyInfo(Map map) {
		return template.selectOne("getBoardReplyInfo", map);
	}
	
	public int updateBoardReSeq(Map map) {
		return template.update("updateBoardReSeq", map);
	}
	
	public int insertReply(Map map) {
		return template.insert("questionInsertReply", map);
	}
	
}//
