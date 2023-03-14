package com.ryeonni.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insert(BoardVO vo) {
		mybatis.insert("BoardDAO.insert", vo);
	}

	@Override
	public void update(BoardVO vo) {
		mybatis.update("BoardDAO.update", vo);
	}

	@Override
	public void delete(BoardVO vo) {
		mybatis.delete("BoardDAO.delete", vo);
	}

	@Override
	public int cnt(BoardVO vo) {
		return mybatis.update("BoardDAO.cnt", vo);
	}

	@Override
	public int boardTotal(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.boardTotal", vo);
	}
	
	@Override
	public BoardVO boardOne(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.boardOne", vo);
	}

	@Override
	public List<BoardVO> boardAll(BoardVO vo) {
		return mybatis.selectList("BoardDAO.boardAll", vo);
	}

}
