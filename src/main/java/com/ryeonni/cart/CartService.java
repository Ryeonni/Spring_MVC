package com.ryeonni.cart;

import java.util.List;

public interface CartService {
	void insert(CartVO vo);
	void update(CartVO vo);
	void delete(CartVO vo);
	void deleteAll(CartVO vo); 

	List<CartVO> cartAll(CartVO vo); 
	int totalCart(String userId);
	int countCart(int productIdx, String userId);
	void updateCart(CartVO vo);
	int userCart(CartVO vo);
	
	void insertOrder(CartVO vo);
	List<CartVO> userSales();
}
