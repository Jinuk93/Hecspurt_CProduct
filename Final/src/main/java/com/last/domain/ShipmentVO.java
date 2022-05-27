package com.last.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ShipmentVO {
	private int sID;
	private String userID;
	private int cID;
	private String reciver;
	private String sAddress;
	private String sTell;
	private String sEmail;
	private Date pDate;
	private Date sDate;
}
