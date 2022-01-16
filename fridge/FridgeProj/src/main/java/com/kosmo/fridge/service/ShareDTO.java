package com.kosmo.fridge.service;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShareDTO {
	private String tbNo;
	private String id;
	private String tbTitle;
	private String tbContent;
	private String tbVisitCount;
	private Date tbPostDate;
	
	private String likeCount;
	private String addr;
	
	private List<TradeDTO> listShareProduct;
}