package com.shengrong.portal.actions;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.List;

import com.shengrong.hibernate.Product;
import com.shengrong.hibernate.ProductDAO;
import com.shengrong.hibernate.Productparam;
import com.shengrong.hibernate.ProductparamDAO;
import com.shengrong.hibernate.Productpic;
import com.shengrong.hibernate.ProductpicDAO;
import com.shengrong.hibernate.Producttype;
import com.shengrong.hibernate.ProducttypeDAO;

public class ProductsAction extends ActionBase {
	
    private Producttype producttype;
	
	private Integer currenttypeID;
	
	private Integer currentproductID;
	
	private Product currentProduct;
	
	public Product getCurrentProduct(){
		return this.currentProduct;
	}
	
	public void setCurrentProduct(Product currentProduct){
		this.currentProduct = currentProduct;
	}
	
	public Integer getCurrentproductID(){
		return this.currentproductID;
	}
	
	public void setCurrentproductID(Integer currentproductID){
		this.currentproductID = currentproductID;
	}
	
	private Map<Integer, String> producttypeMap = new HashMap<Integer, String>();
	
	public Map<Integer, String> getProducttypeMap(){
		return this.producttypeMap;
	}
	
	public void setProducttypeMap(Map<Integer, String> producttypeMap){
		this.producttypeMap = producttypeMap;
	}
	
	public Integer getCurrenttypeID(){
		return this.currenttypeID;
	}
	
	public void setCurrenttypeID(Integer currenttypeID){
		this.currenttypeID = currenttypeID;
	}
	
	public Producttype getProducttype(){
		return this.producttype;
	}
	
	public void setProducttype(Producttype producttype){
		this.producttype = producttype;
	}
	
	public String execute(){
		ProducttypeDAO  producttypeDao = new ProducttypeDAO();
		List<Producttype> producttypeList = producttypeDao.findAll();
		for(int i=0;i<producttypeList.size();i++){
			producttypeMap.put(producttypeList.get(i).getTypeid(), producttypeList.get(i).getName());
		}
		return SUCCESS;
	}
	
	public String query(){
		ProducttypeDAO  producttypeDao = new ProducttypeDAO();
		List<Producttype> producttypeList = producttypeDao.findAll();
		for(int i=0;i<producttypeList.size();i++){
			producttypeMap.put(producttypeList.get(i).getTypeid(), producttypeList.get(i).getName());
		}
		if(currenttypeID == null){
			if(producttypeList.size() > 0){
				producttype = producttypeList.get(0);
			}else{
				this.setHref("enter.action");
				this.setMessage("系统中没有任何产品类型");
				return ERROR;
			}
		}else{
			producttype = producttypeDao.findById(currenttypeID);
		}
		return SUCCESS;
	}
	
	public String open(){
		if(this.currentproductID == null){
			this.setHref("products.action");
			this.setMessage("产品ID为空！");
			return ERROR;
		}
		ProductDAO productDao = new ProductDAO();
		this.currentProduct = productDao.findById(currentproductID);
		if(this.currentProduct == null){
			this.setHref("products.action");
			this.setMessage("没有标识为：" + this.currentproductID + "的产品！");
			return ERROR;
		}
		this.execute();
		return SUCCESS;
	}
}
