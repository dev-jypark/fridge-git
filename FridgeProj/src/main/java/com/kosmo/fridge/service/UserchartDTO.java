package com.kosmo.fridge.service;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class UserchartDTO {
	private int totalMemberCount;
	private int totalPostCount;
	private int totalTradePostCount;
	private int totalCommentCount;
	private List<Object> memberCountpm;
	private List<Object> addrCount;
	private List<Object> favoriteFood;
	private String month;
	private String count;
	private String addr;
	private String i_name;
	private String SUM;
	
	
	
}
