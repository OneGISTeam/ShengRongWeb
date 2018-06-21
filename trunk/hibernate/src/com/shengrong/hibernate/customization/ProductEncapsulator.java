package com.shengrong.hibernate.customization;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.shengrong.hibernate.Product;
import com.shengrong.hibernate.Productparam;
import com.shengrong.hibernate.Productpic;
import com.shengrong.hibernate.Producttype;
import com.shengrong.hibernate.ProducttypeDAO;

public class ProductEncapsulator extends Product implements Encapsulator<Product> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1053831091693894767L;
	
	private List<ProductpicEncapsulator> encpProductpics = new ArrayList<ProductpicEncapsulator>();
	
	private List<Productparam> encpProductparams = new ArrayList<Productparam>();
	
	private int productTypeID;
	
	public List<Productparam> getEncpProductparams(){
		return this.encpProductparams;
	}
	
	public void setEncpProductparams(List<Productparam> encpProductparams){
		this.encpProductparams = encpProductparams;
	}
	
	public int getProductTypeID(){
		return this.productTypeID;
	}
	
	public void setProductTypeID(int productTypeID){
		this.productTypeID = productTypeID;
	}
	
	public List<ProductpicEncapsulator> getEncpProductpics(){
		return this.encpProductpics;
	}
	
	public void setEncpProductpics(List<ProductpicEncapsulator> encpProductpics){
		this.encpProductpics = encpProductpics;
	}
	
	@Override
	public Product dataDecapsulate() {
		// TODO Auto-generated method stub
		Product product = new Product();
		product.setDes(this.getDes());
		product.setProductmodel(this.getProductmodel());
		product.setProductname(this.getProductname());
		product.setProductparams(this.getProductparams());
		
		Iterator<ProductpicEncapsulator> iter = encpProductpics.iterator();
		Set<Productpic> productpic = new HashSet<Productpic>(0);
		while(iter.hasNext()){
			ProductpicEncapsulator encpPdp = iter.next();
			Productpic pp = encpPdp.dataDecapsulate();
			pp.setProduct(product);
			productpic.add(pp);
		}
		product.setProductpics(productpic);
		
		Iterator<Productparam> iter2 = encpProductparams.iterator();
		Set<Productparam> productparam = new HashSet<Productparam>(0);
		while(iter2.hasNext()){
			Productparam pp = iter2.next();
			pp.setProduct(product);
			productparam.add(pp);
		}
		product.setProductparams(productparam);
		
		ProducttypeDAO productTypeDao = new ProducttypeDAO();
		Producttype pt = productTypeDao.findById(this.productTypeID);
		product.setProducttype(pt);
		
		return product;
	}

}
