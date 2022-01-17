package com.kosmo.fridge.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.fridge.service.impl.QuestionServiceImpl;



@SessionAttributes({"id"})
@Controller
@RequestMapping("/question/")
public class MemberController {
	//서비스 주입
	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	
	//로그인 폼으로 이동	
	@RequestMapping("Login.do")
	public String login() {
		return "question/Login";
	}
	
	//로그인 처리]
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map,Model model,SessionStatus status){
		//서비스 호출]
		boolean flag= questionService.isLogin(map);
		model.addAttribute("id", map.get("id"));
		if(!flag) {
			status.setComplete();
			model.addAttribute("Notmember","멤버정보 불일치.");
		}
		return "question/List";
	}
	
	//로그아웃 처리]
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status){
		status.setComplete();
		//뷰정보 번환]
		return "community/CommunityList";
	}
}//
