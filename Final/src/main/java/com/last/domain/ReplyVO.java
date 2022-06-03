package com.last.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rid;
	private Long proID;
	private String userid;
	private String content;
	private Date regDate;
	private Date updateDate;
	private Long rscore;
	}