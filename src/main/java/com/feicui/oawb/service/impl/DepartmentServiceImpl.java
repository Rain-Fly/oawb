package com.feicui.oawb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.feicui.oawb.dao.DepartmentMapper;
import com.feicui.oawb.po.Department;
import com.feicui.oawb.service.DepartmentService;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	private DepartmentMapper departmentMapper;

	public void insertDepartment(Department department) throws Exception {
		departmentMapper.insertDepartment(department);
	}

	public void updateDepartment(Department department) throws Exception {
		departmentMapper.updateDepartment(department);
	}

	public void deleteDepartment(Department department) throws Exception {
		departmentMapper.deleteDepartment(department);
	}

	public Department queryDepartmentInfoByID(int id) throws Exception {
		return departmentMapper.queryDepartmentInfoByID(id);
	}

	public List<Department> queryAllDepartments() throws Exception {
		return departmentMapper.queryAllDepartments();
	}

}
