package com.ryeonni.board;

import java.util.List;

public interface BoardDAO {
	void insert(BoardVO vo);
	void update(BoardVO vo);
	void delete(BoardVO vo);
	
	int cnt(BoardVO vo);
	int boardTotal(BoardVO vo);
	
	BoardVO boardOne(BoardVO vo);
	List<BoardVO> boardAll(BoardVO vo); 
}
