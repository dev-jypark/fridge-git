package com.kosmo.fridge.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.impl.MemberServiceImpl;
import com.kosmo.fridge.service.impl.MypageServiceImpl;

@SessionAttributes({"id"})
@Controller
@MultipartConfig(
		maxFileSize = 1024*1024*10,
		maxRequestSize = 1024*1024*10,
		fileSizeThreshold = 1024*1024*10,
		location = "d:"
		)
//경로 설정
@RequestMapping("/mypage/memberinfo")
public class MyPageController {
    
	@Resource(name="mypageService")
	private MypageServiceImpl mypageService;	
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	//[회원정보보기]
	@RequestMapping("/Profile")
	public String readMember(){
		return "mypage/memberinfo/Profile.tiles";
	}
	
	//[회원정보수정]
	//top에서 Edit.jsp 요청
	@RequestMapping(value = "/Edit",method = RequestMethod.GET)
	public String showMemberEdit(HttpSession session, Model model){
		if (session.getAttribute("id") == null) { //소셜회원
			String id = session.getAttribute("socialId").toString();
			System.out.println("소셜 계정 id:"+id);
			model.addAttribute("member",mypageService.readMember(id));
		}
		else{ //일반회원
			String id = session.getAttribute("id").toString();
			System.out.println("일반 계정 id:"+id);
			model.addAttribute("member",mypageService.readMember(id));
		}
		System.out.println(model);
		return "mypage/memberinfo/Edit.tiles";
	}
	//Edit페이지에서 회원정보수정버튼 클릭 시 memberEdit 요청
	@RequestMapping(value = "/Edit",method = RequestMethod.POST)
	public String memberEdit(MemberDTO memberDTO, @RequestParam MultipartFile imgsrcfile, HttpServletRequest request, Model model) throws IOException { 	
		//File file = new File(request.getServletContext().getRealPath("/temp"),"profile_img.jpg");
		String tempFileSrc = memberDTO.getNick()+imgsrcfile.getOriginalFilename().substring(imgsrcfile.getOriginalFilename().lastIndexOf("."));			
		System.out.println(tempFileSrc);	
		File file = new File(request.getServletContext().getRealPath("/temp"), tempFileSrc);
		imgsrcfile.transferTo(file);
		System.out.println("파일 저장 위치:"+file);
		System.out.println("콘텐츠 유형:"+imgsrcfile.getContentType());
		System.out.println("파일 파라미터명:"+imgsrcfile.getName());
		System.out.println("파일 이름:" + imgsrcfile.getOriginalFilename());
		System.out.println(model);
		memberDTO.setImgsrc(file.getName());
		System.out.println("수정파일이름 : " + file.getName());
		mypageService.memberEdit(memberDTO, imgsrcfile);
		return "mypage/memberinfo/Profile.tiles";
	}
	
	//[비밀번호수정]
	@RequestMapping(value="/Password",method = RequestMethod.GET)
	public String showPwdEdit() {
		return "mypage/memberinfo/Password.tiles";
	}
	@RequestMapping(value="/Password",method = RequestMethod.POST)
	public String pwdEdit(MemberDTO memberDTO){
		memberService.pwdEdit(memberDTO);
		return "home.tiles";
	}
	
}
