package com.feicui.oawb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.feicui.oawb.po.ActiveUser;
import com.feicui.oawb.po.Company;
import com.feicui.oawb.po.User;
import com.feicui.oawb.service.CompanyService;
import com.feicui.oawb.service.UserService;

/**
 * 公司管理
 * @author 李琳茹
 *
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	
	/**
	 * to添加公司页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toInsertCompany")
	public String toInsertCompany(Model model) throws Exception{
		List<User> users = userService.queryAllUsers();
		model.addAttribute("users", users);
		return "insertCompany";
	}
	
	/**
	 * 添加公司
	 * @param company
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertCompany")
	public String insertCompany(Company company,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		company.setAuthor(activeUser.getAccount());
		company.setUpdater(activeUser.getAccount());
		company.setCreateTime(new Date());
		company.setCreateDate(new Date());
		company.setUpdateDate(new Date());
		
		companyService.insertCompany(company);
		return "forward:queryAllCompanies";
	}
	
	/**
	 * 查询所有公司
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllCompanies")
	public String queryAllCompanies(Model model) throws Exception{
		List<Company> companies = companyService.queryAllCompanies();
		model.addAttribute("companies", companies);
		return "allCompanies";
	}
	
	@RequestMapping("/toUpdateCompany")
	public String toUpdateCompany(String id,Model model) throws Exception{
		Company company = companyService.queryCompanyById(id);
		List<User> users = userService.queryAllUsers();
		model.addAttribute("company", company);
		model.addAttribute("users", users);
		return "updateCompany";
	}
	
	@RequestMapping("/updateCompany")
	public String updateCompany(Company company,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		company.setUpdater(activeUser.getAccount());
		company.setUpdateDate(new Date());
		
		companyService.updateCompany(company);
		return "forward:queryAllCompanies";
	}
	
	@RequestMapping("/deleteCompany")
	public String deleteCompany(String id,HttpServletRequest request) throws Exception{
		ActiveUser activeUser = (ActiveUser) request.getSession().getAttribute("activeUser");
		Company company = companyService.queryCompanyById(id);
		company.setUpdater(activeUser.getAccount());
		company.setUpdateDate(new Date());
		
		companyService.deleteCompany(company);
		return "forward:queryAllCompanies";
	}
}
