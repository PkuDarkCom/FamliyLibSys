package com.ch.fls.service;

import java.util.List;
import java.util.Map;

public interface ReadInfoStatisticsService {
	
	public List<Map<String, String>> searchReadInfoByUserId(Map<String, String> param);
	
	public Map<String, Integer> searchReadInfoByTime(Map<String, String> param);

}
