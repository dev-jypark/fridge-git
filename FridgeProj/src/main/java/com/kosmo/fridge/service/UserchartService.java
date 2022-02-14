package com.kosmo.fridge.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserchartService {
	
	boolean isAdmin(Map map);

	int totalMemberCount(Map map);

	int totalTradePostCount(Map map);
	
	int totalPostCount(Map map);

	int totalCommentCount(Map map);
	
	List<UserchartDTO> memberCountpm();
	
	List<UserchartDTO> addrCount();
	
	List<UserchartDTO> favoriteFood();
	
}
