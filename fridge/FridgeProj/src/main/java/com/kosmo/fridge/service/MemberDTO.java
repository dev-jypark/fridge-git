package com.kosmo.fridge.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private String id;
	private String pwd;
	private String email;
	private String nick;
	private String addr;
	private String imgsrc;
	private java.sql.Date regdate;
}
