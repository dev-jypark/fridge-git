package com.kosmo.fridge.web;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
		
		String form="0gwldydkk@gmail.com";//보내는사람
		String to=email;//받는사람
		String title="[찍먹냉장고] 회원가입 인증번호 입니다.";//제목 
		String content="<center>"+
						"<span style='font-weight:600;font-size:5em;font-family:Helvatica;color:#483D8B;'>"
						+"WELCOME!"+"</span>"+"<br/>"
						
						+"<span style='font-weight:600;font-size:1.3em;font-family:Nanum Gothic,Georgia;color:#708090;'>"
						+"안녕하세요, "+"</span>"
						
						+"<span style='font-weight:800;font-size:1.5em;font-family:Nanum Gothic,Georgia;color:#483D8B;'>"
						+"찍먹냉장고"+"</span>"
						
						+"<span style='font-weight:600;font-size:1.3em;font-family:Nanum Gothic,Georgia;color:#708090;'>"
						+" 에 오신 것을 진심으로 환영합니다."+"</span>"+"<br/>"
						
						+"<img src=\"https://image.freepik.com/free-vector/isometric-obesity-horizontal-composition-with-view-kitchen-interior-with-fat-person-opening-door-fridge_1284-58600.jpg\">"
						
						+"<br/>"+"<span style='font-weight:600;font-size:1.3em;font-family:Nanum Gothic,Georgia;color:#708090;'>"
						+"발급된 인증번호는 "+"</span>"
						
						+"<span style='font-weight:900;font-size:1.8em;font-family:Georgia;color:#483D8B;text-align:center;'>"
						+randomNumber+"</span>"
						
						+"<span style='font-weight:600;font-size:1.3em;font-family:Nanum Gothic,Georgia;color:#708090;'>"
						+" 입니다."+"</span>"
						
						+"<br/>"+"<span style='font-weight:800;font-size:1.3em;font-family:Nanum Gothic,Georgia;color:#483D8B;'>"
						+"회원가입을 완료하시려면 인증번호를 확인란에 기입해주세요."+"</span>"
						+"</center>";
		try {
			//SimpleMailMessage message = new SimpleMailMessage();
			MimeMessage mail=mailSender.createMimeMessage();
			MimeMessageHelper message=new MimeMessageHelper(mail,true,"UTF-8");
			
			message.setFrom(form); // 보내는사람 생략하면 정상작동을 안함
			message.setTo(to); // 받는사람 이메일
			message.setSubject(title); // 메일제목은 생략이 가능하다
			message.setText(content,true); // 메일 내용		
			mailSender.send(mail);
			System.out.println("보내지나?"+message);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return randomNumber;
	}
}
