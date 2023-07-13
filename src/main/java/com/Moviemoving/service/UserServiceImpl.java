package com.Moviemoving.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Moviemoving.domain.AuthVO;
import com.Moviemoving.domain.UserVO;
import com.Moviemoving.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;

	@Override
	@Transactional
	public boolean insertUser(UserVO vo) {
		int cnt = mapper.insertUser(vo);
		
		AuthVO avo = new AuthVO();
		avo.setUser_id(vo.getUser_id());
		avo.setAuthorities_auth("ROLE_MEMBER");
		mapper.insertAuth(avo);
		return cnt==1;
	}

	@Override
	public UserVO read(String user_id) {
		return mapper.read(user_id);
	}

	//회원탈퇴 비밀번호 체크
	@Override
	public boolean delete(UserVO vo, String inputPassword) {
		UserVO userinfo = mapper.read(vo.getUser_id());
		
		log.info(inputPassword);
		log.info(vo);
		if (encoder.matches(inputPassword, userinfo.getUser_pw())) {
			return delete(vo);
		}

		return false;
	}
	
	//회원탈퇴 비밀번호 체크 성공시 탈퇴처리
	@Override
	public boolean delete(UserVO vo) {
		
		//회원 삭제 
		int cnt = mapper.delete(vo);
		
		AuthVO avo = new AuthVO();
		avo.setUser_id(vo.getUser_id());
		mapper.deleteAuth(avo);
		
		return cnt ==1;
	}

	@Override
	public boolean modifyPw(UserVO vo, String oldPassword) {
		UserVO userinfo = mapper.read(vo.getUser_id());
		
		if (encoder.matches(oldPassword, userinfo.getUser_pw())) {
			
			return modifyPw(vo);
		}
		
		
		return false;
	}

	@Override
	public boolean modifyPw(UserVO vo) {
		vo.setUser_pw(encoder.encode(vo.getUser_pw()));

		int cnt = mapper.modifyPw(vo);

		return cnt == 1;
	}





	
	
}
