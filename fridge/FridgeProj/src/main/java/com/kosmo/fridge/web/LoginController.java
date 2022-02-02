package com.kosmo.fridge.web;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.fridge.service.impl.MemberServiceImpl;

@SessionAttributes({"id"})
@Controller
@RequestMapping("/member")
public class LoginController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	//로그인 폼으로 이동
	@RequestMapping("/login")
	public String login() {
		return "member/Login.tiles";
	}
	
	//로그인 처리
	@RequestMapping("/loginprocess")
	public String process(@RequestParam Map map,Model model,SessionStatus status){
		//서비스 호출
		boolean flag= memberService.isLogin(map);
		model.addAttribute("id", map.get("id"));
		if(!flag) {//로그인 실패시
			status.setComplete();
			model.addAttribute("NotMember","아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		//뷰정보 반환
		return "home.tiles";
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(SessionStatus status){
		status.setComplete();
		//뷰정보 반환
		return "member/Login.tiles";
	}
}