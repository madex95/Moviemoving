package com.Moviemoving.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.Moviemoving.domain.UserVO;
import com.Moviemoving.mapper.UserMapper;
import com.Moviemoving.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		UserVO vo = userMapper.read(user_id);

		log.warn("load user by user_id : " + user_id);

		return vo == null ? null : new CustomUser(vo);
	}

}
