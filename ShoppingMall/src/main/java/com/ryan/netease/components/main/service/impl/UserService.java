package com.ryan.netease.components.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryan.netease.components.main.dao.IUserDao;
import com.ryan.netease.components.main.service.face.IUserService;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private IUserDao userDao;
	
	@Override
	public Map<String, Object> getUser(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.userDao.getUser(params);
	}

	@Override
	public List<Map<String, Object>> getGoodsByUser(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.userDao.getGoodsByUser(params);
	}
	
	
	
}
