package com.ryeonni.product;

import java.util.List;

public interface ProductDAO {
	void insert(ProductVO vo);
	void update(ProductVO vo);
	void delete(ProductVO vo);
	
	int cnt(ProductVO vo);
	int productTotal(ProductVO vo);
	
	ProductVO productOne(ProductVO vo);
	List<ProductVO> productAll(ProductVO vo); 
}
