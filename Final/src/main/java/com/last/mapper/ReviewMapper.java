package com.last.mapper;

import java.util.List;

import com.last.domain.ReviewVO;

public interface ReviewMapper {
	public int insert(ReviewVO vo);
	public ReviewVO read(int rno);
	public int delete(int rno);
	public int update(ReviewVO review);
	public List<ReviewVO> getListByProId(int proId);
}
