package com.kosmo.fridge.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/member")
public class mailSenderController {
	
	//이메일 인증 보내기
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/sendMail")
	@ResponseBody
	public int sendMail(String email)  throws ClassNotFoundException {
		//인증용 랜덤숫자 발생
		int randomNumber = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
		
		String setform="0gwldydkk@gmail.com";//보내는사람
		String tomail=email;//받는사람
		String title="찍먹냉장고 회원가입 인증번호 입니다.";//제목
		String content="찍먹냉장고에 오신 것을 환영합니다."+"\r\n"+
						"인증번호는 "+randomNumber+"입니다."+"\r\n"+
						"인증번호 확인란에 기입해주십시오.";//내용
		try {
			SimpleMailMessage message = new SimpleMailMessage();

			message.setFrom(setform); // 보내는사람 생략하면 정상작동을 안함
			message.setTo(tomail); // 받는사람 이메일
			message.setSubject(title); // 메일제목은 생략이 가능하다
			message.setText(content); // 메일 내용		
			mailSender.send(message);
			System.out.println("보내지나?"+message);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return randomNumber;
	}
}
