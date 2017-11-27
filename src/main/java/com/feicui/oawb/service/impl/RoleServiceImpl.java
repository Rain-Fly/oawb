package com.feicui.oawb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.feicui.oawb.dao.RoleMapper;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;
import com.feicui.oawb.po.RolePermission;
import com.feicui.oawb.service.RoleService;
import com.feicui.oawb.shiro.CustomRealm;

@Service
@Transactional
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private CustomRealm customRealm;

	@Override
	public List<Role> queryAllRoles() throws Exception {
		return roleMapper.queryAllRoles();
	}

	@Override
	public List<Permission> queryAllPermission() throws Exception {
		return roleMapper.queryAllPermission();
	}

	@Override
	public List<Permission> queryPermissionByRoleID(int roleID) throws Exception {
		return roleMapper.queryPermissionByRoleID(roleID);
	}

	//修改角色拥有的权限
	@Override
	public void updateRolePermission(int roleID, String permissionIDs, String account) throws Exception{
		//修改后的权限
		String[] permissionStrArr = permissionIDs.split(",");
		List<Integer> newPermissions = new ArrayList<Integer>();
		for(String permissionStr:permissionStrArr){
			newPermissions.add(Integer.parseInt(permissionStr));
		}
		
		//数据库中已存在的 该角色拥有的权限
		List<Permission> rolePermissions = roleMapper.queryPermissionByRoleID(roleID);
		List<Integer> oldPermissions = new ArrayList<Integer>();
		for(Permission permission:rolePermissions){
			if(newPermissions.contains(permission.getId())){
				//修改后有该权限,做更新操作
				RolePermission rp = new RolePermission();
				rp.setUpdater(account);
				rp.setUpdateDate(new Date());
				rp.setRoleID(roleID);
				rp.setPermissionID(permission.getId());
				roleMapper.updateRolePermission(rp);
			}else{
				//修改后没有该权限,做删除操作
				RolePermission rp = new RolePermission();
				rp.setUpdater(account);
				rp.setUpdateDate(new Date());
				rp.setRoleID(roleID);
				rp.setPermissionID(permission.getId());
				roleMapper.deleteRolePermission(rp);
			}
			oldPermissions.add(permission.getId());
		}
		
		//修改后的权限
		for(Integer p:newPermissions){
			if(oldPermissions.contains(p)){
				//权限已存在，做更新操作。由于上述代码已做修改操作，此处不采取任何操作
			}else{
				//修改前没有该权限，做插入操作
				RolePermission rp = new RolePermission();
				rp.setRoleID(roleID);
				rp.setPermissionID(p);
				rp.setAuthor(account);
				rp.setUpdater(account);
				rp.setCreateTime(new Date());
				rp.setCreateDate(new Date());
				rp.setUpdateDate(new Date());
				roleMapper.insertRolePermission(rp);
			}
		}
		
		//修改当前登录用户的权限后,清除用户权限
		customRealm.clearCached();
	}

	//为新添加的角色,添加权限
	@Override
	public void insertRolePermission(int roleID, String permissionIDs, String account) throws Exception {
		//待添加的权限的集合
		String[] permissionStrArr = permissionIDs.split(",");
		List<Integer> newPermissions = new ArrayList<Integer>();
		for(String permissionStr:permissionStrArr){
			newPermissions.add(Integer.parseInt(permissionStr));
		}
		//添加权限
		for(Integer p:newPermissions){
			RolePermission rp = new RolePermission();
			rp.setRoleID(roleID);
			rp.setPermissionID(p);
			rp.setAuthor(account);
			rp.setUpdater(account);
			rp.setCreateTime(new Date());
			rp.setCreateDate(new Date());
			rp.setUpdateDate(new Date());
			roleMapper.insertRolePermission(rp);
		}
	}

	//根据角色名称查询角色ID
	@Override
	public Role queryRoleIDByName(String name) throws Exception {
		return roleMapper.queryRoleIDByName(name);
	}

	@Override
	public void updateRoleUnavailable(Role role) throws Exception {
		roleMapper.updateRoleUnavailable(role);
	}

	/**
	 * 添加角色,及角色拥有的权限
	 */
	@Override
	public void insertRole(String name, String permissionIDs, String account) throws Exception {
		//添加角色
		Role role = new Role();
		role.setName(name);
		role.setAuthor(account);
		role.setUpdater(account);
		role.setCreateTime(new Date());
		role.setCreateDate(new Date());
		role.setUpdateDate(new Date());
		roleMapper.insertRole(role);
		//获取角色ID
		int roleID = roleMapper.queryRoleIDByName(name).getId();
		//为该角色添加权限
		insertRolePermission(roleID, permissionIDs, account);
	}

	@Override
	public List<Role> queryRoleByAccount(String account) throws Exception {
		return roleMapper.queryRoleByAccount(account);
	}
}
