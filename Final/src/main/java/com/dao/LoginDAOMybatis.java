package com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.last.domain.UserVO;

@Repository 
@Transactional
public class LoginDAOMybatis implements LoginDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public UserVO login(UserVO memberDTO) {
		return sqlSession.selectOne("loginSQL.login", memberDTO);
	}
	@Override
	public UserVO loginEmailCheck(UserVO memberDTO) {
		return sqlSession.selectOne("loginSQL.loginEmailCheck", memberDTO);
	}
	@Override
	public UserVO findIdQna(UserVO memberDTO) {
		return sqlSession.selectOne("loginSQL.findIdQna", memberDTO);
	}
	@Override
	public UserVO loginIdCheck(String id) {
		return sqlSession.selectOne("loginSQL.loginIdCheck", id);
	}
	@Override
	public void findPwdUpdate(UserVO memberDTO) {
		sqlSession.update("loginSQL.findPwdUpdate", memberDTO);
	}
	@Override
	public void kakaoWrite(UserVO memberDTO) {
		sqlSession.insert("loginSQL.kakaoWrite", memberDTO);
	}
	@Override
	public void loginTime(String id) {
		sqlSession.update("loginSQL.loginTime", id);
	}
}
