package com.ryan.netease.components.main.domain;

public class User {
	private int id;
	//用户名
	private String username;
	//密码
	private String password;
	//角色：   1表示买家  2表示卖家
	private int type;
	
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public int getType() {
		return type;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
