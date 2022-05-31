package com.last.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data

public class ProductVO {
	private Long proID;
	private String pname;
	private Long unitprice;
	private int stock;
	private String category;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String userID;
	private List<ProductAttachVO> attachList;
}
