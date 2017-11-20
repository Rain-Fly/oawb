package com.feicui.oawb.dao;

import java.util.List;

import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.User;

public interface UserMapper {
	//根据用户账号查询用户信息
	public User queryUserByAccount(String account) throws Exception;
	//根据用户账号查询用户权限范围内的菜单
	public List<Permission> queryMenuListByAccount(String account) throws Exception;
	//根据用户账号查询用户权限
	public List<Permission> queryPermissionListByAccount(String account) throws Exception;
	//查询所有用户信息
	public List<User> queryAllUsers() throws Exception;
	//添加用户
	public void insertUser(User user) throws Exception;
	//删除用户
	public void deleteUser(String acconut) throws Exception;
	//修改用户信息
	public void updateUser(User user) throws Exception;
	//重置密码
	public void resetPassword(User user) throws Exception;
}
