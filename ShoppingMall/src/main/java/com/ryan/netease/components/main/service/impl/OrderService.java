package com.ryan.netease.components.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryan.netease.components.main.dao.IOrderDao;
import com.ryan.netease.components.main.service.face.IOrderService;

@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private IOrderDao orderDao;

	@Override
	public void buyGoods(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.orderDao.buyGoods(params);
	}

	@Override
	public List<Map<String, Object>> findGoodsWithoutPay(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.orderDao.findGoodsWithoutPay(params);
	}

	@Override
	public void payGoods(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.orderDao.payGoods(params);
	}

	@Override
	public List<Map<String, Object>> findPayedGoods(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.orderDao.findPayedGoods(params);
	}

}
