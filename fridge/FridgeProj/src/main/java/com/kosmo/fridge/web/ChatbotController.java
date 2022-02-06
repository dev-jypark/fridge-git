package com.kosmo.fridge.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosmo.fridge.HomeController;

@Controller
public class ChatbotController {	
	
	@RequestMapping(value = "/chatbot.do", method = RequestMethod.GET)
	public String rerecipe(Locale locale, Model model) {

		
		return "chatbot/Chatbot.tiles";
	}

}
