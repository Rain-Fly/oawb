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

@Service
@Transactional
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;

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
	}
}
