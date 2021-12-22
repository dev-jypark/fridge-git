package com.kosmo.fridge.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareListController {
	@RequestMapping("/sharelist")
	public String share() {
		return "share/ShareList";
	}
}