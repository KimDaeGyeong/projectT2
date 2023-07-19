package com.korea.k2.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("Cart.INSERT", vo);
	}

	@Override
	public void deleteOne(CartVO vo) {
		mybatis.delete("Cart.DELETEONE", vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		mybatis.delete("Cart.DELETEALL", vo);
	}
	
	@Override
	public List<CartVO> selectAll(CartVO vo) {
		
		return mybatis.selectList("Cart.SELECTALL", vo);
	}

	@Override
	public void update(CartVO vo) {
		mybatis.update("Cart.UPDATE", vo);
	}

	@Override
	public void insertOrderJumunseo(OrderJumunseoVO vo) {
		mybatis.insert("Cart.OrderJumunseo", vo);
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		mybatis.insert("Cart.OrderMoney", vo);
	}

	@Override
	public int orderG(OrderMoneyVO vo) {

		return mybatis.selectOne("Cart.OrderG", vo);
	}

	@Override
	public List<OrderMoneyVO> orderSelectAll(OrderMoneyVO vo) {
		
		return mybatis.selectList("Cart.OrderSelectAll", vo);
	}

	@Override
	public List<OrderOneVO> orderSelectOne(OrderOneVO vo) {

		return mybatis.selectList("Cart.OrderSelectOne", vo);
	}

}
