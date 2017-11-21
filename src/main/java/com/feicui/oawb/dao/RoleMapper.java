package com.feicui.oawb.dao;

import java.util.List;

import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;

/**
 * 角色管理
 * @author 李琳茹
 *
 */
public interface RoleMapper {
	//查询所有角色
	public List<Role> queryAllRoles() throws Exception;
	//查询所有的权限
	public List<Permission> queryAllPermission() throws Exception;
	//查询该角色拥有哪些权限
	public List<Permission> queryPermissionByRoleID(int roleID) throws Exception;
}
