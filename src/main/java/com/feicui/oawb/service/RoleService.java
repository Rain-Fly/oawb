package com.feicui.oawb.service;

import java.util.List;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;

/**
 * 角色管理
 * @author 李琳茹
 *
 */
public interface RoleService {
	//查询所有角色
	public List<Role> queryAllRoles() throws Exception;
	//查询所有的权限
	public List<Permission> queryAllPermission() throws Exception;
	//查询该角色拥有哪些权限
	public List<Permission> queryPermissionByRoleID(int roleID) throws Exception;
	//修改角色拥有的权限
	public void updateRolePermission(int roleID, String permissionIDs, String account) throws Exception;
	//为角色添加权限
	public void insertRolePermission(int roleID, String permissionIDs, String account) throws Exception;
	//根据角色名称查询角色信息
	public Role queryRoleIDByName(String name) throws Exception;
	//修改角色不可用
	public void updateRoleUnavailable(Role role) throws Exception;
	//添加角色,及角色拥有的权限
	public void insertRole(String name, String permissionIDs, String account) throws Exception;
}
