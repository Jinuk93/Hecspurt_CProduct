package com.last.service;

import java.util.List;

import com.last.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	public ReplyVO get(Long rid);
	public int modify(ReplyVO vo);
	public int remove(Long rid);
	public List<ReplyVO> getListByProID(Long proID);

}
