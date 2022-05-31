package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.domain.Criteria;
import com.last.domain.ProductAttachVO;
import com.last.domain.ProductVO;
import com.last.mapper.ProductAttachMapper;
import com.last.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService{
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper attachMapper;
	
	@Override
	public List<ProductVO> getList() {
		log.info("getList........");
		return mapper.getList();
	}
	@Override
	public void register(ProductVO product) {
		log.info("register¡¦" + product.getProID());
		mapper.insertSelectKey(product);
		if(product.getAttachList()==null||product.getAttachList().size()<=0){
			return ;
		}
		product.getAttachList().forEach(attach -> {
			attach.setProID(product.getProID());
			attachMapper.insert(attach);
		});
	}
		
	@Override
	public ProductVO get(Long proID) {
		log.info("get..." + proID);
		return mapper.read(proID);
	}@Override
	public boolean modify(ProductVO product) {
		log.info("modify......." + product);
		return mapper.update(product)==1;
	}@Override
	public boolean remove(Long proID) {
		log.info("remove......" + proID);
		attachMapper.deleteAll(proID);
		return mapper.delete(proID) == 1;
	}@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	 @Override
	   public List<ProductAttachVO> getAttachList(Long proID){
		   log.info("get Attach list by proID" + proID);
		   return attachMapper.findByProID(proID);
	   }
	 
	 
}


