package com.feicui.oawb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.feicui.oawb.po.ActiveUser;
import com.feicui.oawb.po.Department;
import com.feicui.oawb.service.DepartmentService;

/**
 * 部门管理
 * @author 李琳茹
 *
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 添加部门
	 * @param department
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertDepartment")
	public String insertDepartment(Department department,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		department.setAuthor(activeUser.getAccount());
		department.setUpdater(activeUser.getAccount());
		department.setCreateTime(new Date());
		department.setCreateDate(new Date());
		department.setUpdateDate(new Date());
		
		departmentService.insertDepartment(department);
		return "forward:queryAllDepartments";
	}
	
	/**
	 * 去修改部门信息的页面
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toUpdateDepartment")
	public String toUpdateDepartment(int id,Model model) throws Exception{
		Department department = departmentService.queryDepartmentInfoByID(id);
		model.addAttribute("department", department);
		return "updateDepartment";
	}
	
	/**
	 * 修改部门信息
	 * @param department
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateDepartment")
	public String updateDepartment(Department department,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		department.setUpdater(activeUser.getAccount());
		department.setUpdateDate(new Date());
		
		departmentService.updateDepartment(department);
		return "forward:queryAllDepartments";
	}
	
	/**
	 * 查询所有的部门信息
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllDepartments")
	public String queryAllDepartments(Model model) throws Exception{
		List<Department> departments = departmentService.queryAllDepartments();
		model.addAttribute("departments", departments);
		return "allDepartments";
	}
	
	//根据部门编号删除部门
	@RequestMapping("/deleteDepartment")
	public String deleteDepartment(int id,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		Department department = departmentService.queryDepartmentInfoByID(id);
		department.setUpdater(activeUser.getAccount());
		department.setUpdateDate(new Date());
		
		departmentService.deleteDepartment(department);
		return "forward:queryAllDepartments";
	}
}
