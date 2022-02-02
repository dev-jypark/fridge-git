package com.kosmo.fridge.web;

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
import com.kosmo.fridge.service.IngrediantPagingData;
import com.kosmo.fridge.service.impl.IngrediantServiceImpl;

@Controller
@RequestMapping("/fridge")
public class FridgeListController {
	
	//서비스주입
	@Resource(name="ingrediantService")
	private IngrediantServiceImpl ingrediantService;
	
	//목록
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
	@RequestMapping("/fridgeWrite")
	public String writeGet() {
		return "fridge/FridgeWrite";
	}
	//입력 post
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String writePost(IngrediantDTO ingrediantDTO,HttpSession session) {
		ingrediantService.fridgeWrite(ingrediantDTO);
		return "redirect:fridgeList.do";
	}
	//사진으로 입력 get
	@RequestMapping("/fridgeImage")
	public String imageGet() {
		return "fridge/FridgeImage";
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
	public String indexEnd(Model model) throws Exception {
		List<IngrediantDTO> list=ingrediantService.sortByEnd();
		model.addAttribute("list", list);	
		for(IngrediantDTO dto:list) {
			System.out.println(dto);
		}
		return "fridge/FridgeAjaxList";
		
	}
	//등록일 기준 정렬
	@RequestMapping("/fridgeSortPostdate.do")
	public String fridgeSortPostdate(Model model) throws Exception {
		List<IngrediantDTO> list=ingrediantService.fridgeList();//list에 결과값 담기
		model.addAttribute("list", list);//model에 데이터 값 담기	
		//System.out.println("값이 잘 담기나?"+list);
		//System.out.println("크기는???"+list.size());
		//System.out.println("안에 내용은????"+list.get(0));
		return "fridge/FridgeAjaxList";
	}
}