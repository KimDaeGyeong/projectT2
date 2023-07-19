package com.korea.k2.shop;

import java.sql.Date;

import lombok.Data;

@Data
public class MoneyVO {
	private int custno;
	private String custname;
	private String grade;
	
	private int salenol;
	private int pcost;
	private int amount;
	private int price;
	private String pcode;
	private Date sdate;
	
	private int total;
}
