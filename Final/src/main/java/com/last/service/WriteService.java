package com.last.service;
  
import org.springframework.security.core.userdetails.User;

import com.last.domain.UserVO;
  
public interface WriteService {
  
	public Integer register(UserVO userVO);
	
	public UserVO existID(UserVO userVO);
  }
 