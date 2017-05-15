package com.ch.fls.dao;

import java.util.List;
import java.util.Map;

public interface BookInfoMapper {

	List<Map<String, String>> queryBookList(Map<String, String> queryMap);

	Map<String, String> queryBookDetail(Map<String, String> queryMap);

	void addReadInfo(Map<String, String> readMap);

	void updateReadStatus(Map<String, String> paramsMap);

	Map<String, String> queryReadBookInfo(Map<String, String> paramsMap);

	List<Map<String, String>> querybookShelfList();

	void addBookShell(String shelfName);

	void deleteBookShell(String shelfType);

	void updateBookShell(Map<String, String> paramsMap);

	void addBookInfo(Map<String, String> paramsMap);

	void updateBookInfo(Map<String, String> paramsMap);
	
}
