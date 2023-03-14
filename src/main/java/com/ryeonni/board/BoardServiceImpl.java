package com.ryeonni.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void insert(BoardVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(BoardVO vo) {
		dao.delete(vo);
	}

	@Override
	public int cnt(BoardVO vo) {
		return dao.cnt(vo);
	}

	@Override
	public int boardTotal(BoardVO vo) {
		return dao.boardTotal(vo);
	}
	
	@Override
	public BoardVO boardOne(BoardVO vo) {
		return dao.boardOne(vo);
	}

	@Override
	public List<BoardVO> boardAll(BoardVO vo) {
		return dao.boardAll(vo);
	}
}