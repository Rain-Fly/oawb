package com.feicui.oawb.dao;

import java.util.List;

import com.feicui.oawb.po.Department;

public interface DepartmentMapper {
	//添加部门
	public void insertDepartment(Department department) throws Exception;
	//修改部门信息
	public void updateDepartment(Department department) throws Exception;
	//根据部门编号删除部门(假删除)
	public void deleteDepartment(Department department) throws Exception;
	//根据部门编号查询部门信息
	public Department queryDepartmentInfoByID(int id) throws Exception;
	//查询所有的部门信息
	public List<Department> queryAllDepartments() throws Exception;
}
