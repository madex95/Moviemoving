package com.Moviemoving.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Moviemoving.domain.CategoryListVO;
import com.Moviemoving.domain.RateVO;
import com.Moviemoving.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MovieController {	
	private MovieService service;		
	
	@GetMapping("/")
	public String mainList(Locale locale, Model model) {
		
		model.addAttribute("movieBest", service.movieBest());
		model.addAttribute("netflix", service.movieNetflix());
		model.addAttribute("watcha", service.movieWatcha());
		model.addAttribute("wavve", service.movieWavve());
		
		return "index";
	}	
	
	@GetMapping("/TV")
	public void mainTVList(Model model) {
		model.addAttribute("tvBest", service.tvBest());
		model.addAttribute("netflix", service.tvNetflix());
		model.addAttribute("watcha", service.tvWatcha());
		model.addAttribute("wavve", service.tvWavve());
	}
	
	//영화상세
	@GetMapping("/movie")
	public String getMovie (@RequestParam("MovieInfo_no") int MovieInfo_no, CategoryListVO cateList, Model model) {
		model.addAttribute("movie", service.read(MovieInfo_no));
		model.addAttribute("cateList", service.getCategory(MovieInfo_no));
		model.addAttribute("rateList", service.rateList(MovieInfo_no));
		model.addAttribute("rateCount", service.rateCount(MovieInfo_no));
		model.addAttribute("rateGPA", service.rateGPA(MovieInfo_no));
		return "contents";
	}	
	
	//후기 등록
	@PostMapping("/insertRate")
	public String insertRate (RateVO rate, RedirectAttributes rttr, Model model) {
		service.insertRate(rate);
		rttr.addFlashAttribute("rateResult", rate.getMovieInfo_no());
		
		return "redirect:/movie" + rate.getListLink();		
	}	
	//후기 중복검사
	@ResponseBody
	@PostMapping("/rateChk")
	public String rateChk(String User_id, int MovieInfo_no) throws Exception{
		
		int result = service.rateChk(User_id, MovieInfo_no);
		
		if (result == 0) {
			return "success";
		} else {
			return "fail";
		}
	}
}
