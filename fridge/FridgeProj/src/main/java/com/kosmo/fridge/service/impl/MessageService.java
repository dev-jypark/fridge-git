package com.kosmo.fridge.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.MessageTO;

@Service("messageService")
public class MessageService {
	@Resource(name="messageDAO")
	MessageDAO messageDAO;
	
	public void insertSendMessage(MessageTO to) {
		messageDAO.messageSendInlist(to);
	}

}
