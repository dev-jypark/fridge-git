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
import com.kosmo.fridge.service.QuestionDTO;
import com.kosmo.fridge.service.impl.QuestionServiceImpl;


@SessionAttributes("adminid")//스프링 씨큐리티를 사용할때 주석
@RequestMapping("/question/")
@Controller
public class QuestionController {
	//서비스 주입
	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	//목록 처리
	@RequestMapping("List.do")
	public String list(	   
					   @RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
					   @RequestParam(required = false,defaultValue = "1") int nowPage,
			           HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
			           Model model
			           
			) {
		//서비스 호출]
		ListPagingData<QuestionDTO> listPagingData= questionService.selectList(map, req, nowPage);		
		//데이타 저장]
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환]
		return "/admin/question/List";
	}
	//입력폼으로 이동]
	@RequestMapping(value="/Write.do",method = RequestMethod.GET)
	public String write(@ModelAttribute("adminid") String adminid){				
		//뷰정보 반환]
		return "/admin/question/Write";
	}
	//입력처리]
	@RequestMapping(value="/Write.do",method = RequestMethod.POST)
	public String writeOk(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map
			) throws Exception {
		//서비스 호출]	
		map.put("adminid", adminid);
		questionService.insert(map);
		//뷰정보 반환]목록으로 이동
		return "/admin/question/List";
	}

	//상세보기]
	@RequestMapping("View.do")
	public String view(
			@ModelAttribute("adminid") String adminid,
			@ModelAttribute("q_no") String q_no,
			@RequestParam Map map,Model model) {
		//서비스 호출]
		QuestionDTO record= questionService.selectOne(map);

		//데이타 저장]
		//줄바꿈 처리
		record.setQ_content(record.getQ_content().replace("\r\n","<br/>"));
		model.addAttribute("record", record);
		
		/////////////////////////////////////////////
		//뷰정보 반환]
		return "/admin/question/View";
	}
	//수정폼으로 이동 및 수정처리]
	@RequestMapping("Edit.do")
	public String edit(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map,
			HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			QuestionDTO record= questionService.selectOne(map);
			//데이타 저장]
			req.setAttribute("record", record);
			//수정 폼으로 이동]
			return "/admin/question/Edit";
		}
		//수정처리후 상세보기로 이동
		//서비스 호출
		questionService.update(map);
		//뷰로 포워드
		return "/admin/question/View";
	}
	//삭제처리]
	@RequestMapping("Delete.do")
	public String delete(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map) throws Exception {
		//서비스 호출
		questionService.delete(map);
		//뷰로 포워드
		return "/admin/question/List";
		
	}
	//게시판 답글페이지 이동
	@RequestMapping(value="/WriteReply.do",method = RequestMethod.GET)
	public String writeReply(/*@ModelAttribute("id") String id*/){				
		//뷰정보 반환]
		return "/admin/question/WriteReply";
	}
	//입력처리]
	@RequestMapping(value="/WriteReply.do",method = RequestMethod.POST)
	public String writeReplyOk(
			@ModelAttribute("adminid") String adminid,
			@RequestParam Map map
			) throws Exception {
		//서비스 호출]	
		map.put("adminid", adminid);
		questionService.insertReply(map);
		//뷰정보 반환]목록으로 이동
		return "forward:admin/question/List";
	}

}//
