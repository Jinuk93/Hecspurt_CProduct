package com.last.domain;

import lombok.Data;

@Data
public class ProductAttachVO {
	private String fileName;
	private String uuid;
	private String uploadPath;
	private boolean fileType;
	private Long proID;
}
