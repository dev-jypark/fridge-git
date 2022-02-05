package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.FeedDTO;

@Repository
public class CommunityRestAPIDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	List<FeedDTO> selectListFeedInCommunityMain(String id){
		return template.selectList("selectListFeed", id);
	}

	public List<FeedDTO> selectListFeedInProfile(String nick) {
		return template.selectList("selectListFeedInProfile", nick);
	}

	public void insertComment(Map map) {
		template.insert("insertComment", map);
		
	}

	
	public int insertLikeMember(Map map) {
		return template.insert("insertLikeMmeber", map);
		
	}
	public int deleteLikeMember(Map map) {
		return template.delete("deleteLikeMmeber", map);
		
	}

	
}
