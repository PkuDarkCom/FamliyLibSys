package com.ch.fls.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ch.fls.dao.ReadInfoStatisticsMapper;
import com.ch.fls.service.ReadInfoStatisticsService;

@Service
public class ReadInfoStatisticsServiceImpl implements ReadInfoStatisticsService{
	
	@Autowired
	@Qualifier("readInfoStatisticsMapper")
	private ReadInfoStatisticsMapper statMapper;
	
	@Override
	public List<Map<String, String>> searchReadInfoByUserId(Map<String, String> param) {
		
		return statMapper.queryReadInfoByUserId(param);
	}
	
	@Override
	public Map<String, Integer> searchReadInfoByTime(Map<String, String> param) {
		Map<String, Integer> readInfoStat = new HashMap<String, Integer>();
		readInfoStat.put("weekCount", statMapper.queryReadInfoByWeek(param));
		readInfoStat.put("monthCount", statMapper.queryReadInfoByMonth(param));
		readInfoStat.put("yearCount", statMapper.queryReadInfoByYear(param));
		return readInfoStat;
	}

}
