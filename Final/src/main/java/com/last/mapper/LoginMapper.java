package com.last.mapper;
 
import java.util.List;

import com.last.domain.UserVO;
 
public interface LoginMapper {

	// 01_01. 회원 로그인 체크
    public boolean loginCheck(UserVO vo);
    // 01_02. 회원 로그인 정보
    public UserVO viewMember(UserVO vo);
   
}
 