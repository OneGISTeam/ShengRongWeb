package com.shengrong.portal.actions;


import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.shengrong.hibernate.Companyprocess;
import com.shengrong.hibernate.CompanyprocessDAO;

public class AboutCompanyAction extends ActionSupport{
	
	private static final long serialVersionUID = 6898261933996435581L;

	private List<Companyprocess> companyprocessList;
	
	public List<Companyprocess> getCompanyprocessList(){
		return this.companyprocessList;
	}
	
	public void setCompanyprocessList(List<Companyprocess> companyprocessList){
		this.companyprocessList = companyprocessList;
	}
	
	
	@SuppressWarnings("unchecked")
	public String execute() {
		CompanyprocessDAO cpDao = new CompanyprocessDAO();
		companyprocessList = cpDao.findAll();
		return SUCCESS;
	}

}
