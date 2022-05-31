package com.last.mapper;

import java.util.List;

import com.last.domain.ProductAttachVO;

public interface ProductAttachMapper {

	public void insert(ProductAttachVO vo);
    public void delete(String uuid);
    public List<ProductAttachVO> findByProID(Long proID);
    public List<ProductAttachVO> getOldFiles();
    public void deleteAll(Long proID);
}
