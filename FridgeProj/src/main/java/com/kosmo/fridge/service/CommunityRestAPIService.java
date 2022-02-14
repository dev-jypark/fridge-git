package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommunityRestAPIService {

	List<FeedDTO> selectListFeedInProfile(String id);	
	List<FeedDTO> selectListFeedInCommunityMain(String id);

	void insertComment(Map map);
	void updateLike(Map map);
	MemberProfileDTO selectOneUser(String id);
}
