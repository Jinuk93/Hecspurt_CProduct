package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.domain.CartVO;
import com.last.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	@Override
	public int register(CartVO cart) {
		log.info("register : "+cart.getCID());
		return mapper.insertSelectKey(cart);
	}

	@Override
	public int modify(CartVO cart) {
		log.info("modify : "+cart);
		return mapper.update(cart);
	}

	@Override
	public int remove(int cartID) {
		log.info("remove : "+cartID);
		return mapper.delete(cartID);
	}

	@Override
	public List<CartVO> getListByID(String userID) {
		log.info("getList Cart!");
		return mapper.getListByID(userID);
	}

	@Override
	public CartVO get(CartVO vo) {
		log.info("get one!");
		return mapper.get(vo);
	}

	

}
