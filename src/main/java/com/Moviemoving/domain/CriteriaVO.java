package com.Moviemoving.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class CriteriaVO {
	//현재 페이지
	private int pageNum;
	//한 페이지당 보여질 목록 개수
	private int amount;
	//영화 코드
	//
	
	//기본 생성자 -> 기본 세팅 : pageNum : 1, amount = 30
	public CriteriaVO() {
		this(1,30);
	}
	
	// 생성자  -> 원하는 pageNum, 원하는 amount int code;
	public CriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	// 검색 키워드
	private String type;
	private String keyword;
	private String keyword2;
	private String genre;

	
	// 검색조건 배열로 쓰기위한 문구
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}

	
}
