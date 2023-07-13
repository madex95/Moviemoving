package com.Moviemoving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Moviemoving.domain.MovieVO;
import com.Moviemoving.domain.UserVO;
import com.Moviemoving.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;

	public void register(MovieVO Movie) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(Movie);
	}

	@Override
	public MovieVO get(int MovieInfo_no) {
		// TODO Auto-generated method stub
		return mapper.read(MovieInfo_no);
	}

	@Override
	public boolean modify(MovieVO movie) {
		// TODO Auto-generated method stub
		return mapper.update(movie) == 1;
	}

	@Override
	public boolean remove(int MovieInfo_no) {
		// TODO Auto-generated method stub
		return mapper.delete(MovieInfo_no) == 1;
	}

	@Override
	public List<MovieVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	// 회원관리
	@Override
	public List<UserVO> getUserList() {

		return mapper.getUserList();
	}

	@Override
	public Boolean delete_user(String user_id) {

		return mapper.delete_user(user_id) == 1;
	}

	@Override
	public Boolean delete_auth(String user_id) {

		return mapper.delete_auth(user_id) == 1;
	}

	@Override
	public Boolean modify_user(UserVO uservo) {
		return mapper.update_user(uservo) == 1;
	}
}
