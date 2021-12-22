package com.kosmo.fridge.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareViewController {
	@RequestMapping("/shareview")
	public String share() {
		return "share/ShareView";
	}
}