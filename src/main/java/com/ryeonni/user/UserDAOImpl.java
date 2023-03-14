package com.ryeonni.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public String idCheck(UserVO vo) {
		return mybatis.selectOne("UserDAO.idCheck", vo);
	}
	
	@Override
	public UserVO login(UserVO vo) {
		return mybatis.selectOne("UserDAO.login", vo);
	}
	
	@Override
	public void insert(UserVO vo) {
		mybatis.insert("UserDAO.insert", vo);
	}

	@Override
	public void update(UserVO vo) {
		mybatis.update("UserDAO.update", vo);
	}
	
	@Override
	public void delete(UserVO vo) {
		mybatis.delete("UserDAO.delete", vo);
	}
	
	@Override
	public UserVO userOne(UserVO vo) {
		return mybatis.selectOne("UserDAO.userOne", vo);
	}
	
	@Override
	public List<UserVO> userAll() {
		return mybatis.selectList("UserDAO.userAll");
	}
}
