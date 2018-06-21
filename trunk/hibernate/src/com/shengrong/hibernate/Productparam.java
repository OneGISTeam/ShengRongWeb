package com.shengrong.hibernate;

/**
 * Productparam entity. @author MyEclipse Persistence Tools
 */

public class Productparam implements java.io.Serializable {

	// Fields

	private Integer paramid;
	private Product product;
	private String paramname;
	private String paramvalue;

	// Constructors

	/** default constructor */
	public Productparam() {
	}

	/** minimal constructor */
	public Productparam(String paramname, String paramvalue) {
		this.paramname = paramname;
		this.paramvalue = paramvalue;
	}

	/** full constructor */
	public Productparam(Product product, String paramname, String paramvalue) {
		this.product = product;
		this.paramname = paramname;
		this.paramvalue = paramvalue;
	}

	// Property accessors

	public Integer getParamid() {
		return this.paramid;
	}

	public void setParamid(Integer paramid) {
		this.paramid = paramid;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getParamname() {
		return this.paramname;
	}

	public void setParamname(String paramname) {
		this.paramname = paramname;
	}

	public String getParamvalue() {
		return this.paramvalue;
	}

	public void setParamvalue(String paramvalue) {
		this.paramvalue = paramvalue;
	}

}