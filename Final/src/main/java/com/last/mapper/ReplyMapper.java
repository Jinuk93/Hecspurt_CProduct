package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.last.domain.ReplyVO;


public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public int delete(Long rid);
	public int update(ReplyVO content); 
	public ReplyVO read(Long rid);
	public List<ReplyVO> getListByProID(@Param("proID")Long proID);
}
