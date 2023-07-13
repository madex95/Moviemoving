package com.Moviemoving.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class RateVO {
	private int MovieInfo_no;
	private String User_id;
	private String MovieRate_con;
	private int MovieRate_score;
	
	private String User_name;
	private String MovieInfo_title;
	private String MovieInfo_thum;
	
	//등록완료 후 제자리에 있기 위해 Link 필요
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("MovieInfo_no", this.MovieInfo_no);
		
		return builder.toUriString();
	}
}
