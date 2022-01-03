package com.kosmo.fridge.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.impl.ShareServiceImpl;

//@RequestMapping("/fridge/share/")
@Controller
public class ShareController {
	
	@Resource(name="shareService")
	private ShareServiceImpl shareService;
	
	//목록
	@RequestMapping("/shareList.do")
	public String list(@RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
						Model model
      ) {
		List<ShareDTO> listShare=shareService.selectList(map);
		/*
		for (ShareDTO dto:listShare) {
			System.out.println(dto.toString());
			System.out.println("이거 돌아가는거 맞아?");
		}
		System.out.println("컨트롤러 들어옴");*/
		model.addAttribute("listShare",listShare);
		return "share/ShareList.tiles"; 
		
	}
}
