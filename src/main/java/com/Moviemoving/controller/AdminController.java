package com.Moviemoving.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.UserVO;
import com.Moviemoving.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	private AdminService service;

	// admin
	@GetMapping("/movieList")
	public void list(Model model) {
		model.addAttribute("movieList", service.getList());
	}

	// admin 등록
	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(MovieVO movie, RedirectAttributes rttr) {
		service.register(movie);
		rttr.addFlashAttribute("result", movie.getMovieInfo_no());
		return "redirect:/admin/movieList";
	}

	// admin 상세보기
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("MovieInfo_no") int MovieInfo_no, Model model) {
		log.info("/get or modify");
		model.addAttribute("getList", service.get(MovieInfo_no));
	}

	@PostMapping("/modify")
	public String modify(MovieVO movie, RedirectAttributes rttr) {
		log.info("수정");
		if (service.modify(movie)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/movieList";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("MovieInfo_no") int MovieInfo_no, RedirectAttributes rttr) {
		log.info("삭제");
		if (service.remove(MovieInfo_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/movieList";
	}
	
	
	@GetMapping("/userList")
	public void getList(Model model) {
		model.addAttribute("userList", service.getUserList());
	}
	
	@PostMapping("/userList/remove")
	public String remove(@RequestParam("user_id") String user_id, RedirectAttributes rttr) {
		
		log.info("데이터는 들어왔니? : " + user_id);
		
		//user테이블의 정보와 auth 테이블의 권한 모두 삭제
		service.delete_user(user_id);
		service.delete_auth(user_id);
		
		return "redirect:/admin/userList";
	
	}
	@PostMapping("/userList/modify")
	public String modify(UserVO uservo, RedirectAttributes rttr) {
		
		log.info("modify:" + uservo.getUser_id());
		log.info("modify:" + uservo.getUser_name());
		
		service.modify_user(uservo);

		return "redirect:/admin/userList";
	}
}
