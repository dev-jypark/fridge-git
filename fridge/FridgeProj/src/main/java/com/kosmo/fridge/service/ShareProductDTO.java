package com.kosmo.fridge.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShareProductDTO {
	private String tNo;
	private String iNo;
	private String tbNo;
	private Date tDeadLine;
	private String tCnt;
	private String tResult;
}
