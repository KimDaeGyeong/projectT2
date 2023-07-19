package com.korea.k2.cart;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderMoneyVO {
	private int  idx;
	private int  Ocustno;	
	private int  baesongbi;
	private int  totalMoney;
	private Date getDate;

//	private int    orderG;
//	private String productName;
//	private int productPrice;
//	private int amount;
//	private int total;
//	private String productImgStr;
}
