package com.ch.fls.service;

import java.util.List;
import java.util.Map;

public interface BookInfoService {

	List<Map<String, String>> queryBookList(Map<String, String> queryMap);

	Map<String, String> queryBookDetail(Map<String, String> queryMap);

	void addReadInfo(Map<String, String> readMap);

	void updateReadStatus(Map<String, String> paramsMap);

	Map<String, String> queryReadBookInfo(Map<String, String> paramsMap);

}
