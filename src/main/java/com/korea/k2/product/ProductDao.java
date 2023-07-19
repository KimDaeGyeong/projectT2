package com.korea.k2.product;

import java.util.List;

public interface ProductDao {
	void insert(ProductVO vo);
	List<ProductVO> selectAll(ProductVO vo);
	ProductVO selectOne(ProductVO vo);
	void delete(ProductVO vo);
}
