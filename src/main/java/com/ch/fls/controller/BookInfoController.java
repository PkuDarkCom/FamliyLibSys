package com.ch.fls.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.fls.domain.FLSDataJSON;
import com.ch.fls.service.BookInfoService;
import com.ch.fls.utils.UUIDUtils;
@Controller
@RequestMapping("book/")
public class BookInfoController {
	
	@Autowired
	private BookInfoService bookInfoServiceImpl;
	
	/**
	 * 跳转图书列表页
	 * @return
	 */
	@RequestMapping("bookList")
	public String bookList(){
		return "book/bookList";
	}	
    
	/**
	 * 获取图书列表数据
	 * @param session
	 * @param shelfType
	 * @param searchContent
	 * @return FLSDataJSON
	 */
	@RequestMapping("bookListData")
	@ResponseBody
	public FLSDataJSON bookListData(HttpSession session,
			@RequestParam(value = "shelfType", required = false) String  shelfType,
			@RequestParam(value = "searchContent", required = false) String  searchContent){
		FLSDataJSON dataJson = new FLSDataJSON();
		//查询图书列表
		Map<String,String> queryMap = new HashMap<String,String>();
		queryMap.put("shelfType", shelfType);
		queryMap.put("searchContent", searchContent);
		List<Map<String,String>> bookList = bookInfoServiceImpl.queryBookList(queryMap);
		
		dataJson.setCode(1);
		dataJson.setMsg("查询成功");
		dataJson.setData(JSONArray.fromObject(bookList).toString());
		
		return dataJson;
	}
	
	/**
	 * 跳转图书详情页
	 * @return
	 */
	@RequestMapping("bookDetail")
	public String bookDetail(){
		return "book/bookDetail";
	}
	
	/**
	 * 获取图书详情数据
	 * @param session
	 * @param uuid
	 * @return
	 */
	@RequestMapping("bookDetailData")
	@ResponseBody
	public FLSDataJSON bookDetailData(HttpSession session,
			@RequestParam(value = "bookId", required = true) String  bookId){
		FLSDataJSON dataJson = new FLSDataJSON();
		//查询用户信息
		Map<String,String> queryMap = new HashMap<String,String>();
		queryMap.put("bookId", bookId);
		Map<String,String> bookDetailInfo = bookInfoServiceImpl.queryBookDetail(queryMap);
		
		dataJson.setCode(1);
		dataJson.setMsg("查询成功");
		dataJson.setData(JSONObject.fromObject(bookDetailInfo).toString());
		
		return dataJson;
	}
	
	
	/**
	 * 更新阅读状态
	 * @param session
	 * @param bookId
	 * @param userId
	 * @param operationType
	 * @return
	 */
	@RequestMapping("updateReadStatus")
	@ResponseBody
	public FLSDataJSON updateReadStatus(HttpSession session,
			@RequestParam(value = "bookId", required = true) String  bookId,
			@RequestParam(value = "userId", required = true) String  userId,
			@RequestParam(value = "operationType", required = true) String  operationType){
		FLSDataJSON dataJson = new FLSDataJSON();
		//查询用户阅读信息
		Map<String,String> paramsMap = new HashMap<String,String>();
		paramsMap.put("userId", userId);
		paramsMap.put("bookId", bookId);
		paramsMap.put("readStatus", operationType);// 1:收藏(想读) 2:在读 3:已读
		
		Map<String,String> readBookInfo = bookInfoServiceImpl.queryReadBookInfo(paramsMap);
		if(readBookInfo == null){//新增图书阅读记录
			paramsMap.put("uuid", UUIDUtils.getUUID());			
			bookInfoServiceImpl.addReadInfo(paramsMap);
		}else{//更新阅读记录
			paramsMap.put("readId", readBookInfo.get("readId"));
			bookInfoServiceImpl.updateReadStatus(paramsMap);
		}
		
		dataJson.setCode(1);
		dataJson.setMsg("查询成功");		
		return dataJson;
	}
}
