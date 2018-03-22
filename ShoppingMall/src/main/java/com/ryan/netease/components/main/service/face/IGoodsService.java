package com.ryan.netease.components.main.service.face;

import java.util.List;
import java.util.Map;

import com.ryan.netease.components.main.domain.Goods;

public interface IGoodsService {
	
	/**
	 * 查找商品
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findGoods(Map<String, Object> params);
	
	/**
	 * 根据卖家ID查找商品
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findGoodsBySellerId(Map<String, Object> params);
	
	/**
	 * 根据商品ID删除商品
	 * @param params
	 */
	void deleteGoodsById(Map<String, Object> params);
	
	/**
	 * 根据商品ID更新商品
	 * @param params
	 */
	void updateGoodsById(Map<String, Object> params);
	
	/**
	 * 插入商品图片类型（pic=1），返回id
	 * @param goods
	 * @return
	 */
	int insertGoodsPic(Goods goods);
	
	/**
	 * 插入商品
	 * @param goods
	 * @return
	 */
	void insertGoods(Map<String, Object> params);
	
	/**
	 * 查找所有商品，用户购买的商品增加标记
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findGoodsWithMarked(Map<String, Object> params);
	
}
