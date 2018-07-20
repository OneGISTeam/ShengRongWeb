package com.shengrong.manager.actions;

import java.util.List;

import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Producttype;
import com.shengrong.hibernate.ProducttypeDAO;

public class ProductTypeAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1532191987258019583L;
	
	private List<Producttype> producttypeList;
	
	private Producttype producttype;
	
	public Producttype getProducttype(){
		return this.producttype;
	}
	
	public void setProducttype(Producttype producttype){
		this.producttype = producttype;
	}
	
	public List<Producttype> getProducttypeList(){
		return this.producttypeList;
	}
	
	public void setProducttypeList(List<Producttype> producttypeList){
		this.producttypeList = producttypeList;
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		ProducttypeDAO producttypeDao = new ProducttypeDAO();
		producttypeList = producttypeDao.findAll();
		
		return SUCCESS;
	}
	
	public String save(){
		if(this.producttype == null){
			this.setMessage("产品类型为null！");
			this.setHref("product/producttype.action");
			return ERROR;
		}
		
		ProducttypeDAO producttypeDao = new ProducttypeDAO();
		Transaction tx = producttypeDao.getSession().getTransaction();
		tx.begin();
		producttypeDao.save(producttype);
		tx.commit();
		producttypeDao.getSession().close();
		
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("id") == null ||
				request.getParameter("id").equals("")){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
			this.setResult(root.toString());
			return SUCCESS;
		};
		
		int id = Integer.parseInt(request.getParameter("id"));
		ProducttypeDAO producttypeDao = new ProducttypeDAO();
		this.producttype = producttypeDao.findById(id);
		
		if(producttype == null){
			root.put("code", "400");
			root.put("msg", "没有标识号为：" + id + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		Transaction tx = producttypeDao.getSession().getTransaction();
		tx.begin();
		producttypeDao.delete(producttype);
		tx.commit();
		producttypeDao.getSession().close();
		root.put("code", "200");
		root.put("msg", "删除成功！");
		
		this.setResult(root.toString());
		return SUCCESS;
	}
}
