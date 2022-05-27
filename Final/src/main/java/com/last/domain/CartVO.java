package com.last.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cID;
	private String UserID;
	private int proID;
	private int amount;
}
