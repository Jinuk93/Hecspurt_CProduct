package com.last.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.domain.UserVO;
import com.last.mapper.LoginMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
//@AllArgsConstructor
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginMapper loginMapper;

	@Override
	 public boolean loginCheck(UserVO vo, HttpSession session) {
        boolean result = loginMapper.loginCheck(vo);
        System.out.println("result : " + result+ "\n" + vo + "\n");
        if (result) { // true�씪 寃쎌슦 �꽭�뀡�뿉 �벑濡�
        	UserVO vo2 = loginMapper.viewMember(vo);
        	System.out.println("uservo2" + vo2);
            // �꽭�뀡 蹂��닔 �벑濡�
            session.setAttribute("userID", vo2.getUserID());
            session.setAttribute("uName", vo2.getUName());
        }      
        return result;
    }

	@Override
	public UserVO viewMember(UserVO vo) {
		return null;
	}
}