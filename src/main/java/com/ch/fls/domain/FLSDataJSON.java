package com.ch.fls.domain;


public class FLSDataJSON {

    private Integer code;//请求返回状态 0:成功 1:失败
    private String msg;//请求返回状态描述
    private Object data;//请求返回数据
    
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
    


}
