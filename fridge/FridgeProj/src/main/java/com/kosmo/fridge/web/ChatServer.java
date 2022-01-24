package com.kosmo.fridge.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatServer extends TextWebSocketHandler{
	private List<WebSocketSession> clientList = new ArrayList<WebSocketSession>();
	private Map<String, Object> clientMap = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		clientList.add(session);
		System.out.println(session.getId()+"연결성공");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로 부터 받은 메시지" + message.getPayload());
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if(type != null && type.equals("register")) {
			String client = object.getString("userid");
			clientMap.put(client, session);
		}
		else {
			String target = object.getString("target");
			WebSocketSession wsession = (WebSocketSession)clientMap.get(target);
			String msg = object.getString("message");
			if(wsession != null) {
				wsession.sendMessage(new TextMessage(msg));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clientList.remove(session);
		System.out.println(session.getId()+"와 연결 끊어짐");
	}
}