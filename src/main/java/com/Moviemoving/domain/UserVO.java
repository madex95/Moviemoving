package com.Moviemoving.domain;

import java.util.List;


import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	
	private List<AuthVO> authList;
	private AuthVO auth;	
}
