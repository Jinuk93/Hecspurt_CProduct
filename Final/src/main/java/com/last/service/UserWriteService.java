package com.last.service;

import com.last.domain.UserVO;

public interface UserWriteService {

	public UserVO writeEmailCheck(UserVO memberDTO); //회원가입 이메일 체크
	public UserVO writeIdCheck(String id);	//회원가입 아이디 체크
	public void write(UserVO memberDTO); // 회원가입
}
