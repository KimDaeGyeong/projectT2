package com.korea.k2.cart;

import lombok.Data;

@Data
public class CartVO {
	private int cartId;
	private int custno;
	private int productId;
	private int amount;
	
	private String productName;
	private int productPrice;
	private String productImgStr;
}
