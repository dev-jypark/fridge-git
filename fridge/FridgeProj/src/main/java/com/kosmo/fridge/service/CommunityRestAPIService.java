package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommunityRestAPIService {

	List<FeedDTO> selectListFeedInProfile(String nick);	
	List<FeedDTO> selectListFeedInCommunityMain(String nick);

	void insertComment(Map map);
	void updateLike(Map map);
}
