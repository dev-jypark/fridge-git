package com.kosmo.fridge.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus; //@@추가
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.MessageTO;
import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.TradeDTO;
import com.kosmo.fridge.service.impl.ShareServiceImpl;
import com.kosmo.fridge.util.ListPagingData;

@RequestMapping("/share")
@Controller
public class ShareController {
	
	@Resource(name="shareService")
	private ShareServiceImpl shareService;
	
	/*
	 * public String list(@RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용 Model model
	 * ) { System.out.println("--------------컨트롤러 들어옴--------------");
	 * List<ShareDTO> listShare=shareService.selectList(map);
	 * 
	 * for (ShareDTO dto:listShare) { System.out.println(dto.toString());
	 * System.out.println("이거 돌아가는거 맞아?"); }
	 * 
	 * model.addAttribute("listShare",listShare); return "share/ShareList.tiles";
	 * 
	 * }
	 */
	//목록
	@RequestMapping("/shareList.do")	
	public String list(	   
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req ,
			Model model,
			SessionStatus status) throws JsonProcessingException {
		
		//서비스 호출
		ListPagingData<ShareDTO> datas = shareService.selectList(map,req,nowPage);
		List<ShareDTO> Bbslists = datas.getLists();
		//데이터 셋
		ObjectMapper mapper = new ObjectMapper();
		String lists = mapper.writeValueAsString(Bbslists);
		model.addAttribute("listPagingData", datas);
		model.addAttribute("lists", lists);
		//지도 중심좌표 찍기용 임시 세션 - addr -> 로그인 유저의 addr로 넘겨줄 것.
		model.addAttribute("addr", "가산동");		//비회원인 경우를 위한 현재 위치 잡아주려면 geolocation 써줘야하니...

		return "share/ShareList.tiles";
	}
	////////////
	@RequestMapping(value="/list",produces = "application/json; charset=UTF-8")//value 사용 시 서블릿 매핑에서 .do 붙나?
	public @ResponseBody String list(@RequestParam Map map,HttpServletRequest req) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		//1]서비스 호출	
		ListPagingData<ShareDTO> datas= shareService.selectList(map, req, 1);
		List<ShareDTO> listss= datas.getLists();
		System.out.println(listss);
		return mapper.writeValueAsString(listss);
	}
	//@@@ 되면 위에꺼 날려 c...
	@RequestMapping(value = "/shareAjaxList.do")
	public String shareAjaxList(@RequestParam Map map, HttpServletRequest req) {
		ListPagingData<ShareDTO> datas = shareService.selectList(map, req,1);
		List<ShareDTO> bbslists = datas.getLists();
		// List<ShareDTO Bbslists = shareService.selectList(map, req, 1).getLists();	
		req.setAttribute("list", bbslists);
		return "share/ShareAjaxList";
	}
	
	//에이작스로 가자
	@RequestMapping(value="/view.do")
	public String view(@RequestParam Map map,HttpServletRequest req) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		ShareDTO record= shareService.viewSelectOne(map);
		record.setTbContent(record.getTbContent().replace("\r\n","<br/>"));
		req.setAttribute("record", record);
		System.out.println("넘겨줌");
		return "share/ShareView";
	}///////////////
	
	//글 작성 폼으로 이동
	@RequestMapping(value = "/shareWrite", method = RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		//로그인 회원가입 연결하고 나서 사용자 id와 일치하는 재료만 받아오기
		//map에 아이디 저장
		
		Map map = new HashedMap();
		map.put("id", session.getAttribute("id"));
		//System.out.println("컨트롤러 아이디 : "+map.get("id"));
		System.out.println("write 들어옴 select 전");
		List<IngrediantDTO> listIngrediant = shareService.selectIngrediantList(map);
		System.out.println("write 들어옴 select 후");
		model.addAttribute("listIngrediant", listIngrediant);
		return "share/ShareWrite";
	}
	
	/*
	 * @Autowired private ObjectMapper mapper;
	 */
	//글 등록
	@RequestMapping(value = "/shareWrite", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String writeOK(MultipartHttpServletRequest multipartRequest) throws JsonProcessingException {
		
		return shareService.insert(multipartRequest) ? "success" : "error";
	}
	
	//글 수정
	@RequestMapping(value = "/shareEdit.do", method = RequestMethod.GET)
	public String edit(@RequestParam Map map ,HttpServletRequest req) {
		//수정 페이지로 이동
		//req.setAttribute("", );쿼리 스트링 값 ㅇㅇㅇㅇㅇ추가@@;
		if(req.getMethod().equals("GET")) {
			ShareDTO record = shareService.selectOne(map);
			req.setAttribute("record", record);
			return "share/ShareEdit";
		}
		//글 수정 작업 진행
		else {
			
		}
		return null;
	}
	
	//글 삭제
	@RequestMapping(value="/shareDelete.do")
	public String delete(@RequestParam Map map ,HttpServletRequest req) {
		System.out.println(map.size());
		System.out.println("삭제 컨트롤러");
		System.out.println(map.get("tb_no"));
		//삭제할 때 #{tb_no} 임
		shareService.delete(map);
		return "share/ShareList.tiles";
	}
	
	@RequestMapping(value="/shareComplte.do")
	public String complete(@RequestParam Map map) {
			shareService.complete(map);
		return "";
	}
	
}
