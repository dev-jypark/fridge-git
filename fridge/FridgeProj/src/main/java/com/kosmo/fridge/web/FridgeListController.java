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
		List<IngrediantDTO> list=ingrediantService.fridgeList();//list에 결과값 담기
		model.addAttribute("list", list);//model에 데이터 값 담기	
		System.out.println("값이 잘 담기나?"+list);
		System.out.println("크기는???"+list.size());
		System.out.println("안에 내용은????"+list.get(0));
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
	//수정
	
	//삭제
	
}