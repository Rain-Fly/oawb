package com.feicui.oawb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.oawb.dao.RoleMapper;
import com.feicui.oawb.dao.UserMapper;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;
import com.feicui.oawb.po.User;
import com.feicui.oawb.po.UserRole;
import com.feicui.oawb.service.UserService;
import com.feicui.oawb.utils.Common;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	
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
	public void deleteUser(String acconut) throws Exception {
		userMapper.deleteUser(acconut);
	}
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}
	public void resetPassword(User user) throws Exception {
		userMapper.resetPassword(user);
	}
	
	/**
	 * 修改用户拥有的角色
	 */
	@Override
	public void updateUserRole(String account, String roleIDs, String updater) throws Exception {
		//修改后的角色
		String[] roleIDStrArr = roleIDs.split(",");
		List<Integer> newRoleIDs = new ArrayList<Integer>();
		for(String roleIDStr:roleIDStrArr){
			newRoleIDs.add(Integer.parseInt(roleIDStr));
		}
		
		//用户已有的角色
		List<Role> roles = roleMapper.queryRoleByAccount(account);
		List<Integer> oldRoleIDs = new ArrayList<Integer>();
		for(Role role:roles){
			UserRole userRole = new UserRole();
			userRole.setUpdater(updater);
			userRole.setUpdateDate(new Date());
			userRole.setAccount(account);
			userRole.setRoleID(role.getId());
			if(newRoleIDs.contains(role.getId())){
				//修改后用户仍有该角色,进行修改操作
				userMapper.updateUserRole(userRole);
			}else{
				//修改后用户无该角色,进行删除操作
				userMapper.deleteUserRole(userRole);
			}
			oldRoleIDs.add(role.getId());
		}
		
		//修改后的角色
		for(Integer roleID:newRoleIDs){
			if(oldRoleIDs.contains(roleID)){
				//修改前用户已有该角色,进行修改操作.由于上述代码已做处理,此处不需要执行任何操作
			}else{
				//修改前用户无该角色,执行插入操作
				UserRole userRole = new UserRole();
				userRole.setAccount(account);
				userRole.setRoleID(roleID);
				userRole.setAuthor(updater);
				userRole.setUpdater(updater);
				userRole.setCreateTime(new Date());
				userRole.setCreateDate(new Date());
				userRole.setUpdateDate(new Date());
				userMapper.insertUserRole(userRole);
			}
		}
		
	}
	
	/**
	 * 添加用户,及用户拥有的角色
	 */
	@Override
	public void insertUser(User user, String[] roleIDs, String account) throws Exception {
		//添加用户
		System.out.println("UserServiceImpl-->user="+user);
		user.setAuthor(account);
		user.setUpdater(account);
		user.setCreateTime(new Date());
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		String salt = System.currentTimeMillis()+"";
		user.setSalt(salt);
		Md5Hash md5Hash = new Md5Hash(user.getPassword(), salt, Common.hashIterations);
		user.setPassword(md5Hash.toString());
		userMapper.insertUser(user);
		//添加用户拥有的角色
		for(String roleID:roleIDs){
			UserRole userRole = new UserRole();
			userRole.setAccount(user.getAccount());
			userRole.setRoleID(Integer.parseInt(roleID));
			userRole.setAuthor(account);
			userRole.setUpdater(account);
			userRole.setCreateTime(new Date());
			userRole.setCreateDate(new Date());
			userRole.setUpdateDate(new Date());
			userMapper.insertUserRole(userRole);
		}
	}
}
