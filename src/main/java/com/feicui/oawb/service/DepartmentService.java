package com.feicui.oawb.service;

import com.feicui.oawb.po.Department;

public interface DepartmentService {
	//添加部门
	public void insertDepartment(Department department) throws Exception;
	//修改部门信息
	public void updateDepartment(Department department) throws Exception;
	//根据部门编号删除部门
	public void deleteDepartment(int id) throws Exception;
	//根据部门编号查询部门信息
	public Department queryDepartmentInfoByID(int id) throws Exception;
}
