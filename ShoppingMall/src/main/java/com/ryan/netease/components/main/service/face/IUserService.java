package com.ryan.netease.components.main.service.face;

import java.util.List;
import java.util.Map;

public interface IUserService {
	
	/**
	 * 查找用户
	 * @param params
	 * @return
	 */
	Map<String, Object> getUser(Map<String, Object> params);
	
	/**
	 * 根据用户查找该用户购买的商品
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getGoodsByUser(Map<String, Object> params);
}
