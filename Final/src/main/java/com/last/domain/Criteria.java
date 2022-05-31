package com.last.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
public class Criteria {
	private String type;
	private String keyword;
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
	public Criteria() {
		// TODO Auto-generated constructor stub
	}
}
