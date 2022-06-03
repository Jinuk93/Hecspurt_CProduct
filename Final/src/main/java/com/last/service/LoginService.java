package com.last.service;
  
import javax.servlet.http.HttpSession;

import com.last.domain.UserVO;
  
public interface LoginService {
  
	// 01_01. �쉶�썝 濡쒓렇�씤 泥댄겕
    public boolean loginCheck(UserVO vo, HttpSession session);
    // 01_02. �쉶�썝 濡쒓렇�씤 �젙蹂�
    public UserVO viewMember(UserVO vo);


  }
 