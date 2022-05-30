package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoginDAO;
import com.last.domain.UserVO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAO loginDAO;
	@Override
	public UserVO login(UserVO memberDTO) {
		return loginDAO.login(memberDTO);
	}
	@Override
	public UserVO loginEmailCheck(UserVO memberDTO) {
		return loginDAO.loginEmailCheck(memberDTO);
	}
	@Override
	public UserVO findIdQna(UserVO memberDTO) {
		return loginDAO.findIdQna(memberDTO);
	}
	@Override
	public UserVO loginIdCheck(String id) {
		return loginDAO.loginIdCheck(id);
	}
	@Override
	public void findPwdUpdate(UserVO memberDTO) {
		loginDAO.findPwdUpdate(memberDTO);
	}
	@Override
	public void kakaoWrite(UserVO memberDTO) {
		loginDAO.kakaoWrite(memberDTO);	
	}
	@Override
	public void loginTime(String id) {
		loginDAO.loginTime(id);
	}
}