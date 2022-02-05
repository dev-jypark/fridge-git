package com.kosmo.fridge.web;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.ShareBbsDTO;
import com.kosmo.fridge.service.ShareMapService;
import com.kosmo.fridge.service.impl.ShareMapServiceImpl;

@RequestMapping("/share")
@Controller
public class ShareController {
		
	@Resource(name="ShareMapService")
	private ShareMapServiceImpl shareMapService;//shareMap?
	
//	@Autowired
	//private ObjectMapper mapper;
	
	@RequestMapping("/shareMap") 
	public String shareMap(//@ModelAttribute("id") String id,
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req ,
			Model model,
			SessionStatus status) throws JsonProcessingException {
		
		//서비스 호출
		ListPagingData<ShareBbsDTO> datas = shareMapService.selectList(map,req,nowPage);
		List<ShareBbsDTO> Bbslists = datas.getLists();
		//데이터 셋
		ObjectMapper mapper = new ObjectMapper();
		String lists = mapper.writeValueAsString(Bbslists);
		model.addAttribute("listPagingData", datas);
		model.addAttribute("lists", lists);
		//지도 중심좌표 찍기용 임시 세션 - addr -> 로그인 유저의 addr로 넘겨줄 것.
		model.addAttribute("addr", "가산동");		//비회원인 경우를 위한 현재 위치 잡아주려면 geolocation 써줘야하니...

		return "share/ShareMap";
	}
	
	@RequestMapping(value="/list",produces = "application/json; charset=UTF-8")//value 사용 시 서블릿 매핑에서 .do 붙나?
	public @ResponseBody String list(@RequestParam Map map,HttpServletRequest req) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		//1]서비스 호출	
		ListPagingData<ShareBbsDTO> datas= shareMapService.selectList(map, req, 1);
		List<ShareBbsDTO> listss= datas.getLists();

		return mapper.writeValueAsString(listss);
	}
	
	//에이작스로 가자
	@RequestMapping(value="/view",produces = "application/json; charset=UTF-8")
	public @ResponseBody String view(
		@RequestParam Map map,HttpServletRequest req) throws JsonProcessingException {
		req.setAttribute("tbno", 8);//@@
		System.out.println("tbno "+req.getParameter("tbno"));//@@tbaddr
		ObjectMapper mapper = new ObjectMapper();
		ShareBbsDTO record= shareMapService.selectOne(map,req);
		record.setTb_content(record.getTb_content().replace("\r\n","<br/>"));
		
		System.out.println(mapper.writeValueAsString(record));//@@
		//뷰정보 반환]
		return mapper.writeValueAsString(record);
	}

}
