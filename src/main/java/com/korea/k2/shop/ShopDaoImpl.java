package com.korea.k2.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDaoImpl implements ShopDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<MemberVO> selectAll(MemberVO vo) {

		return mybatis.selectList("ShopDao.SELECTALL", vo);
	}

	@Override
	public void shopForm(MemberVO vo) {
		mybatis.insert("ShopDao.SHOPFORM", vo);
	}

	@Override
	public int custNo() {

		return mybatis.selectOne("ShopDao.CUSTNO");
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {

		return mybatis.selectOne("ShopDao.SELECTONE", vo);
	}

	@Override
	public void shopUpdate(MemberVO vo) {
		mybatis.update("ShopDao.UPDATE", vo);
	}

	@Override
	public List<MoneyVO> shopMoney() {

		return mybatis.selectList("ShopDao.SELECTMONEY");
	}

	@Override
	public String idCk(MemberVO vo) {

		return mybatis.selectOne("ShopDao.IDCK", vo);
	}

}
