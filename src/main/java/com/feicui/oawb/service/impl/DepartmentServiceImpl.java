package com.feicui.oawb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import com.feicui.oawb.dao.DepartmentMapper;
import com.feicui.oawb.po.Department;
import com.feicui.oawb.service.DepartmentService;

public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	private DepartmentMapper departmentMapper;

	public void insertDepartment(Department department) throws Exception {
		departmentMapper.insertDepartment(department);
	}

	public void updateDepartment(Department department) throws Exception {
		departmentMapper.updateDepartment(department);
	}

	public void deleteDepartment(int id) throws Exception {
		departmentMapper.deleteDepartment(id);
	}

	public Department queryDepartmentInfoByID(int id) throws Exception {
		return departmentMapper.queryDepartmentInfoByID(id);
	}

}
