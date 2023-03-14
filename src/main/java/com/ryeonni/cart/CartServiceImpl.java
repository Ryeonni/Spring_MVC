package com.ryeonni.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	@Override
	public void insert(CartVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(CartVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(CartVO vo) {
		dao.delete(vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		dao.deleteAll(vo);
	}

	@Override
	public List<CartVO> cartAll(CartVO vo) {
		return dao.cartAll(vo);
	}

	@Override
	public int totalCart(String userId) {
		return dao.totalCart(userId);
	}

	@Override
	public int countCart(int productIdx, String userId) {
		return dao.countCart(productIdx, userId);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}

	@Override
	public int userCart(CartVO vo) {
		return dao.userCart(vo);
	}

	@Override
	public void insertOrder(CartVO vo) {
		dao.insertOrder(vo);
	}

	@Override
	public List<CartVO> userSales() {
		return dao.userSales();
	}

}
