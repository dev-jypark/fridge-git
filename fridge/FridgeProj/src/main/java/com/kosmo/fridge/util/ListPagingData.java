package com.kosmo.fridge.util;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ListPagingData<T> {
	//레코드 목록
	private List<T> lists;
	//페이징 관련 데이타
	private int totalRecordCount;
	private int pageSize;
	private int blockPage;
	private int nowPage;
	private String pagingString;
}
