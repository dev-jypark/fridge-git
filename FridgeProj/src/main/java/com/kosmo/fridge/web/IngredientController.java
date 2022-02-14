package com.kosmo.fridge.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.fridge.service.IngredientDTO;
import com.kosmo.fridge.service.IngredientServiceImpl;
import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.impl.MemberDAO;
import com.kosmo.fridge.service.impl.MemberServiceImpl;

@SessionAttributes("id")
@RequestMapping("/recipe/db/")
@Controller
public class IngredientController {

	@Resource(name="ingredientService")
	private IngredientServiceImpl ingredientService;

	
	@RequestMapping("Stock.do")
	public String selectStock(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {
		map.put("id", id);
		String stock = ingredientService.selectStock(map);	
		model.addAttribute("stock", stock);
		model.addAttribute("id", id);
		System.out.println("stock:=============="+stock);
		System.out.println("id"+id);
		return "recipe/db/Stock.do";
	}
	
	
	@RequestMapping("Date.do")
	public String selectDate(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {	
		map.put("id", id);
		String enddate = ingredientService.selectDate(map);
		model.addAttribute("enddate", enddate);
		System.out.println("enddate:=============="+enddate);
		//System.out.println("id----------------------"+id);
		System.out.println("id---------------dd-------"+map.get("id"));
		return "recipe/db/Date.do";
	}
	
	
}
