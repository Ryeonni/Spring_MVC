package com.ryeonni.cart;

import lombok.Data;

@Data
public class CartVO {
	private int cartIdx;
	private String userId;
	private String name;
	private int productIdx;
	private String productName;
	private int price;     //상품단가
	private int amount;
	private int sumPrice;  //상품총금액(상품수량*상품단가)
}
