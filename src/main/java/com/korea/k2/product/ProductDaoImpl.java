package com.korea.k2.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(ProductVO vo) {
		mybatis.insert("Product.INSERT", vo);
	}

	@Override
	public List<ProductVO> selectAll(ProductVO vo) {
		
		return mybatis.selectList("Product.SELECTALL");
	}

	@Override
	public ProductVO selectOne(ProductVO vo) {

		return mybatis.selectOne("Product.SELECTONE", vo);
	}

	@Override
	public void delete(ProductVO vo) {
		mybatis.delete("Product.DELETE", vo);
	}

}
