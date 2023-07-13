package com.Moviemoving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Moviemoving.domain.CategoryListVO;
import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.RateVO;
import com.Moviemoving.mapper.MovieMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieServiceImpl implements MovieService {
	@Setter(onMethod_ = @Autowired)
	private MovieMapper mapper;

	@Override
	public MovieVO read(int MovieInfo_no) {
		return mapper.read(MovieInfo_no);
	}
	@Override
	public List<MovieVO> movieNetflix() {
		return mapper.movieNetflix();
	}

	@Override
	public List<MovieVO> movieWatcha() {
		return mapper.movieWatcha();
	}

	@Override
	public List<MovieVO> movieWavve() {
		return mapper.movieWavve();
	}

	@Override
	public List<CategoryListVO> getCategory(int MovieInfo_no) {
		return mapper.getCategory(MovieInfo_no);
	}

	@Override
	public List<MovieVO> movieBest() {
		return mapper.movieBest();
	}

	@Override
	public List<MovieVO> tvBest() {
		return mapper.tvBest();
	}

	@Override
	public List<MovieVO> tvNetflix() {
		return mapper.tvNetflix();
	}

	@Override
	public List<MovieVO> tvWatcha() {
		return mapper.tvWatcha();
	}

	@Override
	public List<MovieVO> tvWavve() {
		return mapper.tvWavve();
	}
	
	//후기등록
	@Override
	public void insertRate(RateVO rate) {
		mapper.insertRate(rate);
	}
	//후기리스트
	@Override
	public List<RateVO> rateList(int MovieInfo_no) {
		return mapper.rateList(MovieInfo_no);
	}
	//후기 중복검사
	@Override
	public int rateChk(String User_id, int MovieInfo_no) throws Exception {
		return mapper.rateChk(User_id, MovieInfo_no);
	}
	//후기 참여한인원
	@Override
	public Integer rateCount(int MovieInfo_no) {
		return mapper.rateCount(MovieInfo_no);
	}
	//후기 평점
	@Override
	public Integer rateGPA(int MovieInfo_no) {
		return mapper.rateGPA(MovieInfo_no);
	}
}
