package com.shengrong.manager.actions;

import java.util.List;

import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Companyprocess;
import com.shengrong.hibernate.CompanyprocessDAO;
import com.shengrong.hibernate.customization.CompanyprocessEncapsulator;

public class AboutCompanyAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6898261933996435581L;

	List<Companyprocess> companyprocessList;
	
	CompanyprocessEncapsulator encpComProcess;
	
	public CompanyprocessEncapsulator getEncpComProcess(){
		return this.encpComProcess;
	}
	
	public void setEncpComProcess(CompanyprocessEncapsulator encpComProcess){
		this.encpComProcess = encpComProcess;
	}
	
	public List<Companyprocess> getCompanyprocessList(){
		return this.companyprocessList;
	}
	
	public void setCompanyprocessList(List<Companyprocess> companyprocessList){
		this.companyprocessList = companyprocessList;
	}
	
	/**
	 * 跳转关于公司页面
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String execute(){
		CompanyprocessDAO cpDao = new CompanyprocessDAO();
		companyprocessList = cpDao.findAll();
		return SUCCESS;
	}
	
	public String save(){
		Companyprocess cp = this.encpComProcess.dataDecapsulate();
		cp.setManager(getManager());
		
		CompanyprocessDAO cpDao = new CompanyprocessDAO();
		Transaction tx = cpDao.getSession().getTransaction();
		tx.begin();
		cpDao.save(cp);
		tx.commit();
		cpDao.getSession().close();
		
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("cpid") == null ||
				request.getParameter("cpid").equals("")){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		int cpid = Integer.parseInt(request.getParameter("cpid"));
		CompanyprocessDAO cpDao = new CompanyprocessDAO();
		Companyprocess cp = cpDao.findById(cpid);
		if(cp == null){
			root.put("code", "400");
			root.put("msg", "没有标识为" + cpid + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		Transaction tx = cpDao.getSession().getTransaction();
		tx.begin();
		cpDao.delete(cp);
		tx.commit();
		cpDao.getSession().close();

		root.put("code", "200");
		root.put("msg", "操作成功！");
		this.setResult(root.toString());
		return SUCCESS;
	}
}
