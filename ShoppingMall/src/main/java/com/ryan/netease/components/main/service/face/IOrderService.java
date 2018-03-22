package com.ryan.netease.components.main.service.face;

import java.util.List;
import java.util.Map;

public interface IOrderService {
	
	/**
	 * 购买商品
	 * @param params
	 */
	void buyGoods(Map<String, Object> params);
	
	/**
	 * 查找买家没有付款的商品
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findGoodsWithoutPay(Map<String, Object> params);
	
	/**
	 * 买家结算
	 * @param params
	 */
	void payGoods(Map<String, Object> params);
	
	/**
	 * 查找买家结算后的商品
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> findPayedGoods(Map<String, Object> params);
	
}
