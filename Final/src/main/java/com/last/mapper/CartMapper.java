package com.last.mapper;

import java.util.List;

import com.last.domain.CartVO;

public interface CartMapper {
	public List<CartVO> getListByID(String userID);
	public void insert(CartVO cart);
	public int insertSelectKey(CartVO cart);
	public int delete(int l);
	public int update(CartVO product);
	public CartVO get(CartVO vo);
}
