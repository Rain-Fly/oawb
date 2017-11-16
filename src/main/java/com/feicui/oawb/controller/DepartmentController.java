package com.feicui.oawb.controller;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/insertDepartment")
	public String insertDepartment(Department department,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		department.setAuthor(activeUser.getAccount());
		department.setUpdater(activeUser.getAccount());
		department.setCreateTime(new Date());
		department.setCreateDate(new Date());
		department.setUpdateDate(new Date());
		
		departmentService.insertDepartment(department);
		return "welcome";
	}
}
