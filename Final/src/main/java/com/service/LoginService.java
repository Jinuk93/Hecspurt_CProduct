package com.service;

import com.last.domain.UserVO;

public interface LoginService {

	public UserVO login(UserVO memberDTO);

	public UserVO loginEmailCheck(UserVO memberDTO);

	public UserVO findIdQna(UserVO memberDTO);

	public UserVO loginIdCheck(String id);

	public void findPwdUpdate(UserVO memberDTO);

	public void kakaoWrite(UserVO memberDTO);

	public void loginTime(String id);

}
