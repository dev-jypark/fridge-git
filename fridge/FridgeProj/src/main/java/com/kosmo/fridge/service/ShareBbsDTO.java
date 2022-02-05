package com.kosmo.fridge.service;



import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShareBbsDTO {
	
	private String tb_no;
	private String addr;
	private String id;
	private String tb_title;
	private String tb_content;
	private String tb_visitcount;
	private java.sql.Date tb_postDate;
	
}
