package com.Moviemoving.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Moviemoving.domain.CategoryListVO;
import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.RateVO;

public interface MovieMapper {	
	//영화상세
	public MovieVO read(int MovieInfo_no);
	//장르
	public List<CategoryListVO> getCategory(int MovieInfo_no);
	
	//메인 베스트-영화
	public List<MovieVO> movieBest();
	public List<MovieVO> movieNetflix();
	public List<MovieVO> movieWatcha();
	public List<MovieVO> movieWavve();
	
	//메인 베스트-TV
	public List<MovieVO> tvBest();
	public List<MovieVO> tvNetflix();
	public List<MovieVO> tvWatcha();
	public List<MovieVO> tvWavve();
	
	//후기등록
	public void insertRate(RateVO rate);
	//후기리스트
	public List<RateVO> rateList(int MovieInfo_no);	
	//후기 중복검사
	public int rateChk(@Param("User_id") String User_id, @Param("MovieInfo_no") int MovieInfo_no) throws Exception;
	//후기참여 인원수
	public Integer rateCount(int MovieInfo_no);
	//후기평점
	public Integer rateGPA(int MovieInfo_no);
}
