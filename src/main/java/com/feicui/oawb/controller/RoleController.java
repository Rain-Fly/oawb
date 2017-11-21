package com.feicui.oawb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.Role;
import com.feicui.oawb.service.RoleService;

/**
 * 角色管理
 * @author 李琳茹
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	/**
	 * 去角色查询页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toRoleQuery")
	public String toRoleQuery(Model model) throws Exception{
		List<Role> roles = roleService.queryAllRoles();
		List<Permission> permissions = roleService.queryAllPermission();
		model.addAttribute("roles", roles);
		model.addAttribute("permissions", permissions);
		return "roleQuery";
	}
	
	@RequestMapping("/queryPermissionByRoleID")
	public String queryPermissionByRoleID(int roleID,Model model) throws Exception{
		List<Role> roles = roleService.queryAllRoles();
		List<Permission> permissions = roleService.queryAllPermission();
		List<Permission> rolePermissions = roleService.queryPermissionByRoleID(roleID);
		model.addAttribute("roles", roles);
		model.addAttribute("permissions", permissions);
		model.addAttribute("rolePermissions", rolePermissions);
		model.addAttribute("roleID", roleID);
		return "roleQuery";
	}

}
