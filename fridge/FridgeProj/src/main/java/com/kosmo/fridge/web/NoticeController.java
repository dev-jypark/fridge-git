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

@SessionAttributes("adminid")
@RequestMapping("/admin_notice/")
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
		return "/admin/notice/List";
	}
	//입력폼으로 이동]
	@RequestMapping(value="/Write.do",method = RequestMethod.GET)
	public String write(@ModelAttribute("adminid") String adminid){				
		//뷰정보 반환]
		return "/admin/notice/Write";
	}
	//입력처리]
	@RequestMapping(value="/Write.do",method = RequestMethod.POST)
	public String writeOk(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map
			) throws Exception {
		//서비스 호출]	
		map.put("adminid", adminid);
		noticeService.insert(map);
		//뷰정보 반환]목록으로 이동
		return "/admin/notice/List";
	}
	//컨트롤러 메소드 작성 규칙]
	/*
	 * 접근지정자 : public
	 * 반환타입 : 주로 String(뷰정보를 문자열로 반환)
	 * 메소드명: 임의
	 * 인자 : 원하는 타입을 사용할 수 있다(단, 사용할 수 있는 타입이 정해져 있다)
	 *       어노테이션도 가능
	 * 예외를 throws할 수 있다(선택) 
	 */
	//상세보기]
	@RequestMapping("View.do")
	public String view(
			@ModelAttribute("adminid") String adminid,
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
		return "/admin/notice/View";
	}
	//수정폼으로 이동 및 수정처리]
	@RequestMapping("Edit.do")
	public String edit(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map,
			HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			NoticeDTO record= noticeService.selectOne(map);
			//데이타 저장]
			req.setAttribute("record", record);
			//수정 폼으로 이동]
			return "/admin/notice/Edit";
		}
		//수정처리후 상세보기로 이동
		//서비스 호출
		noticeService.update(map);
		//뷰로 포워드
		return "forward:/admin_notice/View.do";
	}
	//삭제처리]
	@RequestMapping("Delete.do")
	public String delete(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map) throws Exception {
		//서비스 호출
		noticeService.delete(map);
		//뷰로 포워드
		return "forward:/admin_notice/List.do";
		
	}

}//