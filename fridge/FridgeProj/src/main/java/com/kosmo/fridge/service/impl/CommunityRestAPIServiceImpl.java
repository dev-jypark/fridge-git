package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.CommentDTO;
import com.kosmo.fridge.service.CommunityRestAPIService;
import com.kosmo.fridge.service.FeedDTO;

@Service
public class CommunityRestAPIServiceImpl implements CommunityRestAPIService {

	@Autowired
	CommunityRestAPIDAO dao;

	@Override
	public List<FeedDTO> selectListFeedInProfile(String nick) {
		return dao.selectListFeedInProfile(nick);
	}

	@Override
	public List<FeedDTO> selectListFeedInCommunityMain(String nick) {
		return dao.selectListFeedInCommunityMain(nick);
	}

	@Override
	public void insertComment(Map map) {
		dao.insertComment(map);

	}

	@Override
	public void updateLike(Map map) {
		String flag = map.get("flag").toString();
		System.out.println(flag);

		if (flag.contains("0"))
			dao.insertLikeMember(map);
		else
			dao.deleteLikeMember(map);

	}

}
