package com.kosmo.fridge.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.impl.IngrediantServiceImpl;

@SessionAttributes({"id"})
@Controller
@RequestMapping("/fridge")
public class FridgeListController {
	
	//서비스주입
	@Resource(name="ingrediantService")
	private IngrediantServiceImpl ingrediantService;
	
	//목록 페이지 띄워주기
	@RequestMapping("/fridgeList")
	public String fridgeList(Model model) throws Exception {
		//List<IngrediantDTO> list=ingrediantService.fridgeList();//list에 결과값 담기
		//model.addAttribute("list", list);//model에 데이터 값 담기	
		//System.out.println("값이 잘 담기나?"+list);
		//System.out.println("크기는???"+list.size());
		//System.out.println("안에 내용은????"+list.get(0));
		return "fridge/FridgeList";
	}
	//입력 get
	@RequestMapping("/fridgeWrite.do")
	public String writeGet() {
		return "fridge/FridgeWrite";
	}
	//에엥 get
	@RequestMapping(value="insert.do", method=RequestMethod.GET)
	public void writeGeet() {
		
	}
	//입력 post
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	@ResponseBody
	public String writePost(HttpServletRequest req) throws Exception,NullPointerException {
		//req.setCharacterEncoding("UTF-8");
		
		//아이디저장
		String id=(String)req.getSession().getAttribute("id");
		Map map = new HashMap<>();	
		map.put("id", id);
		//System.out.println("저장된 아이디:"+map.get("id"));
		
		//받아오자
		String[] foodNameCounts=req.getParameterValues("foodNameCounts");
		String[] foodCntCounts=req.getParameterValues("foodCntCounts");
		String[] foodEnddateCounts=req.getParameterValues("foodEnddateCounts");
		
		//출력해보자
		
		try {
		System.out.println("foodNameCounts[0]번째 방:"+foodNameCounts[0]);
		System.out.println("foodCntCounts[0]번째 방:"+foodCntCounts[0]);
		System.out.println("foodEnddateCounts[0]번째 방:"+foodEnddateCounts[0]+"=============================");
		}catch(NullPointerException e) {
			System.out.println("널이다!!!!!!!!!!!");
		}
		
		//잘라서 담자
		String[] foodName = foodNameCounts[0].split(",");
		String[] foodCnt = foodCntCounts[0].split(",");
		String[] foodEnddate = foodEnddateCounts[0].split(",");
		
		//출력해보자
		for(String s:foodName) {
			 System.out.println("foodName은?:"+s);
		}
		for(String m:foodCnt) {
			
			 System.out.println("foodCnt은?:"+m);
		}
		for(String k:foodEnddate) {
			 System.out.println("foodEnddate은?:"+k+"=============================");
		}
		
		//System.out.println("재료이름1:"+foodNameCounts[1]+",재료수량1:"+foodCntCounts[1]+",재료유통기한1:"+foodEnddateCounts[1]);
		
		//for문으로 돌려보자
		
		 for(int i=0; i<foodName.length; i++) {
			 System.out.println("길이가 몇인데? foodName.length:"+foodName.length);
			 System.out.println("foodName[i]번째 방:"+foodName[i]);
			 System.out.println("foodCnt[i]번째 방:"+foodCnt[i]);
			 System.out.println("foodEnddate[i]번째 방:"+foodEnddate[i]);
			 
			 System.out.println("재료이름:"+foodName[i]+",재료수량:"+foodCnt[i]+",재료유통기한:"+foodEnddate[i]);  	 
		 	 
			 map.put("f_name",foodName[i]); 
			 map.put("f_count",foodCnt[i]);
			 map.put("f_enddate", foodEnddate[i]);
			 ingrediantService.fridgeWrite(map);
			 
			 System.out.println("map안의 f_name:"+map.get("f_name"));
			 System.out.println("map안의 f_count:"+map.get("f_count"));
			 System.out.println("map안의 f_enddate:"+map.get("f_enddate"));	
		 }
		
		/*
		//while문으로 돌려보자
		int i=0;
		while(i<foodName.length) {

			System.out.println("길이가 몇인데? foodName.length:"+foodName.length);
			System.out.println("foodName[i]번째 방:"+foodName[i]);
			System.out.println("foodCnt[i]번째 방:"+foodCnt[i]);
			System.out.println("foodEnddate[i]번째 방:"+foodEnddate[i]+"=============================");
			
			map.put("f_name",foodName[i]); 
			map.put("f_count",foodCnt[i]);
			map.put("f_enddate", foodEnddate[i]);
			
			System.out.println("재료이름:"+foodName[i]+",재료수량:"+foodCnt[i]+",재료유통기한:"+foodEnddate[i]); 
			
			ingrediantService.fridgeWrite(map);
			System.out.println("map안의 f_name:"+map.get("f_name"));
			System.out.println("map안의 f_count:"+map.get("f_count"));
			System.out.println("map안의 f_enddate:"+map.get("f_enddate"));
			
			i++;
		}
		*/
		return "foward:fridgeList.do";
	}
	//상세보기
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public String getdetail(Model model,int i_no) {
		IngrediantDTO data=ingrediantService.detail(i_no);
		model.addAttribute("data", data);
		return "fridge/FridgeView";
	}
	//수정 get
	@RequestMapping(value="fridgeEdit.do",method=RequestMethod.GET)
	public String fridgeEditGet(Model model,int i_no) {
		IngrediantDTO data=ingrediantService.detail(i_no);
		model.addAttribute("data", data);
		//System.out.println("너 왜그래????????"+i_no);	
		//System.out.println("왜그러냐구?????????"+data);
		return "fridge/FridgeEdit";
	}
	//수정 post
	@RequestMapping(value="edit.do",method=RequestMethod.POST)
	public String fridgeEditPost(IngrediantDTO ingrediantDTO) throws Exception {
		System.out.println("ingrediantDTO : " + ingrediantDTO);
		//System.out.println("너 진짜 왜 그러는데 : " + i_no);
		ingrediantService.fridgeEdit(ingrediantDTO);
		return "redirect:fridgeList.do";
	}
	//삭제
	@RequestMapping(value="ingreDelete.do",method=RequestMethod.GET)
	public String deletePost(@RequestParam("i_no") String i_no) {
		ingrediantService.ingreDelete(i_no);
		return "redirect:fridgeList.do";
	}
	//선택삭제
	@RequestMapping(value="ingreDelete.do")
	public String ajaxTest(HttpServletRequest req) {
		String[] ajaxMsg=req.getParameterValues("valueArr");
		int size=ajaxMsg.length;
		for(int i=0; i<size; i++) {
			ingrediantService.ingreDelete(ajaxMsg[i]);
		}
		return "redirect:fridgeList.do";
	}
	//유통기한 임박순 정렬
	@RequestMapping(value="/sortByEnd.do",method=RequestMethod.GET)
	public String indexEnd(Map map, Model model,HttpServletRequest req) throws Exception {
		String id=(String)req.getSession().getAttribute("id");
		map.put("id", id);
		
		List<IngrediantDTO> list=ingrediantService.sortByEnd(id);
		model.addAttribute("list", list);	
		for(IngrediantDTO dto:list) {
			System.out.println(dto);
		}
		return "fridge/FridgeAjaxList";
	}
	//등록일 기준 정렬
	@RequestMapping("/fridgeSortPostdate.do")
	public String fridgeSortPostdate(Map map, Model model,HttpServletRequest req) throws Exception {
		String id=(String)req.getSession().getAttribute("id");
		map.put("id", id);
		
		List<IngrediantDTO> list=ingrediantService.fridgeList(id);//list에 결과값 담기
		model.addAttribute("list", list);//model에 데이터 값 담기	
		//System.out.println("값이 잘 담기나?"+list);
		//System.out.println("크기는???"+list.size());
		//System.out.println("안에 내용은????"+list.get(0));
		return "fridge/FridgeAjaxList";
	}
}