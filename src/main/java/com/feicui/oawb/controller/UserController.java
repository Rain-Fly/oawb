package com.feicui.oawb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feicui.oawb.po.ActiveUser;
import com.feicui.oawb.po.Company;
import com.feicui.oawb.po.Department;
import com.feicui.oawb.po.Role;
import com.feicui.oawb.po.User;
import com.feicui.oawb.service.CompanyService;
import com.feicui.oawb.service.DepartmentService;
import com.feicui.oawb.service.RoleService;
import com.feicui.oawb.service.UserService;
import com.feicui.oawb.utils.Common;

/**
 * 用户管理
 * @author 李琳茹
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	/**
	 * 去添加用户页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toInsertUser")
	@RequiresPermissions("user:insert")
	public String toInsertUser(Model model) throws Exception{
		List<Company> companies = companyService.queryAllCompanies();
		List<Department> departments = departmentService.queryAllDepartments();
		List<Role> roles = roleService.queryAllRoles();
		model.addAttribute("companies", companies);
		model.addAttribute("departments", departments);
		model.addAttribute("roles", roles);
		return "insertUser";
	}
	
	/**
	 * 添加用户,及用户拥有的角色信息
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertUser")
	@RequiresPermissions("user:insert")
	public String insertUser(User user,String[] roleIDs,HttpServletRequest request) throws Exception{
		User u = userService.queryUserByAccount(user.getAccount());
		if(u!=null){
			request.getSession().setAttribute("userMsg", "用户已存在,请勿重复添加!");
			return "forward:toInsertUser";
		}
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		userService.insertUser(user,roleIDs,activeUser.getAccount());
		return "forward:queryAllUsers";
	}
	
	/**
	 * 查询所有用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllUsers")
	@RequiresPermissions("user:query")
	public String queryAllUsers(Model model) throws Exception{
		List<User> users = userService.queryAllUsers();
		model.addAttribute("users", users);
		return "allUsers";
	}
	
	/**
	 * 去修改用户信息的页面
	 * @param account
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toUpdateUser")
	@RequiresPermissions("user:update")
	public String toUpdateUser(String account,Model model) throws Exception{
		User user = userService.queryUserByAccount(account);
		List<Company> companies = companyService.queryAllCompanies();
		List<Department> departments = departmentService.queryAllDepartments();
		model.addAttribute("user", user);
		model.addAttribute("companies", companies);
		model.addAttribute("departments", departments);
		return "updateUser";
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUser")
	@RequiresPermissions("user:update")
	public String updateUser(User user,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		user.setUpdater(activeUser.getAccount());
		user.setUpdateDate(new Date());
		userService.updateUser(user);
		return "forward:queryAllUsers";
	}
	
	/**
	 * 删除用户
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteUser")
	@RequiresPermissions("user:delete")
	public String deleteUser(String account) throws Exception{
		User user = userService.queryUserByAccount(account);
		if(user!=null){
			userService.deleteUser(user.getAccount());
		}
		return "forward:queryAllUsers";
	}
	
	/**
	 * 重置密码
	 * @param password
	 * @param newPassword
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/resetPassword")
	@RequiresPermissions("password:reset")
	public String resetPassword(String password,String newPassword,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		User user = userService.queryUserByAccount(activeUser.getAccount());
		Md5Hash md5Hash = new Md5Hash(password, user.getSalt(), Common.hashIterations);
		if(!(md5Hash.toString().equals(user.getPassword()))){
			request.getSession().setAttribute("pwdMsg", "原始密码错误！");
			return "resetPassword";
		}
		
		String salt = System.currentTimeMillis()+"";
		Md5Hash md5Hash2 = new Md5Hash(newPassword, salt, Common.hashIterations);
		user.setPassword(md5Hash2.toString());
		user.setSalt(salt);
		
		userService.resetPassword(user);
		return "welcome";
	}
	
	/**
	 * to用户查询角色页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toUserRole")
	@RequiresPermissions("user:queryRole")
	public String toUserRole(Model model) throws Exception{
		List<User> users = userService.queryAllUsers();
		List<Role> roles = roleService.queryAllRoles();
		model.addAttribute("users", users);
		model.addAttribute("roles", roles);
		return "userRoleQuery";
	}
	
	/**
	 * 根据Account查询用户拥有的角色
	 * @param account
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryRoleByAccount")
	@RequiresPermissions("user:queryRole")
	public String queryRoleByAccount(User user,Model model) throws Exception{
		List<Role> userRoles = roleService.queryRoleByAccount(user.getAccount());
		List<Role> roles = roleService.queryAllRoles();
		List<User> users = userService.queryAllUsers();
		model.addAttribute("account", user.getAccount());
		model.addAttribute("userRoles", userRoles);
		model.addAttribute("roles", roles);
		model.addAttribute("users", users);
		return "userRoleQuery";
	}
	
	/**
	 * 修改用户拥有的角色
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUserRole")
	@RequiresPermissions("user:updateRole")
	public String updateUserRole(HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		String account = request.getParameter("account");
		String roleIDs = request.getParameter("roleIDs");
		userService.updateUserRole(account,roleIDs,activeUser.getAccount());
		return "forward:/welcome";
	}
}
