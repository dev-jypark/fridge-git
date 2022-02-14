package com.kosmo.fridge.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.UserchartDTO;

@Repository
public class UserchartDAO {
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public boolean isAdmin(Map map) {
	
		int count=template.selectOne("isAdmin",map);	
		return count==1 ? true : false;
	}	
	
	public int getTotalMemberCount(Map map) {
		return template.selectOne("totalMemberCount",map);
	}
	
	public int getTotalPostCount(Map map) {
		return template.selectOne("totalPostCount",map);
	}
	
	public int getTotalTradePostCount(Map map) {
		return template.selectOne("totalTradePostCount",map);
	}
	
	public int getTotalCommentCount(Map map) {
		return template.selectOne("totalCommentCount",map);
	}
	
	public List<UserchartDTO> getMemberCountpm() {
		return template.selectList("memberCountpm");
	}
	
	public List<UserchartDTO> getAddrCount() {
		return template.selectList("addrCount");
	}
	
	public List<UserchartDTO> getFavoriteFood() {
		return template.selectList("favoriteFood");
	}
	
	
}//
