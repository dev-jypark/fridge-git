package com.kosmo.fridge.web;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@SessionAttributes({"id"})
@Controller
@RequestMapping("/member")
public class MyPageController {
	
	@RequestMapping("/mypageEdit.do")
	public String mypage() {
		
		//세션에 있는 id 정보 호출
		
		//회원정보조회를 위해 memberService.readMember 호출
		
		//post로 호출한 회원정보 수정
		
		//회원정보수정 입력 페이지 반환
		return "mypage/memberinfo/Edit.tiles";
	}

}
