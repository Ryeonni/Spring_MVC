package com.ryeonni.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("CartDAO.insert", vo);
	}

	@Override
	public void update(CartVO vo) {
		mybatis.update("CartDAO.update", vo);
	}

	@Override
	public void delete(CartVO vo) {
		mybatis.delete("CartDAO.delete", vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		mybatis.delete("CartDAO.deleteAll", vo);
	}

	@Override
	public List<CartVO> cartAll(CartVO vo) {
		return mybatis.selectList("CartDAO.cartAll", vo);
	}

	@Override
	public int totalCart(String userId) {
		return mybatis.selectOne("CartDAO.totalCart", userId);
	}

	@Override
	public int countCart(int productIdx, String userId) {
		CartVO cvo = new CartVO();
		cvo.setProductIdx(productIdx);
		cvo.setUserId(userId);
		return mybatis.selectOne("CartDAO.countCart", cvo);
	}
	
	@Override
	public void updateCart(CartVO vo) {
		mybatis.update("CartDAO.updateCart", vo);
	}

	@Override
	public int userCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.userCart", vo);
	}

	@Override
	public void insertOrder(CartVO vo) {
		mybatis.insert("CartDAO.insertOrder", vo);
	}
	
	@Override
	public List<CartVO> userSales() {
		return mybatis.selectList("CartDAO.userSales");
	}
}
