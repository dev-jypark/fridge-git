package com.kosmo.fridge.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.fridge.service.IngredientDTO;
import com.kosmo.fridge.service.IngredientServiceImpl;

@RequestMapping("/recipe/db/")
@Controller
public class IngredientController {

	@Resource(name="ingredient")
	private IngredientServiceImpl ingredient;
	
	@RequestMapping("Stock.do")
	public String selectStock(
			//@ModelAttribute("id") String id,
			@RequestParam Map map,Model model) {
		//map.put("id", id);
		String stock = ingredient.selectStock(map);
		model.addAttribute("stock", stock);
		System.out.println("stock:=============="+stock);
		return "recipe/db/Stock.do";
	}
	
	
	@RequestMapping("Date.do")
	public String selectDate(
			//@ModelAttribute("id") String id,
			@RequestParam Map map,Model model) {
		//map.put("id", id);
		String enddate = ingredient.selectDate(map);
		model.addAttribute("enddate", enddate);
		System.out.println("enddate:=============="+enddate);
		return "recipe/db/Date.do";
	}
	
	
}
