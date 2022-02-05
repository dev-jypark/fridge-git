package com.kosmo.fridge.web;

import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
				//세션에 저장된 모델 삭제
				status.setComplete();
				model.addAttribute("NotMember","아이디 또는 비밀번호가 일치하지 않습니다.");		
				return "member/Login.tiles";
			}else{
				return "home.tiles";
			}		
		}
	
	//소셜로그인 처리
	@RequestMapping("/socialLogin")
	public String socialLogin(@RequestParam Map map,Model model,SessionStatus status,HttpSession session){
		//회원정보 유무 판별
		int flag = memberService.isSocialLogin(map);
		String loginType = map.get("loginType").toString();
		String socialId = map.get("socialId").toString();
		String socialNickname = map.get("socialNickname").toString();
		String socialEmail = map.get("socialEmail").toString();	
		//모델에 값 추가
		model.addAttribute("loginType", loginType);
		model.addAttribute("socialId", socialId);
		model.addAttribute("socialNickname",socialNickname);
		model.addAttribute("socialEmail", socialEmail);
		//세션에 카카오나 구글로부터 받은 아이디와 별명, 이메일 저장
		session.setAttribute("socialId", socialId);
		session.setAttribute("socialNickname", socialNickname);
		session.setAttribute("socialEmail", socialEmail);
		//로그인시 loginType에 kakao나 google이 저장되므로 비었다면 로그인 실패		
		if(loginType.isEmpty()) {		
			status.setComplete();
			return "member/Login.tiles";
		}
		//flag가 0, 즉 회원정보가 없다면
		if(flag == 0) {
			return "member/SocialSignUp";
		}
		return "home.tiles";
		
		
	}
	/*
	//관리자페이지 로그인용
		session.setAttribute("id", idList.get(0));
		session.setAttribute("email", map.get("email"));
		if(map.get("id").equals("admin")) {
			return "admin/Home.tiles";
		} else {
			return "community/CommunityList.tiles";
		}

		return "member/Login.tiles";
	}	
	*/
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session){
		status.setComplete();
		session.invalidate();
		//뷰정보 반환
		return "member/Login.tiles";
	}
}