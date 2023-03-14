package com.ryeonni.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardIdx;
	private String writer;
	private String title;
	private String content;
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
