package com.kosmo.fridge.web;

import java.util.ArrayList;
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
	
	@RequestMapping(value="/message_send_trade.do")
	public String message_send_trade(@RequestParam int tb_no, Model model) {
		Map map = new HashMap<>();
		map.put("tb_no", tb_no);
		ShareDTO dto = shareService.selectOne(map);
		String content;
		
		model.addAttribute("trade",shareService.selectOne(map));
		return "message/message_list.tiles";
	}

}