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

@RestController
public class CommunityRestAPIController {
	
	@Autowired
	CommunityRestAPIService service;
	
	@GetMapping("/community/feeds/{nick}")
	public List<FeedDTO> selectListFeedInCoummunityMain(@PathVariable String nick){
		System.out.println("요청은 들어오니?");
		return service.selectListFeedInCommunityMain(nick);
	}
	
	@GetMapping("/profile/feeds/{nick}")
	public List<FeedDTO> selectListFeedInProfile(@PathVariable String nick){
		return service.selectListFeedInProfile(nick);		
	}
	
	@PostMapping("/community/comment/")
	public String insertComment(@RequestParam Map map) {
		
		System.out.println(map.get("fb_no"));
		System.out.println(map.get("fc_content"));
		System.out.println(map.get("nick"));
		service.insertComment(map);
		return map.get("fc_content").toString();
	}
	
	@PostMapping("/community/like/")
	public void updateLike(@RequestParam Map map) {
		System.out.println(map.get("fb_no"));
		System.out.println(map.get("flag"));		
		System.out.println(map.get("nick"));
		service.updateLike(map);
	}
	
}
