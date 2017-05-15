package com.ch.fls.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.fls.domain.FLSDataJSON;
import com.ch.fls.service.UserInfoService;
import com.ch.fls.utils.UUIDUtils;
@Controller
@RequestMapping("login/")
public class LoginController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("login")
	public String login(){
		return "login";
	}	
    
	@RequestMapping("checkLogin")
	@ResponseBody
	public FLSDataJSON checkLogin(HttpSession session,
			@RequestParam(value = "loginName", required = true) String  loginName,
			@RequestParam(value = "loginPwd", required = true) String  loginPwd){
		FLSDataJSON dataJson = new FLSDataJSON();
		//查询用户信息
		Map<String,String> map = userInfoService.queryUserInfo(loginName);
		if(map == null){
			dataJson.setCode(2);
			dataJson.setMsg("用户名错误");
			return dataJson;
		}else{
			String pwd = map.get("pwd");
			String status = map.get("status");			
			if(pwd != null && !pwd.equals(loginPwd)){
				dataJson.setCode(3);
				dataJson.setMsg("密码错误");
				return dataJson;
			}
			if(status != null && status.equals("00")){
				dataJson.setCode(4);
				dataJson.setMsg("用户已注销");
				return dataJson;
			}
		}
		
		dataJson.setCode(1);
		dataJson.setMsg("登录成功");
		
		Map<String,String> data = new HashMap<String,String>();
		data.put("userId", map.get("userId"));
		data.put("userName", map.get("userName"));
		data.put("phoneNo", map.get("phoneNo"));
		dataJson.setData(JSONObject.fromObject(data));
		
		/*将用户信息放入session会话中*/
		session.setAttribute("userInfo", data);
		
		return dataJson;
	}
	
	@RequestMapping("signup")
	public String signup(){
		return "signup";
	}	
	
	@RequestMapping("register")
	@ResponseBody
	public FLSDataJSON register(HttpSession session,
			@RequestParam(value = "userName", required = true) String  userName,
			@RequestParam(value = "password", required = true) String  password,
			@RequestParam(value = "phoneNo", required = true) String  phoneNo){
		FLSDataJSON dataJson = new FLSDataJSON();
		//查询用户信息
		Map<String,String> paramsMap = new HashMap<String,String>();
		paramsMap.put("userName", userName);
		paramsMap.put("password", password);
		paramsMap.put("phoneNo", phoneNo);
		Map<String,String> map = userInfoService.queryUserRegisterInfo(paramsMap);
		
		if(map != null){//已存在用户
			if(userName.equals(map.get("userName"))){
				dataJson.setCode(2);
				dataJson.setMsg("该用户名已被注册");
				return dataJson;
			}else if(phoneNo.equals(map.get("phoneNo"))){
				dataJson.setCode(3);
				dataJson.setMsg("该手机号已被注册");
				return dataJson;
			}			
		}else{
			//保存新用户
			paramsMap.put("uuid", UUIDUtils.getUUID());	
			userInfoService.addUserInfo(paramsMap);
		}
		
		dataJson.setCode(1);
		dataJson.setMsg("注册成功");
		
		return dataJson;
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("exit")
	public String eixt(HttpServletRequest request){
		//删除session中的用户信息
		request.removeAttribute("userInfo");
		return "login";
	}	
}
