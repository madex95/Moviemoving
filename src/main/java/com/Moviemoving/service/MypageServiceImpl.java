package com.Moviemoving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Moviemoving.domain.BookmarkVO;
import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.RateVO;
import com.Moviemoving.mapper.MypageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageServiceImpl implements MypageService {
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;
	
	@Override
	public List<MovieVO> movie_bookmark(String user_id) {
		return mapper.movie_bookmark(user_id);
	}

	@Override
	public List<MovieVO> tv_bookmark(String user_id) {
		return mapper.tv_bookmark(user_id);
	}

	//bookmark 등록
	@Override
	public void insertBookmark(BookmarkVO bookmark) {
		mapper.insertBookmark(bookmark);
	}
	//bookmark 삭제
	@Override
	public void deleteBookmark(BookmarkVO bookmark) {
		mapper.deleteBookmark(bookmark);	
	}
	//bookmark 중복검사
	@Override
	public int bookmarkChk(String User_id, int MovieInfo_no) throws Exception {
		return mapper.bookmarkChk(User_id, MovieInfo_no);
	}
	
	//후기리스트
	@Override
	public List<RateVO> rateListMovie(String User_id) {
		return mapper.rateListMovie(User_id);
	}
	@Override
	public List<RateVO> rateListTV(String User_id) {
		return mapper.rateListTV(User_id);
	}
	//후기삭제
	@Override
	public void deleteRate(String User_id, int MovieInfo_no) {
		mapper.deleteRate(User_id, MovieInfo_no);
	}
	//후기수정
	@Override
	public void modifyRate(RateVO rate) {
		mapper.modifyRate(rate);		
	}
}
