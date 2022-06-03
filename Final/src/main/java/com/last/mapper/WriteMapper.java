package com.last.mapper;
 
import java.util.List;

import com.last.domain.UserVO;
 
public interface WriteMapper {

	public Integer register(UserVO userVO);
	
	public UserVO existID(UserVO userVO);
}
 