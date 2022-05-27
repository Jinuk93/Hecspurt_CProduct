package com.last.domain;

import java.sql.Date;

import lombok.Data;

@Data

public class ProductVO {
	private int proID;
	private String pName;
	private Long unitPrice;
	private int stock;
	private String category;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String userID;
}
