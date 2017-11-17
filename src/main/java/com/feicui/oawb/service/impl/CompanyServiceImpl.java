package com.feicui.oawb.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.feicui.oawb.dao.CompanyMapper;
import com.feicui.oawb.po.Company;
import com.feicui.oawb.service.CompanyService;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyMapper companyMapper;

	public void insertCompany(Company company) throws Exception {
		companyMapper.insertCompany(company);
	}

	public void updateCompany(Company company) throws Exception {
		companyMapper.updateCompany(company);
	}

	public Company queryCompanyById(String id) throws Exception {
		return companyMapper.queryCompanyById(id);
	}

	public void deleteCompany(Company company) throws Exception {
		companyMapper.deleteCompany(company);
	}

	public List<Company> queryAllCompanies() throws Exception {
		return companyMapper.queryAllCompanies();
	}

}
