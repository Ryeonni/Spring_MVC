package com.ryeonni.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Override
	public String idCheck(UserVO vo) {
		return dao.idCheck(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}
	
	@Override
	public void insert(UserVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(UserVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void delete(UserVO vo) {
		dao.delete(vo);
	}

	@Override
	public UserVO userOne(UserVO vo) {
		return dao.userOne(vo);
	}

	@Override
	public List<UserVO> userAll() {
		return dao.userAll();
	}

}
