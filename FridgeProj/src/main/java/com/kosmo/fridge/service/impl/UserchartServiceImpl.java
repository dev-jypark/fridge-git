package com.kosmo.fridge.service.impl;

import java.util.List;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.UserchartDTO;
import com.kosmo.fridge.service.UserchartService;

@Service("UserchartService")
public class UserchartServiceImpl implements UserchartService {
	
	
	@Resource(name="userchartDAO")
	private UserchartDAO dao;
	
	
	@Override
	public boolean isAdmin(Map map) {
		return dao.isAdmin(map);
	}
 	
	@Override
	public int totalMemberCount(Map map) {
		return dao.getTotalMemberCount(map);
	}
		
	@Override
	public int totalPostCount(Map map) {
		return dao.getTotalPostCount(map);
	}
	
	@Override
	public int totalTradePostCount(Map map) {
		return dao.getTotalTradePostCount(map);
	}
	
	@Override
	public int totalCommentCount(Map map) {
		return dao.getTotalCommentCount(map);
	}
	
	@Override
	public List<UserchartDTO> memberCountpm() {
		return dao.getMemberCountpm();
	}
	
	@Override
	public List<UserchartDTO> addrCount() {
		return dao.getAddrCount();
	}

	public List<UserchartDTO> favoriteFood() {
		return dao.getFavoriteFood();
	}

	
	

}
