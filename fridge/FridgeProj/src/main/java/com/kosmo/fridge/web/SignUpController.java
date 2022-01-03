package com.kosmo.fridge.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/member")
public class SignUpController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	//회원가입 GET]
	@RequestMapping(value="/SignUp",method=RequestMethod.GET)
	public void signUpGET() {
	}
	//회원가입 POST]
	@RequestMapping(value="/SignUp",method=RequestMethod.POST)
	public String signUpPOST(MemberDTO memberDTO) {
		memberService.signUp(memberDTO);
		return "community/CommunityList.tiles";
	}
	//아이디중복 체크]
	@RequestMapping(value="/checkmember",method=RequestMethod.POST) 
	public String checkMember(String id) {
		int result=memberService.checkMember(id);
		if(result !=0) {
			return "fail";
		}
		else {
			return "success";
		}
	}
}
