package com.kosmo.fridge.web;

import java.io.Console;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.fridge.service.MessageTO;
import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.impl.MemberServiceImpl;
import com.kosmo.fridge.service.impl.MessageDAO;
import com.kosmo.fridge.service.impl.ShareServiceImpl;

@Controller
public class MessageController {
	@Autowired
	private MessageDAO messageDao;

	@Resource(name="shareService")
	private ShareServiceImpl shareService;
	
	// 메세지 목록
	@RequestMapping(value = "/message_list.do")
	public String message_list(HttpServletRequest request) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nick = (String) request.getSession().getAttribute("id");

		MessageTO to = new MessageTO();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);

		return "message/message_list.tiles";
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("id"));

		String nick = (String) request.getSession().getAttribute("id");

		MessageTO to = new MessageTO();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);
		
		return "message/message_ajax_list";
	}

	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(HttpServletRequest request) {

		int room = Integer.parseInt(request.getParameter("room"));

		MessageTO to = new MessageTO();
		to.setRoom(room);
		to.setNick((String) request.getSession().getAttribute("id"));
		to.setRecv_nick(request.getParameter(""));
		// 메세지 내용을 가져온다.
		ArrayList<MessageTO> clist = messageDao.roomContentList(to);

		request.setAttribute("clist", clist);

		return "message/message_content_list";
	}

	
	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room, @RequestParam String other_nick,
			@RequestParam String content, HttpSession session) {

		MessageTO to = new MessageTO();
		to.setRoom(room);
		to.setSend_nick((String) session.getAttribute("id"));
		System.out.println((String) session.getAttribute("id"));
		to.setRecv_nick(other_nick);
		to.setContent(content);
		
		int flag = messageDao.messageSendInlist(to);

		return flag;
	}
	
	//내 게시물이면 채팅하기 버튼 안뜨게 하기
	@RequestMapping(value="/message_send_trade.do")
	public String message_send_trade(@RequestParam int no, HttpSession session, Model model) {
		Map map = new HashMap<>();
		map.put("tb_no", no);
		//게시글 조회해오기
		ShareDTO sharDto = shareService.selectOne(map);
		System.out.println("message_send_trade dto"+sharDto);
		//알림 메시지 내용 작성
		String content, path, imgsrc, sendTime;
		
		path = session.getServletContext().getRealPath("/upload/share");
		//imgsrc = path+File.separator+Integer.toString(no)+File.separator+sharDto.getImg();
		content = "[거래 요청 안내]";
		content += "</br>";

		//content += "<img src=\""+"<c:url value=\"/upload/share/"+sharDto.getImg()+"\"/>"+"\"/>";
		content += "<img src= \'/upload/share/"+Integer.toString(no)+"/"+sharDto.getImg()+"\'/>";
		content += "<b>\""+ sharDto.getTbTitle() +"\"</b>";
		System.out.println("content : "+content);
		//전송 시간 세팅
		DateFormat dateFormat = new SimpleDateFormat("MM-dd HH:mm");
		Date date = new Date();
		sendTime = dateFormat.format(date);
		//거래 요청 알림 메시지 전송
		MessageTO messageTo = new MessageTO();
		messageTo.setContent(content);
		messageTo.setSend_nick((String) session.getAttribute("id"));
		messageTo.setRecv_nick(sharDto.getId());
		messageTo.setRoom(0);
		messageTo.setSend_time(sendTime);
		messageTo.setRead_chk("1");
		messageDao.messageSendInlist(messageTo);
		//model.addAttribute("trade",shareService.selectOne(map));
		return "message/message_list.tiles";
	}

}