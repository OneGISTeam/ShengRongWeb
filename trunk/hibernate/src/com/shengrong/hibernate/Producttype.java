package com.shengrong.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Producttype entity. @author MyEclipse Persistence Tools
 */

public class Producttype implements java.io.Serializable {

	// Fields

	private Integer typeid;
	private String name;
	private String des;
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Producttype() {
	}

	/** minimal constructor */
	public Producttype(String name, String des) {
		this.name = name;
		this.des = des;
	}

	/** full constructor */
	public Producttype(String name, String des, Set products) {
		this.name = name;
		this.des = des;
		this.products = products;
	}

	// Property accessors

	public Integer getTypeid() {
		return this.typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}