package com.Moviemoving.service;

import java.util.List;

import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.UserVO;

public interface AdminService {
	// admin 등록
	public void register(MovieVO Movie);
	// admin 영화상세
	public MovieVO get(int MovieInfo_no);
	// admin 수정
	public boolean modify(MovieVO movie);
	// admin 삭제
	public boolean remove(int MovieInfo_no);
	// admin 목록
	public List<MovieVO> getList();
	
	//회원관리
	public List<UserVO> getUserList();	
	public Boolean delete_user(String user_id);	
	public Boolean delete_auth(String user_id);	
	public Boolean modify_user(UserVO uservo);

}
