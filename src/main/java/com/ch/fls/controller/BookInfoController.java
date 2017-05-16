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
		return "index";
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
		dataJson.setData(JSONArray.fromObject(bookList));
		
		return dataJson;
	}
	
	/**
	 * 跳转书架列表
	 * @param session
	 * @return
	 */
	@RequestMapping("bookShelfPre")
	public String bookShelfPre(HttpSession session){
		return "shelf";
	}
	
	/**
	 * 获取书架列表数据
	 * @param session
	 * @return
	 */
	@RequestMapping("bookShelfList")
	@ResponseBody
	public FLSDataJSON bookShelfList(HttpSession session){
		FLSDataJSON dataJson = new FLSDataJSON();
		List<Map<String,String>> shelfList = bookInfoServiceImpl.querybookShelfList();
		
		dataJson.setCode(1);
		dataJson.setMsg("查询成功");
		dataJson.setData(JSONArray.fromObject(shelfList));
		return dataJson;
	}
	
	/**
	 * 添加书架
	 * @param session
	 * @return
	 */
	@RequestMapping("addBookShelf")
	@ResponseBody
	public FLSDataJSON addBookShelf(HttpSession session,
			@RequestParam(value = "shelfName", required = true) String  shelfName){
		FLSDataJSON dataJson = new FLSDataJSON();		
		bookInfoServiceImpl.addBookShelf(shelfName);
		
		dataJson.setCode(1);
		dataJson.setMsg("添加成功");
		return dataJson;
	}
	
	/**
	 * 编辑书架
	 * @param session
	 * @return
	 */
	@RequestMapping("modifyBookShelf")
	@ResponseBody
	public FLSDataJSON modifyBookShelf(HttpSession session,
			@RequestParam(value = "shelfName", required = false) String  shelfName,
			@RequestParam(value = "shelfType", required = false) String  shelfType){
		FLSDataJSON dataJson = new FLSDataJSON();
		
		Map<String,String> paramsMap = new HashMap<String,String>();
		paramsMap.put("shelfType", shelfType);
		paramsMap.put("shelfName", shelfName);
		if(shelfName == null || shelfName.equals("")){
			//查询该书架是否存在图书			
			List<Map<String, String>> list = bookInfoServiceImpl.queryBookList(paramsMap);
			if(list != null && list.size() >0){
				dataJson.setCode(2);
				dataJson.setMsg("该书架还存有图书记录，无法删除");
				return dataJson;
			}					
			//删除书架
			bookInfoServiceImpl.deleteBookShelf(shelfType);
		}else{			
			//编辑数据
			bookInfoServiceImpl.updateBookShelf(paramsMap);
		}
			
		dataJson.setCode(1);
		dataJson.setMsg("操作成功");
		return dataJson;
	}
	
	
	
	/**
	 * 跳转图书详情页
	 * @return
	 */
	@RequestMapping("bookDetail")
	public String bookDetail(){
		return "detail";
	}
	
	/**
	 * 获取图书详情数据
	 * @param session
	 * @param bookId
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
		dataJson.setData(JSONObject.fromObject(bookDetailInfo));
		
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
			@RequestParam(value = "operationType", required = true) String  operationType){
		//从session中获取用户信息
		Map<String,String> userInfo = (Map<String, String>) session.getAttribute("userInfo");
		String userId = userInfo.get("userId");
		
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
			String readId = readBookInfo.get("readId");
			String readStatus = readBookInfo.get("readStatus");
			if(readStatus.equals("1") && operationType.equals("1")){
				dataJson.setCode(2);
				dataJson.setMsg("您已收藏该图书");	
				return dataJson;
			}else if(readStatus.equals("2")){
				if(operationType.equals("1") || operationType.equals("2")){
					dataJson.setCode(3);
					dataJson.setMsg("您已开始阅读该图书");	
					return dataJson;
				}				
			}else if(readStatus.equals("3")){
				dataJson.setCode(4);
				dataJson.setMsg("您已读完该图书");	
				return dataJson;
			}
			paramsMap.put("readId", readId);
			bookInfoServiceImpl.updateReadStatus(paramsMap);
		}
		
		dataJson.setCode(1);
		dataJson.setMsg("操作成功");		
		return dataJson;
	}
	
	
	/**
	 * 跳转新增图书页面
	 * @return
	 */
	@RequestMapping("addBookPre")
	public String addBookPre(){
		return "addBook";
	}
	
	/**
	 * 新增图书
	 * @param session
	 * @param isbn
	 * @param bookTitle
	 * @param originTitle
	 * @param image
	 * @param author
	 * @param translator
	 * @param press
	 * @param publicationDate
	 * @param rating
	 * @param tags
	 * @param binding
	 * @param price
	 * @param pages
	 * @param authorIntro
	 * @param summary
	 * @param catalog
	 * @param bookShelf
	 * @param isEbook
	 * @return
	 */
	@RequestMapping("addBookInfo")
	@ResponseBody
	public FLSDataJSON addBookInfo(HttpSession session,
			@RequestParam(value = "isbn", required = true) String  isbn,
			@RequestParam(value = "bookTitle", required = true) String  bookTitle,
			@RequestParam(value = "originTitle", required = false) String  originTitle,
			@RequestParam(value = "image", required = true) String  image,
			@RequestParam(value = "author", required = true) String  author,
			@RequestParam(value = "translator", required = false) String  translator,
			@RequestParam(value = "press", required = false) String  press,
			@RequestParam(value = "publicationDate", required = false) String  publicationDate,
			@RequestParam(value = "rating", required = false) String  rating,
			@RequestParam(value = "tags", required = false) String  tags,
			@RequestParam(value = "binding", required = false) String  binding,
			@RequestParam(value = "price", required = false) String  price,
			@RequestParam(value = "pages", required = false) String  pages,
			@RequestParam(value = "authorIntro", required = true) String  authorIntro,
			@RequestParam(value = "summary", required = true) String  summary,
			@RequestParam(value = "catalog", required = false) String  catalog,
			@RequestParam(value = "bookShelf", required = true) String  bookShelf,
			@RequestParam(value = "isEbook", required = true) String  isEbook){
		FLSDataJSON dataJson = new FLSDataJSON();
		//组织图书信息
		Map<String,String> paramsMap = new HashMap<String,String>();
		paramsMap.put("uuid", UUIDUtils.getUUID());	
		//必须项
		paramsMap.put("isbn", isbn);
		paramsMap.put("bookTitle", bookTitle);
		paramsMap.put("image", image);
		paramsMap.put("author", author);
		paramsMap.put("authorIntro", authorIntro);
		paramsMap.put("summary", summary);
		paramsMap.put("bookShelf", bookShelf);
		paramsMap.put("isEbook", isEbook);
		//非必须项
		paramsMap.put("originTitle", originTitle);		
		paramsMap.put("translator", translator);
		paramsMap.put("press", press);
		paramsMap.put("publicationDate", publicationDate);
		paramsMap.put("rating", rating);
		paramsMap.put("tags", tags);
		paramsMap.put("binding", binding);
		paramsMap.put("price", price);
		paramsMap.put("pages", pages);		
		paramsMap.put("catalog", catalog);
				
		//添加图书
		bookInfoServiceImpl.addBookInfo(paramsMap);
				
		dataJson.setCode(1);
		dataJson.setMsg("添加成功");		
		return dataJson;
	}
	
	/**
	 * 编辑图书
	 * @param session
	 * @param isbn
	 * @param bookTitle
	 * @param originTitle
	 * @param image
	 * @param author
	 * @param translator
	 * @param press
	 * @param publicationDate
	 * @param rating
	 * @param tags
	 * @param binding
	 * @param price
	 * @param pages
	 * @param authorIntro
	 * @param summary
	 * @param catalog
	 * @param bookShelf
	 * @param isEbook
	 * @return
	 */
	@RequestMapping("modifyBookInfo")
	@ResponseBody
	public FLSDataJSON modifyBookInfo(HttpSession session,
			@RequestParam(value = "bookId", required = true) String  bookId,
			@RequestParam(value = "isbn", required = true) String  isbn,
			@RequestParam(value = "bookTitle", required = true) String  bookTitle,
			@RequestParam(value = "originTitle", required = false) String  originTitle,
			@RequestParam(value = "image", required = true) String  image,
			@RequestParam(value = "author", required = true) String  author,
			@RequestParam(value = "translator", required = false) String  translator,
			@RequestParam(value = "press", required = false) String  press,
			@RequestParam(value = "publicationDate", required = false) String  publicationDate,
			@RequestParam(value = "rating", required = false) String  rating,
			@RequestParam(value = "tags", required = false) String  tags,
			@RequestParam(value = "binding", required = false) String  binding,
			@RequestParam(value = "price", required = false) String  price,
			@RequestParam(value = "pages", required = false) String  pages,
			@RequestParam(value = "authorIntro", required = true) String  authorIntro,
			@RequestParam(value = "summary", required = true) String  summary,
			@RequestParam(value = "catalog", required = false) String  catalog,
			@RequestParam(value = "bookShelf", required = true) String  bookShelf,
			@RequestParam(value = "isEbook", required = true) String  isEbook){
		FLSDataJSON dataJson = new FLSDataJSON();
		//组织图书信息
		Map<String,String> paramsMap = new HashMap<String,String>();
		paramsMap.put("bookId", bookId);	
		//必须项
		paramsMap.put("isbn", isbn);
		paramsMap.put("bookTitle", bookTitle);
		paramsMap.put("image", image);
		paramsMap.put("author", author);
		paramsMap.put("authorIntro", authorIntro);
		paramsMap.put("summary", summary);
		paramsMap.put("bookShelf", bookShelf);
		paramsMap.put("isEbook", isEbook);
		//非必须项
		paramsMap.put("originTitle", originTitle);		
		paramsMap.put("translator", translator);
		paramsMap.put("press", press);
		paramsMap.put("publicationDate", publicationDate);
		paramsMap.put("rating", rating);
		paramsMap.put("tags", tags);
		paramsMap.put("binding", binding);
		paramsMap.put("price", price);
		paramsMap.put("pages", pages);		
		paramsMap.put("catalog", catalog);
				
		//更新图书
		bookInfoServiceImpl.updateBookInfo(paramsMap);
				
		dataJson.setCode(1);
		dataJson.setMsg("更新成功");		
		return dataJson;
	}
}
