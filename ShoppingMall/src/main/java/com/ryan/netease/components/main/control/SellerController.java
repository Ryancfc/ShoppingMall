package com.ryan.netease.components.main.control;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ryan.netease.components.main.domain.Goods;
import com.ryan.netease.components.main.service.face.IGoodsService;
import com.ryan.netease.tools.RequestUtil;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Value("#{configProperties['path.basePath']}")
	public String photoPath;
	
	@Autowired
	private IGoodsService goodsService;
	
	@RequestMapping("/index")
	public String inde(HttpServletRequest request){
		return "seller/index";
	}
	
	@ResponseBody
	@RequestMapping("/findGoodsBySellerId")
	public List<Map<String, Object>> findGoodsBySellerId(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		return this.goodsService.findGoodsBySellerId(params);
	}
	
	
	@ResponseBody
	@RequestMapping("/delGoods")
	public int delGoodsById(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		this.goodsService.deleteGoodsById(params);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("/uploadpic")
	public Map<String, String> uploadPic(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		Map<String, String> map = new HashMap<String, String>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile orignalFile = multipartRequest.getFile("picsrc1");
		String originalFileName = orignalFile.getOriginalFilename();
		originalFileName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		//存储图片的物理路径
		String path = photoPath;
		File dic = new File(path);
		if (!dic.exists()) {
			dic.mkdirs();
		}
		path+=File.separator+id+originalFileName;
		File file=new File(path);
		if(file.exists()){
			file.delete();
		}
		try {
			orignalFile.transferTo(file);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			params.put("pic", 1);
			params.put("picsrc", id+originalFileName);
			this.goodsService.updateGoodsById(params);
			map.put("success","true");
			return map;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("success","false");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateGoods")
	public int updateGoods(HttpServletRequest request){
		Map<String, Object> params =RequestUtil.asMap(request);
		this.goodsService.updateGoodsById(params);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("/addnewpic")
	public Map<String, Object> addnewPic(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile orignalFile = multipartRequest.getFile("add_picsrc1");
		String originalFileName = orignalFile.getOriginalFilename();
		originalFileName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		//先插入pic，然后返回主键id
		Goods goods=new Goods();
		goods.setPic(1);
		this.goodsService.insertGoodsPic(goods);
		int id=goods.getId();
		//存储图片的物理路径
		String path = photoPath;
		File dic = new File(path);
		if (!dic.exists()) {
			dic.mkdirs();
		}
		path+=File.separator+id+originalFileName;
		File file=new File(path);
		if(file.exists()){
			file.delete();
		}
		try {
			orignalFile.transferTo(file);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			params.put("pic", 1);
			params.put("picsrc", id+originalFileName);
			this.goodsService.updateGoodsById(params);
			map.put("id", id);
			map.put("success","true");
			return map;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//上传失败，删除刚刚插入的对应id的记录
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		this.goodsService.deleteGoodsById(params);
		map.put("success","false");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/insertGoods")
	public int insertGood(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		this.goodsService.insertGoods(params);
		return 1;
	}
}
