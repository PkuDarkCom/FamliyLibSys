package com.ch.fls.dao;

import java.util.List;
import java.util.Map;

public interface ReadInfoStatisticsMapper {
	
	public List<Map<String, String>> queryReadInfoByUserId(Map<String, String> param);
	
	public int queryReadInfoByWeek(Map<String, String> param);
	
	public int queryReadInfoByMonth(Map<String, String> param);
	
	public int queryReadInfoByYear(Map<String, String> param);

}
