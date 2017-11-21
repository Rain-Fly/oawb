package com.feicui.oawb.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.feicui.oawb.dao.RoleMapper;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;
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
}
