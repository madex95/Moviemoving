package com.Moviemoving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Moviemoving.domain.CriteriaVO;
import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.mapper.SearchMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SearchServiceImpl implements SearchService {

	@Setter(onMethod_ = @Autowired)
	private SearchMapper mapper;

	@Override
	public MovieVO get(int MovieInfo_no) {
		return mapper.read(MovieInfo_no);
	}

	@Override
	public List<MovieVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<MovieVO> getListWithPaging(CriteriaVO cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public Integer getTotalM(CriteriaVO cri) {
		return mapper.getTotalM(cri);
	}

	@Override
	public Integer getTotalT(CriteriaVO cri) {
		return mapper.getTotalT(cri);
	}

	@Override
	public Integer getTotalact(CriteriaVO cri) {
		return mapper.getTotalact(cri);
	}

	@Override
	public Integer getTotalani(CriteriaVO cri) {
		return mapper.getTotalani(cri);
	}

	@Override
	public Integer getTotalcomedy(CriteriaVO cri) {
		return mapper.getTotalcomedy(cri);
	}

	@Override
	public Integer getTotalcrime(CriteriaVO cri) {
		return mapper.getTotalcrime(cri);
	}

	@Override
	public Integer getTotaldocu(CriteriaVO cri) {
		return mapper.getTotaldocu(cri);
	}

	@Override
	public Integer getTotaldrama(CriteriaVO cri) {
		return mapper.getTotaldrama(cri);
	}

	@Override
	public Integer getTotalfamily(CriteriaVO cri) {
		return mapper.getTotalfamily(cri);
	}

	@Override
	public Integer getTotalfantasy(CriteriaVO cri) {
		return mapper.getTotalfantasy(cri);
	}

	@Override
	public Integer getTotalhorror(CriteriaVO cri) {
		return mapper.getTotalhorror(cri);
	}

	@Override
	public Integer getTotalhistory(CriteriaVO cri) {
		return mapper.getTotalhistory(cri);
	}

	@Override
	public Integer getTotalmusic(CriteriaVO cri) {
		return mapper.getTotalmusic(cri);
	}

	@Override
	public Integer getTotalromance(CriteriaVO cri) {
		return mapper.getTotalromance(cri);
	}

	@Override
	public Integer getTotalSF(CriteriaVO cri) {
		return mapper.getTotalSF(cri);
	}

	@Override
	public Integer getTotalsports(CriteriaVO cri) {
		return mapper.getTotalsports(cri);
	}

	@Override
	public Integer getTotalthrill(CriteriaVO cri) {
		return mapper.getTotalthrill(cri);
	}

	@Override
	public Integer getTotalwar(CriteriaVO cri) {
		return mapper.getTotalwar(cri);
	}

}
