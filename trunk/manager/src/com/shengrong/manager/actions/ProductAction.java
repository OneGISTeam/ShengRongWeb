package com.shengrong.manager.actions;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Product;
import com.shengrong.hibernate.ProductDAO;
import com.shengrong.hibernate.Productparam;
import com.shengrong.hibernate.ProductparamDAO;
import com.shengrong.hibernate.Productpic;
import com.shengrong.hibernate.ProductpicDAO;
import com.shengrong.hibernate.Producttype;
import com.shengrong.hibernate.ProducttypeDAO;
import com.shengrong.hibernate.customization.ProductEncapsulator;
import com.shengrong.hibernate.customization.ProductpicEncapsulator;

public class ProductAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 95160154460825081L;

	private ProductEncapsulator encpProduct;
	
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
	
	public ProductEncapsulator getEncpProduct(){
		return this.encpProduct;
	}
	
	public void setEncpProduct(ProductEncapsulator encpProduct){
		this.encpProduct = encpProduct;
	}
	
	public String execute(){
		ProducttypeDAO  producttypeDao = new ProducttypeDAO();
		List<Producttype> producttypeList = producttypeDao.findAll();
		
		for(int i=0;i<producttypeList.size();i++){
			producttypeMap.put(producttypeList.get(i).getTypeid(), producttypeList.get(i).getName());
		}
		return SUCCESS;
	}
	
	public String save(){
		ProductDAO productDao = new ProductDAO();
		Product product = encpProduct.dataDecapsulate();
		product.setManager(getManager());
		
		Transaction tx_product = productDao.getSession().getTransaction();
		tx_product.begin();
		productDao.save(product);
		tx_product.commit();
		productDao.getSession().close();
		
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
				this.setMessage("系统中没有任何产品类型，请先创建至少一个产品类型！");
				return ERROR;
			}
		}else{
			producttype = producttypeDao.findById(currenttypeID);
		}
		return SUCCESS;
	}
	
	public String editPage(){
		if(this.currentproductID == null){
			this.setHref("product/products.action");
			this.setMessage("产品ID为空！");
			return ERROR;
		}
		
		ProductDAO productDao = new ProductDAO();
		this.currentProduct = productDao.findById(currentproductID);
		if(this.currentProduct == null){
			this.setHref("product/products.action");
			this.setMessage("没有标识为：" + this.currentproductID + "的产品！");
			return ERROR;
		}
		
		this.execute();
	
		return SUCCESS;
	}
	
	public String saveOrUpdate(){
		if(currentproductID == null){
			this.setHref("product/products.action");
			this.setMessage("产品ID为空！");
			return ERROR;
		}
		
		ProductDAO productDao = new ProductDAO();
		this.currentProduct = productDao.findById(currentproductID);
		
		Product product = encpProduct.dataDecapsulate();
		
		this.currentProduct.setDes(product.getDes());
		this.currentProduct.setManager(getManager());
		this.currentProduct.setProductmodel(product.getProductmodel());
		this.currentProduct.setProductname(product.getProductname());
		this.currentProduct.setProductparams(product.getProductparams());
		this.currentProduct.setProductpics(product.getProductpics());
		this.currentProduct.setProducttype(product.getProducttype());
		
		Transaction tx_product = productDao.getSession().getTransaction();
		tx_product.begin();
		productDao.getSession().saveOrUpdate(this.currentProduct);
		tx_product.commit();
		productDao.getSession().close();
		
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(currentproductID == null){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		ProductDAO productDao = new ProductDAO();
		this.currentProduct = productDao.findById(currentproductID);
		if(this.currentProduct == null){
			root.put("code", "400");
			root.put("msg", "没有标识为：" + currentProduct + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		Transaction tx = productDao.getSession().getTransaction();
		tx.begin();
		productDao.delete(currentProduct);
		tx.commit();
		productDao.getSession().close();
		
		root.put("code", "200");
		root.put("msg", "操作成功！");
		this.setResult(root.toString());
		
		return SUCCESS;
	}
}
