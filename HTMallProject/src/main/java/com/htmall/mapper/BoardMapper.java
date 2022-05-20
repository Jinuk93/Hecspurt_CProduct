package com.htmall.mapper;

import java.util.List;

import com.htmall.domain.BoardVO;

public interface  BoardMapper {
	//@Select("select * from tbl_board WHERE bno >0")
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public Long insertSelectKey(BoardVO board);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
}
