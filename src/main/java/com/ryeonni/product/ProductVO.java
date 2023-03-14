package com.ryeonni.product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	private int productIdx; 
	private String productName;
	private int price;
	private int size;
	private String description;
	private MultipartFile img; 
	private String productImgStr; 
	private Date regdate;
	private int cnt;
	
	private String searchCondition; 
	private String searchKeyword;
	
	private int rownum;
	private int rnum;
	private int pageSize; 
	private int pageListSize; 
	private int total;
	private int totalPage;
	private int start;
	private int nowPage; 
	private int listStartPage; 
	private int listEndPage;
	private int endPage;
}
