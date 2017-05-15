package com.ch.fls.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.fls.domain.FLSDataJSON;
import com.ch.fls.service.ReadInfoStatisticsService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("read/")
public class ReadInfoStatisticsController {
	
	@Autowired
	@Qualifier("readInfoStatisticsServiceImpl")
	private ReadInfoStatisticsService statService;
	
	private static final String READ_INFO_STATISTICS_PAGE = "readInfoStatistics";
	
	/**
	 * 阅读信息统计页面
	 * @return
	 */
	@RequestMapping("readInfoStatPage")
	public String readInfoStat(){		
		return READ_INFO_STATISTICS_PAGE;
	}
	
	@RequestMapping("readInfoStat")
	@ResponseBody
	public FLSDataJSON getReadInfoStatisticsByUserId(){
		FLSDataJSON jsonData = new FLSDataJSON();
		Map<String, String> param = new HashMap<String, String>();
		param.put("userId", "1");
		List<Map<String, String>> statInfos = statService.searchReadInfoByUserId(param);
		
		if(!statInfos.isEmpty()){
			jsonData.setCode(1);
			jsonData.setMsg("success");
			jsonData.setData(JSONArray.fromObject(statInfos));
		}else{
			jsonData.setCode(2);
			jsonData.setMsg("fail");
		}
		
		return jsonData;
	}
	
	@RequestMapping("readInfotTimeStat")
	@ResponseBody
	public FLSDataJSON getReadInfoStatisticsByTime(){
		FLSDataJSON jsonData = new FLSDataJSON();
		Map<String, String> param = new HashMap<String, String>();
		param.put("userId", "1");
		Map<String, Integer> statInfos = statService.searchReadInfoByTime(param);
		
		if(!statInfos.isEmpty()){
			jsonData.setCode(1);
			jsonData.setMsg("success");
			jsonData.setData(JSONArray.fromObject(statInfos));
		}else{
			jsonData.setCode(2);
			jsonData.setMsg("fail");
		}
		
		return jsonData;
	}

}
