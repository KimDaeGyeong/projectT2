package com.korea.k2.shop;

import java.util.List;

public interface ShopService {
	List<MemberVO> selectAll(MemberVO vo);
	void shopForm(MemberVO vo);
	int custNo();
	MemberVO selectOne(MemberVO vo);
	void shopUpdate(MemberVO vo);
	
	List<MoneyVO> shopMoney();
	
	String idCk(MemberVO vo);
}
