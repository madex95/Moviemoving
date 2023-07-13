package com.Moviemoving.mapper;

import java.util.List;

import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.UserVO;

public interface AdminMapper {
	// admin 목록
	public List<MovieVO> getList();
	// admin 등록
	public void insertSelectKey(MovieVO movie);
	// admin 영화상세
	public MovieVO read(int MovieInfo_no);
	// admin 수정
	public boolean modify(MovieVO movie);

	// admin 삭제
	public boolean remove(int MovieInfo_no);
	public int update(MovieVO movie);
	public int delete(int movieInfo_no);
	
	
	//회원관리
	public List<UserVO> getUserList();	
	public int delete_user(String user_id);	
	public int delete_auth(String user_id);	
	public int update_user(UserVO uservo);
}
