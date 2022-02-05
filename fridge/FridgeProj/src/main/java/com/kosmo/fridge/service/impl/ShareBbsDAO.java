package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;

import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.ShareBbsDTO;

@Repository
public class ShareBbsDAO {

	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	/* 일단 가자...
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}
*/
	public ShareBbsDTO selectOne(Map map) {
		return template.selectOne("shareSelectOne",map);
	}
	
	
	public List<ShareBbsDTO> selectList(Map map) {
		SqlSession session = sqlMapper.openSession();
		List<ShareBbsDTO> lists=session.selectList("shareSelectList", map);
		session.close();
		return lists;//template.selectList("shareSelectList",map);
	}


	public int getTotalRowCount(Map map) {
		SqlSession session= sqlMapper.openSession();
		int total=session.selectOne("shareCount",map);
		session.close();
		return total;
		//return template.selectOne("shareCount", map);
	}
	
	

}
