package com.Moviemoving.mapper;

import com.Moviemoving.domain.AuthVO;
import com.Moviemoving.domain.UserVO;

public interface UserMapper {

	// 계정추가
	public int insertUser(UserVO vo);

	// 계정추가시 권한 추가
	public void insertAuth(AuthVO avo);

	// 데이터 읽기
	public UserVO read(String user_id);

	// 테이터 삭제 (회원탈퇴)
	public int delete(UserVO vo);

	// 테이터 삭제 (회원탈퇴 권한)
	public int deleteAuth(AuthVO avo);

	// 비밀번호 수정
	public int modifyPw(UserVO vo);

}
