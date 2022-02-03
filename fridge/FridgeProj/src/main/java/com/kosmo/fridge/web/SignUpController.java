package com.kosmo.fridge.web;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String signUpPOST(Map map, MemberDTO memberDTO) {
		memberService.signUp(memberDTO);
		memberService.agreeOK(memberDTO);
		return "community/CommunityList.tiles";
	}
	@RequestMapping(value="/SocialSignUp",method=RequestMethod.GET)
	public void SocialSignUpGET() {
	}
	//소셜 회원가입 POST]
	@RequestMapping(value="/SocialSignUp",method=RequestMethod.POST)
	public String socialSignUpPOST(@RequestParam Map map, MemberDTO memberDTO) {
		memberService.SocialSignUp(memberDTO);
		memberService.socialAgreeOK(memberDTO);
		return "community/CommunityList.tiles";
		}

	//아이디중복 체크]
	@RequestMapping(value="/checkMember",method=RequestMethod.POST) 
	@ResponseBody
	public int checkMember(MemberDTO memberDTO) {
		int result=memberService.checkMember(memberDTO);
		return result;
	}
	//닉네임중복 체크]
	@RequestMapping(value="/checkNick",method=RequestMethod.POST) 
	@ResponseBody
	public int checkNick(MemberDTO memberDTO) {
		int result=memberService.checkNick(memberDTO);
		return result;
	}
}
