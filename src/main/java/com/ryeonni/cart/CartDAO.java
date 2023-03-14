package com.ryeonni.cart;

import java.util.List;


public interface CartDAO {
	// 1. 장바구니 추가
	void insert(CartVO vo);
	
	// 2. 장바구니 수정
	void update(CartVO vo);
		
	// 3. 장바구니 삭제
	void delete(CartVO vo);

	// 4. 장바구니 전체삭제
	void deleteAll(CartVO vo); 

	// 5. 장바구니 목록조회
	List<CartVO> cartAll(CartVO vo); 
		
	// 6. 장바구니 금액합계
	int totalCart(String userId);

	// 7. 장바구니 동일 상품 레코드 확인
	int countCart(int productIdx, String userId); 

	// 8. 장바구니 상품수량 변경
	void updateCart(CartVO vo);

	// 9. 사용자 장바구니 확인
	int userCart(CartVO vo);

	// 10. 장바구니 주문
	void insertOrder(CartVO vo);
	
	// 11. 구매금액조회
	List<CartVO> userSales();

}
