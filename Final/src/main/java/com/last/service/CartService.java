package com.last.service;

import java.util.List;

import com.last.domain.CartVO;

public interface CartService {
	public int register(CartVO cart);
	public int modify(CartVO cart);
	public int remove(int cartID);
	public List<CartVO> getListByID(String userID);
	public CartVO get(CartVO vo);
}
