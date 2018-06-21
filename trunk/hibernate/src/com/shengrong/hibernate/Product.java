package com.shengrong.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer productid;
	private Producttype producttype;
	private Manager manager;
	private String productname;
	private String productmodel;
	private String des;
	private Set productpics = new HashSet(0);
	private Set productparams = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String productname, String productmodel, String des) {
		this.productname = productname;
		this.productmodel = productmodel;
		this.des = des;
	}

	/** full constructor */
	public Product(Producttype producttype, Manager manager,
			String productname, String productmodel, String des,
			Set productpics, Set productparams) {
		this.producttype = producttype;
		this.manager = manager;
		this.productname = productname;
		this.productmodel = productmodel;
		this.des = des;
		this.productpics = productpics;
		this.productparams = productparams;
	}

	// Property accessors

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Producttype getProducttype() {
		return this.producttype;
	}

	public void setProducttype(Producttype producttype) {
		this.producttype = producttype;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductmodel() {
		return this.productmodel;
	}

	public void setProductmodel(String productmodel) {
		this.productmodel = productmodel;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set getProductpics() {
		return this.productpics;
	}

	public void setProductpics(Set productpics) {
		this.productpics = productpics;
	}

	public Set getProductparams() {
		return this.productparams;
	}

	public void setProductparams(Set productparams) {
		this.productparams = productparams;
	}

}