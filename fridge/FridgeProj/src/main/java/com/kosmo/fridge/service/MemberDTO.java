package com.kosmo.fridge.service;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDTO {
	private String id;
	private String pwd;
	private String email;
	private String nick;
	private String self;
	private String addr;
	private String agree;
	private String imgsrc;
	private String socialId;
	private java.sql.Date regdate;
	
	
}
