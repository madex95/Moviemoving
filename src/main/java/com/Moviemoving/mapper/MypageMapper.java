package com.Moviemoving.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Moviemoving.domain.BookmarkVO;
import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.RateVO;

public interface MypageMapper {
	//Bookmark
	public List<MovieVO> movie_bookmark(String User_id);
	public List<MovieVO> tv_bookmark(String User_id);
	
	//bookmark 등록
	public void insertBookmark(BookmarkVO bookmark);
	//bookmark 삭제
	public void deleteBookmark(BookmarkVO bookmark);
	//bookmark 중복검사
	public int bookmarkChk(@Param("User_id") String User_id, @Param("MovieInfo_no") int MovieInfo_no) throws Exception;
		
	//후기리스트
	public List<RateVO> rateListMovie(String User_id);
	public List<RateVO> rateListTV(String User_id);
	//후기삭제
	public void deleteRate(@Param("User_id") String User_id, @Param("MovieInfo_no") int MovieInfo_no);
	//후기수정
	public void modifyRate(RateVO rate);
	
}
