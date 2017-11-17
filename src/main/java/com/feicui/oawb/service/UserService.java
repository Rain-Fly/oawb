package com.feicui.oawb.service;

import java.util.List;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.User;

public interface UserService {
	
	//根据用户名查询用户信息
	public User queryUserByInfo(String account) throws Exception;
	//根据用户账号查询用户权限范围内的菜单
	public List<Permission> queryMenuListByAccount(String account) throws Exception;
	//根据用户账号查询用户权限
	public List<Permission> queryPermissionListByAccount(String account) throws Exception;
	//查询所有用户信息
	public List<User> queryAllUsers() throws Exception;
}
