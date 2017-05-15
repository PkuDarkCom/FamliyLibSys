package com.ch.fls.service;

import java.util.Map;

public interface UserInfoService {

	Map<String, String> queryUserInfo(String loginName);

	Map<String, String> queryUserRegisterInfo(Map<String, String> paramsMap);

	void addUserInfo(Map<String, String> paramsMap);

	

}
