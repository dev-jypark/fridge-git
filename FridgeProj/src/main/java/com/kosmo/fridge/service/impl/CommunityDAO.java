package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.fridge.service.MemberProfileDTO;

@Repository
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public int setUserImg(Map map) {
		return template.update("imgsrcUpdate", map);
	}

	public boolean insertFeed(Map map) {		
		return template.insert("feedInsert", map) == 1;
	}
	
	public int insertFeedImgs(Map map) {
		return template.insert("imgsrcInsert", map);		
	}

	public MemberProfileDTO selectOneMemberProfile(String nick) {
		return template.selectOne("memberSelectOne", nick);
	}

	public MemberProfileDTO selectOneMemberProfileWithId(String id) {
		return template.selectOne("memberSelectOneWithId", id);
	}
}
