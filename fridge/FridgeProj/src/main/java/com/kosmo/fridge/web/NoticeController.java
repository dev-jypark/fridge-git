package com.kosmo.fridge.web;

import java.util.Collection;
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

import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.NoticeDTO;
import com.kosmo.fridge.service.impl.NoticeServiceImpl;


@RequestMapping("/notice/")
@Controller
public class NoticeController {
	
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	//목록 처리
	@RequestMapping("List.do")
	public String list(	   
					   @RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
					   @RequestParam(required = false,defaultValue = "1") int nowPage,
			           HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
			           Model model
			           
			) {
		//서비스 호출]
		ListPagingData<NoticeDTO> listPagingData= noticeService.selectList(map, req, nowPage);		
		//데이타 저장]
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환]
		return "notice/List.tiles";
	}

	//상세보기]
	@RequestMapping("View.do")
	public String view(
			@ModelAttribute("n_no") String n_no,
			@RequestParam Map map,Model model) {
		//서비스 호출]
		
		NoticeDTO record= noticeService.selectOne(map);
		int hits = noticeService.increaseHit(n_no);
		//데이타 저장]
		//줄바꿈 처리
		record.setN_content(record.getN_content().replace("\r\n","<br/>"));
		model.addAttribute("record", record);
		model.addAttribute("hits", hits);
		/////////////////////////////////////////////
		//뷰정보 반환]
		return "notice/List.tiles";
	}

}//
