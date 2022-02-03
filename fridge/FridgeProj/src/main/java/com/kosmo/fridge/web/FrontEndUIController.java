package com.kosmo.fridge.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class FrontEndUIController {
	
	//스프링 서버에서 Rest한 방식으로 http 통신을 하기위한 API
	@Autowired
	private RestTemplate restTemplate;//파이어베이스 클라우드쪽에 토큰값과 메시지를 보내기  위한 API
	

	//사용자 UI처리용(제목 및 내용 입력 UI)
	@GetMapping("/")
	public String index() {
		return "PushMessageSend";
	}///////////////
	//RestTemplate API로 파이어베이스 클라우드 메시징 서버쪽에
	//내가 만든 앱을 설치한 모든 스마트폰에 메시지를 푸쉬하도록 POST요청 보내기
	//※DTO는 @RequestParam 생략가능,단,Map으로 받을때는 반드시 붙여야 한다.
	@PostMapping("/message")	
	public String pushMessage(@RequestParam Map<String, String> message,Model model) throws JsonProcessingException {
		/*
		RestTemplate
		-Spring 3.0부터 지원하는 내장 클래스
		-Rest방식으로 HTTP 통신을 동기 방식(AsyncRestTemplate는 비동기)으로 쉽게 할수 있는  템플릿
		-RestTemplate은 기본적으로 커넥션풀을 지원하지 않는다(요청이 많은 경우 지연이 발생할 수 있다)
		 커넥션풀을 사용하는 경우 아래 라이브러리 추가
		-요청을 보낼때는 HttpEntity< Map혹은 DTO,HttpHeaders>타입에 요청헤더와 요청바디(데이타) 설정
		-응답을 받을때는 ResponseEntity<Map혹은 DTO>로
		 이때 DTO는 파이어베이스에서 응답해주는 JSON구조에 맞게 DTO를 생성해야한다
		 <dependency>
		    <groupId>org.apache.httpcomponents</groupId>
		    <artifactId>httpclient</artifactId>
		    <version>4.5.13</version>
		</dependency>
		*/	
		//모든 토큰값 가져오기


		return "PushMessageSend";
		
	}////////////////
	//각 토큰정보로 요청 보내기
	private ResponseEntity<Map> requestToFCMServer(Map<String, String> message, Object token) {
		System.out.println("title:"+message.get("title"));
		System.out.println("body:"+message.get("body"));
		//1.요청헤더 설정 :HttpHeaders 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		//파이베이스 콘솔->프로젝트 설정(톱니)->클라우드 메시징 탭 메뉴의 서버키
		headers.add("Authorization","key=AAAAFlkjL0g:APA91bHgARUfnL_vHWhwT1JTSKNN0YLEaTAuMWEkOPJeb8t8yKyeSnv57GtmQSe3SUci-L2WHzAmRHf4iIuwvabwElNm3G8CcB0YwgCUkM9dKwOjVzbg5SGgU17MIDnxIZfCDNdygU7X");
		
		//2.요청 바디 설정
		//{"data":{"폼의 파라미터명":"제목입니다","폼의 파라미터명":"내용입니다"},"to":"토큰값"}
		//※※※ 폼의 파라미터명는 반드시 MyFirebaseMessagingService클래스의
		//     remoteMessage.getData().get("폼의 파라미터명")이어야 한다.
		
		Map<String,Object> bodies = new HashMap<>();
		bodies.put("data", message);
		bodies.put("to", token);
		//3.HttpEntity객체 생성
		HttpEntity entity = new HttpEntity(bodies, headers);
		//4.RestTemplate으로 요청 보내기
		String uri = "https://fcm.googleapis.com/fcm/send";
		//한글 포함시
		UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(uri).build();
		ResponseEntity<Map> resultMap= restTemplate.exchange(
				uriComponents.toString(),//요청 URI
				HttpMethod.POST,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				Map.class);//응답데이타 타입	
		
		return resultMap;
	}
	
}
