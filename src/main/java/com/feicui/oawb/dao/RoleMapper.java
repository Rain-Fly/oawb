package com.feicui.oawb.dao;

import java.util.List;

import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;
import com.feicui.oawb.po.RolePermission;

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
	//删除角色拥有的权限
	public void deleteRolePermission(RolePermission rolePermission) throws Exception;
	//插入角色拥有的权限
	public void insertRolePermission(RolePermission rolePermission) throws Exception;
	//更新角色拥有的权限
	public void updateRolePermission(RolePermission rolePermission) throws Exception;
	//添加角色
	public void insertRole(Role role) throws Exception;
	//根据角色名称查询角色信息
	public Role queryRoleIDByName(String name) throws Exception;
	//修改角色不可用
	public void updateRoleUnavailable(Role role) throws Exception;
}
