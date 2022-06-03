package com.last.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.domain.UserVO;
import com.last.mapper.WriteMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
//@AllArgsConstructor
public class WriteServiceImpl implements WriteService{
	@Autowired
	private WriteMapper writeMapper;
	
	@Override
	public UserVO existID(UserVO userVO) {
		return writeMapper.existID(userVO);
	}

	@Override
	public Integer register(UserVO userVO) {
		return writeMapper.register(userVO);
	}
}