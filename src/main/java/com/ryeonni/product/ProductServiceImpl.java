package com.ryeonni.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;
	
	@Override
	public void insert(ProductVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(ProductVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void delete(ProductVO vo) {
		dao.delete(vo);
	}
	
	@Override
	public ProductVO productOne(ProductVO vo) {
		return dao.productOne(vo);
	}

	@Override
	public List<ProductVO> productAll(ProductVO vo) {
		return dao.productAll(vo);
	}

	@Override
	public int cnt(ProductVO vo) {
		return dao.cnt(vo);
	}

	@Override
	public int productTotal(ProductVO vo) {
		return dao.productTotal(vo);
	}

}
