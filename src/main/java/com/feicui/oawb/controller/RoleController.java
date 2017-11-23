package com.feicui.oawb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feicui.oawb.po.ActiveUser;
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
	
	/**
	 * 根据角色查询该角色所拥有的权限
	 * @param roleID
	 * @param model
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * 修改角色拥有的权限
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateRolePermission")
	public String updateRolePermission(HttpServletRequest request) throws Exception{
		int roleID = Integer.parseInt(request.getParameter("roleID"));
		String permissionIDs = request.getParameter("permissionIDs");
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		roleService.updateRolePermission(roleID,permissionIDs,activeUser.getAccount());
		return "forward:/welcome";
	}
	
	/**
	 * 去添加角色的页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toInsertRole")
	public String toInsertRole(Model model) throws Exception{
		List<Permission> permissions = roleService.queryAllPermission();
		model.addAttribute("permissions", permissions);
		return "insertRole";
	}
	
	/**
	 * 添加角色
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertRole")
	public String insertRole(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name").trim();
		String permissionIDs = request.getParameter("permissionIDs");
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		//判断角色是否已存在
		Role r = roleService.queryRoleIDByName(name);
		if(r!=null){
			request.getSession().setAttribute("roleMsg", "角色已存在,请勿重复添加!");
			return "forward:toInsertRole";
		}
		//添加角色,及该角色拥有的权限
		roleService.insertRole(name,permissionIDs,activeUser.getAccount());
		return "forward:/welcome";
	}
	
	/**
	 * 角色列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllRoles")
	public String queryAllRoles(Model model) throws Exception{
		List<Role> roles = roleService.queryAllRoles();
		model.addAttribute("roles", roles);
		return "queryAllRoles";
	}
	
	/**
	 * 修改角色是否可用
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateRoleAvailable")
	public String updateRoleAvailable(HttpServletRequest request) throws Exception{
		int roleID = Integer.parseInt(request.getParameter("id"));
		int isAvailableInt = Integer.parseInt(request.getParameter("isAvailable"));
		String isAvailable = isAvailableInt==0?"是":"否";
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		Role role = new Role();
		role.setId(roleID);
		role.setUpdater(activeUser.getAccount());
		role.setUpdateDate(new Date());
		role.setIsAvailable(isAvailable);
		roleService.updateRoleUnavailable(role);
		return "forward:/welcome";
	}
}
