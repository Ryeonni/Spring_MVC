package com.ryeonni.user;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String tel;
	private String addr1;
	private String addr2;
	private String addr3;
	private String email;
	private Date regdate;
}
