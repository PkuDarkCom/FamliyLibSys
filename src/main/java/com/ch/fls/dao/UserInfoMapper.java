package com.ch.fls.dao;

import java.util.Map;

public interface UserInfoMapper {

	Map<String, String> queryUserInfo(String loginName);
	
	
}
