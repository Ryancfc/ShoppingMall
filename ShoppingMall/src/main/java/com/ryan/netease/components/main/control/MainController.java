package com.ryan.netease.components.main.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ryan.netease.components.main.service.face.IGoodsService;
import com.ryan.netease.components.main.service.face.IUserService;
import com.ryan.netease.tools.RequestUtil;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Value("#{configProperties['path.basePath']}")
	public String photoPath;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IGoodsService goodsService;
	
	/**
	 * 进入首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "index";
	}
	
	/**
	 * 登录
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public int login(HttpServletRequest request, Model model){
		Map<String, Object> params=RequestUtil.asMap(request);
		Map<String, Object> user=userService.getUser(params);
		if(user!=null && user.size()>0){
			HttpSession session=request.getSession();
			for(String key:user.keySet() ){
				session.setAttribute(key, user.get(key));
			}
			
			return 1;
		}
		return 0;
	}
	
	/**
	 * 退出
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public int logout(HttpServletRequest request){
		request.getSession().invalidate();
		return 1;
	}
	
	/**
	 * 根据用户类型转到相应的页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user")
	public String user(HttpServletRequest request,Model model){
		Map<String, Object> params=RequestUtil.initParams(request);
		int type=(int)params.get("type");
		if(type==1){
			model.addAttribute("id", params.get("id"));
			model.addAttribute("username", params.get("username"));
			model.addAttribute("type", 1);
			return "buyer/index";
		}else{
			model.addAttribute("id", params.get("id"));
			model.addAttribute("username", params.get("username"));
			model.addAttribute("type", 2);
			return "seller/index";
		}
	}
	
	/**
	 * 查找商品
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/findGoods")
	public List<Map<String, Object>> findGoods(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		List<Map<String, Object>> result=this.goodsService.findGoods(params);
		return result;
	}
	
	/**
	 * 根据商品ID查找商品
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/goodsDetail")
	public Map<String, Object> getGoodsDetail(HttpServletRequest request){
		Map<String, Object> params=RequestUtil.asMap(request);
		List<Map<String, Object>> result=this.goodsService.findGoods(params);
		return result.get(0);
	}
	
	/**
	 * 显示商品照片
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping("/photo")
	public void photo(@RequestParam String picsrc, HttpServletRequest request,
			HttpServletResponse response){
		String path=photoPath+File.separator;
		OutputStream out = null;
		FileInputStream in = null;
		try {
			out = response.getOutputStream();
			File file = new File(photoPath);
			if (!file.exists()) {
				file.mkdirs();
			}
			file=new File(path+picsrc);
			if (file.exists()) {
				in = new FileInputStream(file);
			} else {
				in = new FileInputStream(new File(path + "nophoto.jpg"));
			}
			byte[] buffer = new byte[2048];
			int len = 0;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
			in.close();
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
