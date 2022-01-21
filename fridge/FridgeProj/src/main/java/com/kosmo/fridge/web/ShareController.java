package com.kosmo.fridge.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String write(Model model) {
		List<IngrediantDTO> listIngrediant = shareService.selectIngrediantList();
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
	
	@RequestMapping(value = "/shareEdit.do", method = RequestMethod.GET)
	public String edit(@RequestParam Map map ,HttpServletRequest req) {
		return null;
	}
}
