package com.kosmo.fridge.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.fridge.service.CommunityRestAPIService;
import com.kosmo.fridge.service.FeedDTO;
import com.kosmo.fridge.service.MemberProfileDTO;

@RestController
public class CommunityRestAPIController {
	
	@Autowired
	CommunityRestAPIService service;
	
	@GetMapping("/community/feeds.do")
	public List<FeedDTO> selectListFeedInCoummunityMain(@RequestParam Map map){
		String id = map.get("id").toString();
		System.out.println(id);
		return service.selectListFeedInCommunityMain(id);
	}
	
	@GetMapping("/profile/feeds.do")
	public List<FeedDTO> selectListFeedInProfile(@PathVariable String id){
		return service.selectListFeedInProfile(id);		
	}
	
	@GetMapping("/community/member.do")
	public MemberProfileDTO selectOneUser(@RequestParam Map map){
		String id = map.get("id").toString();
		System.out.println(id);
		return service.selectOneUser(id);
	}
	
	@PostMapping("/community/comment.do")
	public void insertComment(@RequestParam Map map) {
		service.insertComment(map);
	}
	
	@PostMapping("/community/like.do")
	public void updateLike(@RequestParam Map map) {
		service.updateLike(map);
	}
	
}
