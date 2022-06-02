package com.last.service;

import java.util.List;

import com.last.domain.Criteria;
import com.last.domain.ProductAttachVO;
import com.last.domain.ProductVO;

public interface ProductService {

	public void register(ProductVO product);
	public int register2(ProductVO product);
	public ProductVO get(Long proID);
	public boolean modify(ProductVO product);
	public boolean remove(Long proID);
	public List<ProductVO> getList();
	int getTotal(Criteria cri);
	List<ProductAttachVO> getAttachList(Long proID);
	
	List<ProductAttachVO> getAttachALL();

}
