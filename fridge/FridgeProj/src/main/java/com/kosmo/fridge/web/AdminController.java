package com.kosmo.fridge.web;

import java.util.Map;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.NoticeDTO;
import com.kosmo.fridge.service.impl.NoticeServiceImpl;

@SessionAttributes({"adminid"})
@Controller
@RequestMapping("/admin/")
public class AdminController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	
	//로그인 폼으로 이동	
	@RequestMapping("adminLogin.do")
	public String login() {
		return "/admin/Login";
	}
	
	//로그인 처리]
	@RequestMapping("LoginProcess.do")
	
	public String process(@RequestParam Map map,   @RequestParam(required = false,defaultValue = "1") int nowPage,
	           HttpServletRequest req, Model model,SessionStatus status)
	           {
		
		//서비스 호출]
		boolean flag= noticeService.isAdmin(map);
		
		model.addAttribute("adminid", map.get("adminid"));
		if(!flag) {
			status.setComplete();
			model.addAttribute("NotAdmin","관리자가 아닙니다.");
			
		}

		//서비스 호출]
		ListPagingData<NoticeDTO> listPagingData= noticeService.selectList(map, req, nowPage);
					
		//데이타 저장]
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환]
		return "/admin/notice/List";
	}
	
	//로그아웃 처리]
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status){
		status.setComplete();
		//뷰정보 번환]
		return "/admin/Login";
	}
}//
