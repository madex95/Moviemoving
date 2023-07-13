package com.Moviemoving.controller;

import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Moviemoving.security.domain.CustomUser;
import com.Moviemoving.domain.UserVO;
import com.Moviemoving.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UserController {

	@Autowired 
    private BCryptPasswordEncoder pwEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	//회원가입
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerup() {
		log.info(" register method");
	}
	
	@PostMapping("/register")
	public String registerPost(UserVO vo, RedirectAttributes rttr) {
	
		log.info(vo);
		String inputPass = vo.getUser_pw();
		String pw = pwEncoder.encode(inputPass);
		vo.setUser_pw(pw);
		boolean ok = service.insertUser(vo);

		if (ok) {
			return "redirect:/";
		} else {
			return "redirect:/#";
		}
		/*
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/#";
			}else if(result == 0) {
				service.insertUser(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
		*/
	}
	
	//아이디 중복 확인
	@GetMapping("/overlap")
	@ResponseBody
	public ResponseEntity<String> duplicate(String id) {
		log.info("duplicate method");

		UserVO vo = service.read(id);

		if (vo == null) {
			return new ResponseEntity<>("1", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("0", HttpStatus.OK);
		}

	}
	
	//로그인
	@RequestMapping("/login")
	public void loginInput(String error, Model model) {
		log.info("error: " + error);
		
		if(error != null) {
			model.addAttribute("error", "Login error! check account");
		}
		
		
	}
	
	//회원탈퇴 
	@PostMapping("/delete")
	@PreAuthorize("isAuthenticated()")
	public String remove(UserVO vo, HttpServletRequest req, String inputPassword, Principal principal) throws ServletException{
		vo.setUser_id(principal.getName());
		
		log.info(vo);
		log.info(inputPassword);
		boolean ok = service.delete(vo,inputPassword);
		
		if(ok) {
			log.info("탈퇴성공  ");
			req.logout();
			return "redirect:/";
		}else {
			log.info("탈퇴실패 ");
			return "redirect:/mypage#";
		}
	}
	
	//비밀번호 수정하기 
	@PostMapping("/modifypw")
	@PreAuthorize("isAuthenticated()")
	public String modifyPw(UserVO vo,Principal principal, RedirectAttributes rttr, Authentication auth) {
		
		vo.setUser_id(principal.getName());
		
		boolean ok =service.modifyPw(vo);
		if(ok) {
			// session의 authentication 을 수정
			CustomUser user = (CustomUser) auth.getPrincipal();
			user.setUser(service.read(principal.getName()));
			rttr.addFlashAttribute("qweasd", "비밀번호을 수정했습니다 :) ");
			log.info("비밀번호 수정성공 ! ");
		}else {
			log.info("비밀번호 수정실패 ! ");
		}
		
		
		return "redirect:/mypage";
		
	}
	
	
}
