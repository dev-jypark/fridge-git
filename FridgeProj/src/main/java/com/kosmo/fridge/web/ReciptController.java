package com.kosmo.fridge.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReciptController {
	
	@RequestMapping("/receipe/imageList")
	public String toreceipeImageList(Map map) {
		return "receipe/imageList.tiles";
	}

}
