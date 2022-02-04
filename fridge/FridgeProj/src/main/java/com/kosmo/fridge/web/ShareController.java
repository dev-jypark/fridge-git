package com.kosmo.fridge.web;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.TradeDTO;
import com.kosmo.fridge.service.impl.ShareServiceImpl;
import com.kosmo.fridge.util.ListPagingData;

//@RequestMapping("/fridge/share/")
@Controller
public class ShareController {
	
	@Resource(name="shareService")
	private ShareServiceImpl shareService;
	
	//목록
	@RequestMapping("/shareList.do")
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
	public String list(	   
			   @RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
			   @RequestParam(required = false,defaultValue = "1") int nowPage,
	           HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
	           Model model
	           
	) {
		//서비스 호출]
		ListPagingData<ShareDTO>  listPagingData = shareService.selectList(map, req, nowPage);
		
		//데이타 저장]
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환]
		return "share/ShareList.tiles";
	}
	
	//글 작성 폼으로 이동
	@RequestMapping(value = "/shareWrite.do", method = RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		//로그인 회원가입 연결하고 나서 사용자 id와 일치하는 재료만 받아오기
		//map에 아이디 저장
		Map map = new HashedMap();
		map.put("id", session.getAttribute("id"));
		//System.out.println("컨트롤러 아이디 : "+map.get("id"));
		List<IngrediantDTO> listIngrediant = shareService.selectIngrediantList(map);
		model.addAttribute("listIngrediant", listIngrediant);
		return "share/ShareWrite";
	}
	
	/*
	 * @Autowired private ObjectMapper mapper;
	 */
	//글 등록
	@RequestMapping(value = "/shareWrite.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String writeOK(MultipartHttpServletRequest multipartRequest) throws JsonProcessingException {		
		return shareService.insert(multipartRequest) ? "success" : "error";
	}
	
	//글 수정
	@RequestMapping(value = "/shareEdit.do", method = RequestMethod.GET)
	public String edit(@RequestParam Map map ,HttpServletRequest req) {
		//수정 페이지로 이동
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
		System.out.println("삭제 컨트롤러");
		System.out.println(map.get("tb_no"));
		//삭제할 때 #{tb_no} 임
		shareService.delete(map);
		return "share/ShareList.tiles";
	}
	
	//@RequestMapping(value="/shareLike.do")
	
}
