package com.ch.fls.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.fls.dao.BookInfoMapper;
import com.ch.fls.service.BookInfoService;
@Service
public class BookInfoServiceImpl implements BookInfoService{
	
	@Autowired
	private BookInfoMapper bookInfoMapper;

	@Override
	public List<Map<String, String>> queryBookList(Map<String, String> queryMap) {
		return bookInfoMapper.queryBookList(queryMap);
	}

	@Override
	public Map<String, String> queryBookDetail(Map<String, String> queryMap) {
		return bookInfoMapper.queryBookDetail(queryMap);
	}

	@Override
	public void addReadInfo(Map<String, String> readMap) {
		bookInfoMapper.addReadInfo(readMap);
	}

	@Override
	public void updateReadStatus(Map<String, String> paramsMap) {
		bookInfoMapper.updateReadStatus(paramsMap);
	}

	@Override
	public Map<String, String> queryReadBookInfo(Map<String, String> paramsMap) {
		return bookInfoMapper.queryReadBookInfo(paramsMap);
	}
	

	

}
