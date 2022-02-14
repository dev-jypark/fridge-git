package com.kosmo.fridge.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	@RequestMapping(value="/chatList.do", method = RequestMethod.GET)
	public String list() {
		return "chat/Websocket.tiles";
	}
}
