package com.korea.k2.cart;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderOneVO {
	private int    orderG;
	private Date   getDate;
	private String custname;
	private String zipcode;
	private String address;
	private String address2;
	private int    idx;
	private int    productId;
	private String productName;
	private int    productPrice;
	private int    amount;
	private int    baesongbi;
	private int    totalMoney;
	private String phone;
	private String productImgStr;
}
