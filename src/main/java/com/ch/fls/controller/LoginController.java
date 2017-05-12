package com.ch.fls.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.fls.domain.FLSDataJSON;
import com.ch.fls.service.UserInfoService;
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
			@RequestParam(value = "loginPwd", required = true) String  LoginPwd){
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
			if(pwd != null && !pwd.equals(LoginPwd)){
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
		data.put("userName", map.get("userName"));
		data.put("phoneNo", map.get("phoneNo"));
		dataJson.setData(JSONObject.fromObject(data));
		
		return dataJson;
	}
	
	
}
