package com.Moviemoving.mapper;

import java.util.List;

import com.Moviemoving.domain.CriteriaVO;
import com.Moviemoving.domain.MovieVO;

public interface SearchMapper {
	// 게시판 목록
	public List<MovieVO> getList();

	// 게시판 목록(페이징)
	public List<MovieVO> getListWithPaging(CriteriaVO cri);
	public MovieVO read(int MovieInfo_no);

	// 목록 총 갯수
	public int getTotal(CriteriaVO cri);
	public Integer getTotalM(CriteriaVO cri);
	public Integer getTotalT(CriteriaVO cri);
	public Integer getTotalact(CriteriaVO cri);
	public Integer getTotalani(CriteriaVO cri);
	public Integer getTotalcomedy(CriteriaVO cri);
	public Integer getTotalcrime(CriteriaVO cri);
	public Integer getTotaldocu(CriteriaVO cri);
	public Integer getTotaldrama(CriteriaVO cri);
	public Integer getTotalfamily(CriteriaVO cri);
	public Integer getTotalfantasy(CriteriaVO cri);
	public Integer getTotalhorror(CriteriaVO cri);
	public Integer getTotalhistory(CriteriaVO cri);
	public Integer getTotalmusic(CriteriaVO cri);
	public Integer getTotalromance(CriteriaVO cri);
	public Integer getTotalSF(CriteriaVO cri);
	public Integer getTotalsports(CriteriaVO cri);
	public Integer getTotalthrill(CriteriaVO cri);
	public Integer getTotalwar(CriteriaVO cri);
	
	
	
}
