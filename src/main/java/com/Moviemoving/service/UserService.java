package com.Moviemoving.service;

import com.Moviemoving.domain.UserVO;

public interface UserService {
	public boolean insertUser(UserVO vo);

	public UserVO read(String user_id);
	
	//데이터 삭제 
	boolean delete(UserVO vo);
	boolean delete(UserVO vo, String inputPassword);

	//비밀번호 변경
	boolean modifyPw(UserVO vo, String oldPassword);
	boolean modifyPw(UserVO vo);
	
}
