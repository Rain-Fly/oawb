package com.feicui.oawb.po;

/*
 * 返回给前端的数据
 */
public class ResultEntity<T>{
	private int code;     //状态码     200
	private String msg;   //描述信息   success
	private T data;       //数据        返回的数据
	
	public ResultEntity() {
		super();
	}
	public ResultEntity(int code, String msg, T data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
}
