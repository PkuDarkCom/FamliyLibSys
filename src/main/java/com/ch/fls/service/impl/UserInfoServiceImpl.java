package com.ch.fls.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.fls.dao.UserInfoMapper;
import com.ch.fls.service.UserInfoService;
@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public Map<String, String> queryUserInfo(String loginName) {
		return userInfoMapper.queryUserInfo(loginName);
	}

	

}
