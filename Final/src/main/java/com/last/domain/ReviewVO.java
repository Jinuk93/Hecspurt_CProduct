package com.last.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int rID;
	private String userID;
	private int proID;
	private int rScore;
	private String content;
	private Date regDate;
	private Date updateDate;
}
