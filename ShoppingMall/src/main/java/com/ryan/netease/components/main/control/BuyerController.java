package com.ryan.netease.components.main.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ryan.netease.components.main.service.face.IGoodsService;
import com.ryan.netease.components.main.service.face.IOrderService;
import com.ryan.netease.tools.RequestUtil;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	
	@Autowired
	private IGoodsService goodsService;
	
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping("/index")
	public String inde(HttpServletRequest request){
		return "buyer/index";
	}
	
	@ResponseBody
	@RequestMapping("/findGoodsWithMarked")
	public List<Map<String, Object>> findGoodsWithMarked(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		return this.goodsService.findGoodsWithMarked(params);
	}
	
	@ResponseBody
	@RequestMapping("/buyGoods")
	public int buyGoods(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		int price=Integer.parseInt((String) params.get("price"));
		int amount=Integer.parseInt((String)params.get("amount"));
		params.put("money", price*amount);
		Date now=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");		
		params.put("time", format.format(now));
		this.orderService.buyGoods(params);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("/findGoodsWithoutPay")
	public List<Map<String, Object>> findGoodsWithoutPay(HttpServletRequest	request){
		Map<String, Object> params=RequestUtil.asMap(request);
		return this.orderService.findGoodsWithoutPay(params);
	}
	
	@ResponseBody
	@RequestMapping("/payGoods")
	public int payGoods(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		this.orderService.payGoods(params);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("/findPayedGoods")
	public List<Map<String, Object>> findPayedGoods(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		List<Map<String, Object>> results= this.orderService.findPayedGoods(params);
		SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		for(Map<String, Object> map:results){
			map.put("time", format.format(map.get("time")));
		}
		return results;
	}
	
}
