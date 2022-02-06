package com.kosmo.fridge.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.fridge.service.UserchartDTO;
import com.kosmo.fridge.service.impl.UserchartServiceImpl;


@SessionAttributes("adminid")//스프링 씨큐리티를 사용할때 주석
@RequestMapping("/")
@Controller
public class UserchartController {
	
	//서비스 주입
		@Resource(name="UserchartService")
		private UserchartServiceImpl userchartService;
	
	//유저차트로 이동	
		@RequestMapping("userchart.do")
		public String userchart(@RequestParam Map map,
								Model model) {
		
			int totalMemberCount=userchartService.totalMemberCount(map);
			model.addAttribute("totalMemberCount",totalMemberCount);
			
			int totalPostCount=userchartService.totalPostCount(map);
			model.addAttribute("totalPostCount",totalPostCount);
			
			int totalTradePostCount=userchartService.totalTradePostCount(map);
			model.addAttribute("totalTradePostCount",totalTradePostCount);
			
			int totalCommentCount=userchartService.totalCommentCount(map);
			model.addAttribute("totalCommentCount",totalCommentCount);
			
			List<UserchartDTO> memberCountpm=userchartService.memberCountpm();
			model.addAttribute("memberCountpm",memberCountpm);
			
			List<UserchartDTO> addrCount=userchartService.addrCount();
			model.addAttribute("addrCount",addrCount);
			
			List<UserchartDTO> favoriteFood=userchartService.favoriteFood();
			model.addAttribute("favoriteFood",favoriteFood);
			
			return "/admin/Userchart";
		}
		
		

}//
