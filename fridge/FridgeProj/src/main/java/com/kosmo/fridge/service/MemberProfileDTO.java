package com.kosmo.fridge.service;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberProfileDTO {

	private String id;  
	private String nick;
	private String self;
	private int feedcount;
	private List<String> followers;
	private List<String> follows;	
}
