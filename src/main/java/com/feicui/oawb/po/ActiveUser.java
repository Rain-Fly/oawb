package com.feicui.oawb.po;

import java.io.Serializable;
import java.util.List;

/**
 * 用户身份信息
 * @author 李琳茹
 *
 */
public class ActiveUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String account;//账号
	private String realName;//账户使用者姓名
	
	private List<Permission> menus;//菜单
	private List<Permission> permissions;//权限
	
	public ActiveUser(){}
	public ActiveUser(String account, String realName, List<Permission> menus, List<Permission> permissions) {
		super();
		this.account = account;
		this.realName = realName;
		this.menus = menus;
		this.permissions = permissions;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public List<Permission> getMenus() {
		return menus;
	}
	public void setMenus(List<Permission> menus) {
		this.menus = menus;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
}
