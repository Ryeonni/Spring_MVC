package com.ryeonni.user;

import java.util.List;

public interface UserDAO {
	String idCheck(UserVO vo);
	void insert(UserVO vo);
	void update(UserVO vo);
	void delete(UserVO vo);
	
	UserVO login(UserVO vo);
	UserVO userOne(UserVO vo);
	List<UserVO> userAll();
}
