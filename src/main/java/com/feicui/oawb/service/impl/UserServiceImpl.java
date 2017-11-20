package com.feicui.oawb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.oawb.dao.UserMapper;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.User;
import com.feicui.oawb.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	//根据用户名查询用户信息
	public User queryUserByAccount(String account) throws Exception {
		return userMapper.queryUserByAccount(account);
	}
	//根据用户账号查询用户权限范围内的菜单
	public List<Permission> queryMenuListByAccount(String account) throws Exception {
		return userMapper.queryMenuListByAccount(account);
	}
	//根据用户账号查询用户权限
	public List<Permission> queryPermissionListByAccount(String account) throws Exception {
		return userMapper.queryPermissionListByAccount(account);
	}
	//查询所有用户信息
	public List<User> queryAllUsers() throws Exception {
		return userMapper.queryAllUsers();
	}
	public void insertUser(User user) throws Exception {
		userMapper.insertUser(user);
	}
	public void deleteUser(String acconut) throws Exception {
		userMapper.deleteUser(acconut);
	}
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}
	public void resetPassword(User user) throws Exception {
		userMapper.resetPassword(user);
	}
}
