package com.kosmo.fridge.web;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.fridge.service.impl.CommunityServiceImpl;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityServiceImpl service;

	@RequestMapping("/community/main.do")
	public String toCoummunityMain(Map map) {
		return "community/CommunityList.tiles";
	}
	
	@RequestMapping("/memberProfile/{nick}.do")
	public String toMemberProfile(@PathVariable String nick, Map map) {
		map.put("memberProfile", service.selectOneMemberProfile(nick));		
		return "mypage/profile/MemberProfile.tiles";
	}
	
	@RequestMapping("/community/write.do")
	public String toCoummunityWrite() {
		return "community/WriteTestForm.tiles";
	}
	
	@RequestMapping("/community/writeProcess.do")
	public String insertFeed(MultipartHttpServletRequest mhsr) {
		service.insertFeed(mhsr);		
		return "community/WriteTestForm.tiles";
	}
	
	@RequestMapping("/community/setUserImg.do")
	public String uploadMemberImg(MultipartHttpServletRequest mhsr) throws IllegalStateException, IOException{
						
		System.out.println(service.updateMemberImg(mhsr));		
		return "community/WriteTestForm.tiles";
	}
}