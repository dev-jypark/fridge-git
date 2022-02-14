package com.kosmo.fridge.web;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kosmo.fridge.service.MessageTO;
import com.kosmo.fridge.service.impl.MessageService;

public class ChatServer extends TextWebSocketHandler{
	@Resource(name="messageService")
	private MessageService messageService;
	
	
	private List<WebSocketSession> clientList = new ArrayList<WebSocketSession>();
	private Map<String, Map> clientMap = new HashMap<>();

	private Map mapCientSession = new HashMap<>();
	private Map mapTargetId = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		clientList.add(session);
		System.out.println("chatserver : "+session.getId()+"연결성공");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로 부터 받은 메시지" + message.getPayload());
		JSONObject object = new JSONObject(message.getPayload());
		//메시지의 타입, 사용자 아이디
		String type = object.getString("type");
		String client = object.getString("userid");
		String target;
		String content, room, sendDate, readCheck = "0";
		MessageTO to = new MessageTO();
		
		//등록할 때
		if(type != null && type.equals("register")) {
			target = object.getString("targetid");
			//사용자가 어떤 채팅상대와 대화중인지 등록
			mapTargetId.put(client,target);
			System.out.println("register >> id :"+object.getString("userid")+" target : "+object.getString("targetid"));
		}
		//사용자가 서버에 연결되었을 때
		else if(type.equals("open")) {
			//세션을 맵에 등록
			mapCientSession.put(client, session);
			System.out.println(client+" 들어옴");
			System.out.println("웹소켓에 연결 기록 있는 사용자 아이디");
			Set<String> keySet = mapCientSession.keySet();
			for(String key : keySet) {
				System.out.println(key);
			}
		}
		else {
			//타겟id, 내용, 방번호 받아오기
			target = object.getString("targetid");
			content = object.getString("content");
			room = object.getString("room");
			System.out.println(object.getString("senddate"));
			/*
			 * SimpleDateFormat format = new SimpleDateFormat("MM-dd HH:mm"); java.util.Date
			 * date = format.parse(object.getString("senddate"));
			 */
			sendDate = object.getString("senddate");
			
			//타켓이 웹 소켓에 접속 중이고
			if(mapCientSession.containsKey(target) && clientList.contains(mapCientSession.get(target))) {
				WebSocketSession wsession = (WebSocketSession)mapCientSession.get(target);
				if(wsession != null) {
					//타겟이 현재 나와 대화중일 때(채팅을 읽고 있음)
					if(mapTargetId.containsKey(target)&&(mapTargetId.get(target).equals(client))) {
						System.out.println("타겟이 웹소켓에 접속중이고 읽고 있음");
						//읽지 않음 플래그
						readCheck = "0";
						//현재 사용자가 읽고 있음 상태 jsonObject에 저장
						object.put("readCheck", true);
					}
					//타겟이 현재 채팅을 읽고 있지 않을 때
					else {
						System.out.println("타겟이 웹소켓이 접속중이지만 안읽음");
						readCheck = "1";
						object.put("readCheck", false);
					}
					//TextMessage txtMsg = new TextMessage((CharSequence) object);
					wsession.sendMessage(message);
				}
			}
			//타켓이 웹 소켓에 접속 X
			else {
				System.out.println("타깃은 웹소켓에 접속하지 않았습니다");
				readCheck = "1";
			}
			System.out.println("readCheck : " + readCheck);
			
			
			to.setContent(content);
			to.setSend_nick(client);
			to.setRecv_nick(target);
			to.setRead_chk(readCheck);
			to.setRoom(Integer.parseInt(room));
			to.setSend_time(sendDate);
			messageService.insertSendMessage(to);
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clientList.remove(session);
		System.out.println(session.getId()+"와 연결 끊어짐");
	}
}