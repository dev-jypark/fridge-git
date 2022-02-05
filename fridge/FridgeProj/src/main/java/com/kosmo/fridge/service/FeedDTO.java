package com.kosmo.fridge.service;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FeedDTO {
	private String fb_no;          
	private String id;	
	private String fb_content; 
	private String fb_postdate;
	private String nick;
	private List<String> list_fi_src;
	private List<MemberProfileDTO> list_f_likeMember;	
	private List<CommentDTO> list_f_comment;
	
}
