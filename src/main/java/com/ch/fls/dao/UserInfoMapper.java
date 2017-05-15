package com.ch.fls.dao;

import java.util.Map;

public interface UserInfoMapper {

	Map<String, String> queryUserInfo(String loginName);

	Map<String, String> queryUserRegisterInfo(Map<String, String> paramsMap);

	Object addUserInfo(Map<String, String> paramsMap);
	
	
}
