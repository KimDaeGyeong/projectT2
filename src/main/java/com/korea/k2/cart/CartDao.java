package com.korea.k2.cart;

import java.util.List;

public interface CartDao {
	void insert(CartVO vo);
	void deleteOne(CartVO vo);
	void deleteAll(CartVO vo);
	void update(CartVO vo);
	List<CartVO> selectAll(CartVO vo); // 장바구니 목록보기 
	
	void insertOrderJumunseo(OrderJumunseoVO vo);       // 주문서 저장하기
	void insertOrderMoney(OrderMoneyVO vo);             // 주문금액 저장하기
	int orderG(OrderMoneyVO vo);                        // 주문그룹 추가하기
	List<OrderMoneyVO> orderSelectAll(OrderMoneyVO vo); // 주문목록 보기
	List<OrderOneVO> orderSelectOne(OrderOneVO vo);     // 주문목록 상세보기
}
