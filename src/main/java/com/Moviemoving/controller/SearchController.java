package com.Moviemoving.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Moviemoving.domain.CriteriaVO;
import com.Moviemoving.domain.pageVO;
import com.Moviemoving.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor // @Setter(onMethod_= {@Autowired})를 사용하면 쓸 필요 없음
public class SearchController {
	// 자동주입
	public SearchService service;

	@GetMapping("/search")
	// 페이징
	public void list(CriteriaVO cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new pageVO(cri, total));
		
		//갯수
		model.addAttribute("getTotal", service.getTotal(cri));
		model.addAttribute("getTotalM", service.getTotalM(cri));
		model.addAttribute("getTotalT", service.getTotalT(cri));
		model.addAttribute("getTotalact", service.getTotalact(cri));
		model.addAttribute("getTotalani", service.getTotalani(cri));
		model.addAttribute("getTotalcomedy", service.getTotalcomedy(cri));
		model.addAttribute("getTotalcrime", service.getTotalcrime(cri));
		model.addAttribute("getTotaldocu", service.getTotaldocu(cri));
		model.addAttribute("getTotaldrama", service.getTotaldrama(cri));
		model.addAttribute("getTotalfamily", service.getTotalfamily(cri));
		model.addAttribute("getTotalfantasy", service.getTotalfantasy(cri));
		model.addAttribute("getTotalhorror", service.getTotalhorror(cri));
		model.addAttribute("getTotalhistory", service.getTotalhistory(cri));
		model.addAttribute("getTotalmusic", service.getTotalmusic(cri));
		model.addAttribute("getTotalromance", service.getTotalromance(cri));
		model.addAttribute("getTotalSF", service.getTotalSF(cri));
		model.addAttribute("getTotalsports", service.getTotalsports(cri));
		model.addAttribute("getTotalthrill", service.getTotalthrill(cri));
		model.addAttribute("getTotalwar", service.getTotalwar(cri));
		
	}

	// 조회
	@GetMapping("/get")
	public void get(@RequestParam("MovieInfo_no") int movieInfo_no, Model model) {
		log.info("/get");
		model.addAttribute("movieInfo", service.get(movieInfo_no));
	}

}
