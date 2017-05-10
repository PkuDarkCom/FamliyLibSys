package com.ch.sprider.core;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.ch.sprider.bean.LinkTypeData;
import com.ch.sprider.rule.Rule;
import com.ch.sprider.rule.RuleException;
import com.ch.sprider.util.TextUtil;



/**
 * 网页爬虫核心类
 * @author chenheng
 */
public class ExtractService
{
	
	/**
	 * 执行爬虫
	 * @param rule 规则
	 * @return
	 */
	public static List<?> extract(Rule rule)
	{
		// 进行对rule的必要校验
		validateRule(rule);
		List<LinkTypeData> datas = new ArrayList<LinkTypeData>();
		
		try
		{
			// 解析rule
			String url = rule.getUrl();
			String[] params = rule.getParams();
			String[] values = rule.getValues();
			String resultTagName = rule.getResultTagName();
			int type = rule.getType();
			int requestType = rule.getRequestMethod();
	
			//建立连接
			Connection conn = Jsoup.connect(url);
			
			// 设置查询参数
			if (params != null)
			{
				for (int i = 0; i < params.length; i++)
				{
					conn.data(params[i], values[i]);
				}
			}
	
			// 设置请求类型
			Document doc = null;
			switch (requestType)
			{
			case Rule.GET:
				doc = conn.timeout(100000).get();
				break;
			case Rule.POST:
				doc = conn.timeout(100000).post();
				break;
			}
	
			//处理返回数据
			Elements results = new Elements();
			switch (type)
			{
			case Rule.CLASS:
				results = doc.getElementsByClass(resultTagName);
				break;
			case Rule.ID:
				Element result = doc.getElementById(resultTagName);
				results.add(result);
				break;
			case Rule.SELECTION:
				results = doc.select(resultTagName);
				break;
			case Rule.ATTRIBUTE:
				results = doc.getElementsByAttribute(resultTagName);
			default:
				//当resultTagName为空时默认去body标签
				if (TextUtil.isEmpty(resultTagName))
				{
					results = doc.getElementsByTag("body");
				}
			}
	        //解析获取的数据
			//datas = praseResule4Net(results,datas);
			String str = praseHtml4JRQ(results);

		} catch (IOException e)
		{
			e.printStackTrace();
		}

		return datas;
	}
	

	/**
	 * 普通网页的数据解析 
	 */
	private static List<LinkTypeData> praseResule4Net(Elements results,List<LinkTypeData> datas){
		
		LinkTypeData data = null;
		
		for (Element result : results)
		{
			Elements links = result.getElementsByTag("a");

			for (Element link : links)
			{
				//必要的筛选
				String linkHref = link.attr("href");
				String linkText = link.text();

				data = new LinkTypeData();
				data.setLinkHref(linkHref);
				data.setLinkText(linkText);

				datas.add(data);
			}
		}
		
		return datas;
	}
	
	/**
	 * 解析金融圈页面数据
	 */
	private static String praseHtml4JRQ(Elements results){
		JSONObject dataJson = null;
		for (Element result : results)
		{
			String data = result.select("div[data-order]").attr("data-order");
			dataJson = JSONObject.fromObject(data);
			System.out.println("交易数据："+dataJson);
//			TradeData tradeData = (TradeData) dataJson.toBean(dataJson, TradeData.class);
			
//			System.out.println("===start====");
//			System.out.println(dataJson.get("order_id"));
//			System.out.println(dataJson.get("symbol"));
//			System.out.println(dataJson.get("open_price"));
//          System.out.println("===end====");
		}
		return null;		
	}
	
	
	/**
	 * 对传入的参数进行必要的校验
	 */
	private static void validateRule(Rule rule)
	{
		String url = rule.getUrl();
		if (TextUtil.isEmpty(url))
		{
			throw new RuleException("url不能为空！");
		}
		if (!url.startsWith("http://") && !url.startsWith("https://"))
		{
			throw new RuleException("url的格式不正确！");
		}

		if (rule.getParams() != null && rule.getValues() != null)
		{
			if (rule.getParams().length != rule.getValues().length)
			{
				throw new RuleException("参数的键值对个数不匹配！");
			}
		}

	}


}
