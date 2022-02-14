package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.FeedDTO;
import com.kosmo.fridge.service.MemberProfileDTO;

@Repository
public class CommunityRestAPIDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	List<FeedDTO> selectListFeedInCommunityMain(String id){
		return template.selectList("selectListFeed", id);
	}

	public List<FeedDTO> selectListFeedInProfile(String id) {
		return template.selectList("selectListFeedInProfile", id);
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

	public MemberProfileDTO selectOneUser(String id) {
		return template.selectOne("selectOneUser", id);
	}

	
}
