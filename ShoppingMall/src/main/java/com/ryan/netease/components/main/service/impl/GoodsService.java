package com.ryan.netease.components.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryan.netease.components.main.dao.IGoodsDao;
import com.ryan.netease.components.main.domain.Goods;
import com.ryan.netease.components.main.service.face.IGoodsService;

@Service
public class GoodsService implements IGoodsService {
	
	@Autowired
	private IGoodsDao goodsDao;

	@Override
	public List<Map<String, Object>> findGoods(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.goodsDao.findGoods(params);
	}

	@Override
	public List<Map<String, Object>> findGoodsBySellerId(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.goodsDao.findGoodsBySellerId(params);
	}

	@Override
	public void deleteGoodsById(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.goodsDao.deleteGoodsById(params);
		
	}

	@Override
	public void updateGoodsById(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.goodsDao.updateGoodsById(params);
	}

	@Override
	public int insertGoodsPic(Goods goods) {
		// TODO Auto-generated method stub
		return this.goodsDao.insertGoodsPic(goods);
	}

	@Override
	public void insertGoods(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.goodsDao.insertGoods(params);
	}

	@Override
	public List<Map<String, Object>> findGoodsWithMarked(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.goodsDao.findGoodsWithMarked(params);
	}

}
