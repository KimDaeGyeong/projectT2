package com.korea.k2.product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	private int           productId;     // 상품번호
	private String        productName;   // 상품이름
	private int           productPrice;  // 상품가격
	private String        productDesc;   // 상품설명
	private MultipartFile productImg;    // 상품사진파일
	private String        productImgStr; // 파일명
	private Date          productDate;   // 등록일
}
