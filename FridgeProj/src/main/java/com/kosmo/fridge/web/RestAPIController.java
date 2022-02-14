package com.kosmo.fridge.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.kosmo.fridge.service.IngredientServiceImpl;
import com.kosmo.fridge.service.RestAPIService;

@RestController
public class RestAPIController {
	@Resource(name="ingredientService")
	private IngredientServiceImpl ingredientService;
	
	/*
	 [RestTemplate]
	 -Spring 3.0부터 지원하는 내장 클래스로 스프링 서버에서 REST한 방식으로 HTTP 통신을 하기위한 API
	 -Rest방식으로 다른 서버와 HTTP 통신을 동기 방식으로 쉽게 할수 있는  템플릿
	  (AsyncRestTemplate는 비동기 통신)
	 -기본적으로 Connection pool을 사용하지 않아서
 	  많은 요청을 하면 TIME_WAIT로 인해 자원이 점점 부족해져 
      서비스에 어려움이 있다
 
	 -내부적으로 java.net.HttpURLConnection 사용
	 -요청을 보낼때는 HttpEntity< Map혹은 DTO,HttpHeaders>타입에 요청바디(데이타)와 요청헤더와 설정
	-응답을 받을때는 ResponseEntity<Map혹은 DTO>

	 */
	//https://jsonplaceholder.typicode.com/서버(Rest API서버)로 HTTP로 요청하기
	@Autowired
	private RestTemplate restTemplate;
	
	@CrossOrigin("http://localhost:9080")
	//먼저 https://www.jsonschema2pojo.org/사이트에서 JSON을 DTO로 변환
	@PostMapping(value="/recipe.do",produces = "application/json;charset=UTF-8")
	public List<Map> list(@RequestBody Map<String, Object> map, HttpServletRequest request){//List<Map>로 받을때-DTO 불필요
		System.out.println("컨트롤러에 들어온 아이디 입니다. request" + request.getSession().getAttribute("id"));
		//Map map = new HashMap<>();
		//map.put("id", session.getAttribute("id"));
		System.out.println("맵에 들어있는 아이디"+map.get("id"));
		String enddate = ingredientService.selectDate(map);
		//1.요청헤더 설정용 객체 생성
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		//3.RestTemplate으로 요청 보내기
		String url = "http://127.0.0.1:5000/?ingre="+enddate;
		System.out.println(url);
		System.out.println("레스트템플릿실행전");
		ResponseEntity<List> response= //List<Map 혹은 DTO>로 받을때
		
				restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				//Photo[].class);//응답데이타 타입(배열로 받을때)
				//new ParameterizedTypeReference<List<Map>>() {	});
				List.class);//응답데이타 타입(List<Map 혹은 DTO>로 받을때)
		System.out.println("레스트템플릿실행후");
		System.out.println("응답코드:"+response.getStatusCodeValue());
		System.out.println("응답헤더:"+response.getHeaders());
		System.out.println("실제 데이터:"+response.getBody());		
		System.out.println(response);	
		return response.getBody();
		}//////////

	@PostMapping(value="/recipedetail1.do",produces = "application/json;charset=UTF-8")
	public List<Map> detail(@RequestBody Map<String, Object> map, HttpSession session){//List<Map>로 받을때-DTO 불필요
		String enddate = ingredientService.selectDate(map);
		//1.요청헤더 설정용 객체 생성
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		String url = "http://127.0.0.1:5000/detail?ingre="+enddate;
		ResponseEntity<List> response= //List<Map 혹은 DTO>로 받을때		
				restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				//Photo[].class);//응답데이타 타입(배열로 받을때)
				//new ParameterizedTypeReference<List<Map>>() {	});
				List.class);//응답데이타 타입(List<Map 혹은 DTO>로 받을때)
				
	/*	System.out.println("응답코드:"+response.getStatusCodeValue());
		System.out.println("응답헤더:"+response.getHeaders());
		System.out.println("실제 데이터:"+response.getBody());		
		System.out.println(response);	*/
		return response.getBody();
	}////////////
	
	@PostMapping(value="/recipedetail2.do",produces = "application/json;charset=UTF-8")
	public List<Map> detail2(@RequestBody Map<String, Object> map, HttpSession session){//List<Map>로 받을때-DTO 불필요
		String enddate = ingredientService.selectDate(map);
		//1.요청헤더 설정용 객체 생성
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		String url = "http://127.0.0.1:5000/detail?ingre="+enddate;
		System.out.println(url);
		ResponseEntity<List> response= //List<Map 혹은 DTO>로 받을때		
				restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				//Photo[].class);//응답데이타 타입(배열로 받을때)
				//new ParameterizedTypeReference<List<Map>>() {	});
				List.class);//응답데이타 타입(List<Map 혹은 DTO>로 받을때)
				
		/*System.out.println("응답코드:"+response.getStatusCodeValue());
		System.out.println("응답헤더:"+response.getHeaders());
		System.out.println("실제 데이터:"+response.getBody());		
		System.out.println(response);	*/
		return response.getBody();
	}////////////
	
	@GetMapping(value="/recipedetail3.do",produces = "application/json;charset=UTF-8")
	public List<Map> detail3(HttpSession session){//List<Map>로 받을때-DTO 불필요
		Map map = new HashMap<>();
		map.put("id", session.getAttribute("id"));
		String enddate = ingredientService.selectDate(map);
		//1.요청헤더 설정용 객체 생성
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		String url = "http://127.0.0.1:5000/detail?ingre="+enddate;
		ResponseEntity<List> response= //List<Map 혹은 DTO>로 받을때		
				restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				//Photo[].class);//응답데이타 타입(배열로 받을때)
				//new ParameterizedTypeReference<List<Map>>() {	});
				List.class);//응답데이타 타입(List<Map 혹은 DTO>로 받을때)
				
		System.out.println("응답코드:"+response.getStatusCodeValue());
		System.out.println("응답헤더:"+response.getHeaders());
		System.out.println("실제 데이터:"+response.getBody());		
		System.out.println(response);	
		return response.getBody();
	}////////////
	
	@GetMapping(value="/recipedetail4.do",produces = "application/json;charset=UTF-8")
	public List<Map> detail4(HttpSession session){//List<Map>로 받을때-DTO 불필요
		Map map = new HashMap<>();
		map.put("id", session.getAttribute("id"));
		String enddate = ingredientService.selectDate(map);
		//1.요청헤더 설정용 객체 생성
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		String url = "http://127.0.0.1:5000/detail?ingre="+enddate;
		ResponseEntity<List> response= //List<Map 혹은 DTO>로 받을때		
				restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				//Photo[].class);//응답데이타 타입(배열로 받을때)
				//new ParameterizedTypeReference<List<Map>>() {	});
				List.class);//응답데이타 타입(List<Map 혹은 DTO>로 받을때)
				
		System.out.println("응답코드:"+response.getStatusCodeValue());
		System.out.println("응답헤더:"+response.getHeaders());
		System.out.println("실제 데이터:"+response.getBody());		
		System.out.println(response);	
		return response.getBody();
	}////////////
}
