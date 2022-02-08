package com.kosmo.fridge.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.fridge.service.CommunityRestAPIService;
import com.kosmo.fridge.service.FeedDTO;
import com.kosmo.fridge.service.MemberProfileDTO;

@RestController
public class CommunityRestAPIController {
	
	@Autowired
	CommunityRestAPIService service;
	
	@GetMapping("/community/feeds/{id}")
	public List<FeedDTO> selectListFeedInCoummunityMain(@PathVariable String id){
		return service.selectListFeedInCommunityMain(id);
	}
	
	@GetMapping("/profile/feeds/{id}")
	public List<FeedDTO> selectListFeedInProfile(@PathVariable String id){
		return service.selectListFeedInProfile(id);		
	}
	
	@GetMapping("/community/{id}")
	public MemberProfileDTO selectOneUser(@PathVariable String id){
		return service.selectOneUser(id);
	}
	
	@PostMapping("/community/comment/")
	public void insertComment(@RequestParam Map map) {
		service.insertComment(map);
	}
	
	@PostMapping("/community/like/")
	public void updateLike(@RequestParam Map map) {
		service.updateLike(map);
	}
	
}
