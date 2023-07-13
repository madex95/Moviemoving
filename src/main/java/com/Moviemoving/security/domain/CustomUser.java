package com.Moviemoving.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.Moviemoving.domain.UserVO;

import lombok.Getter;
import lombok.Setter;

public class CustomUser extends User {

	//User 정보를 꺼내서 볼수있게 
	@Getter
	@Setter
	private UserVO user;

	public CustomUser(String user_id, String user_pw, Collection<? extends GrantedAuthority> authorities_auth) {
		super(user_id, user_pw, authorities_auth);
	}

	public CustomUser(UserVO vo) {
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthorities_auth()))
				.collect(Collectors.toList()));
		
		this.user = vo;
	}
}
