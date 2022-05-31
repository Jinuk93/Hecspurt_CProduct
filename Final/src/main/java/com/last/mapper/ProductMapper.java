package com.last.mapper;

import java.util.List;

import com.last.domain.Criteria;
import com.last.domain.ProductVO;

public interface ProductMapper {
public List<ProductVO> getList();
	
	public void insert(ProductVO product);

	public void insertSelectKey(ProductVO product);

	public ProductVO read(long l);

	public int delete(long l);

	public int update(ProductVO product);
	
	public int getTotalCount(Criteria cri);

	public List<ProductVO> getListWithSearch(Criteria cri);

}
