package com.ryeonni.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(ProductVO vo) {
		mybatis.insert("ProductDAO.insert", vo);
	}

	@Override
	public void update(ProductVO vo) {
		mybatis.update("ProductDAO.update", vo);
	}

	@Override
	public int cnt(ProductVO vo) {
		return mybatis.update("ProductDAO.cnt", vo);
	}
	
	@Override
	public void delete(ProductVO vo) {
		mybatis.delete("ProductDAO.delete", vo);
	}
	
	@Override
	public ProductVO productOne(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.productOne", vo);
	}
	
	@Override
	public List<ProductVO> productAll(ProductVO vo) {
		return mybatis.selectList("ProductDAO.productAll", vo);
	}
	
	@Override
	public int productTotal(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.productTotal", vo);
	}

}
