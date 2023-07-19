package com.korea.k2.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDao dao;
	
	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		
		return dao.selectAll(vo);
	}

	@Override
	public void shopForm(MemberVO vo) {
		dao.shopForm(vo);
	}

	@Override
	public int custNo() {
		
		return dao.custNo();
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {

		return dao.selectOne(vo);
	}

	@Override
	public void shopUpdate(MemberVO vo) {
		dao.shopUpdate(vo);
	}

	@Override
	public List<MoneyVO> shopMoney() {

		return dao.shopMoney();
	}

	@Override
	public String idCk(MemberVO vo) {

		return dao.idCk(vo);
	}

}
