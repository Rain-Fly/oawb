package com.feicui.oawb.dao;

import java.util.List;

import com.feicui.oawb.po.Company;

public interface CompanyMapper {
	//添加公司
	public void insertCompany(Company company) throws Exception;
	//修改公司信息
	public void updateCompany(Company company) throws Exception;
	//根据公司id查询公司信息
	public Company queryCompanyById(String id) throws Exception;
	//根据公司id删除公司
	public void deleteCompany(Company company) throws Exception;
	//查询所有公司信息
	public List<Company> queryAllCompanies() throws Exception;
}
