package com.shengrong.hibernate;

import java.sql.Blob;

/**
 * Productpic entity. @author MyEclipse Persistence Tools
 */

public class Productpic implements java.io.Serializable {

	// Fields

	private Integer picid;
	private Product product;
	private Blob pic;
	private Boolean mainpic;

	// Constructors

	/** default constructor */
	public Productpic() {
	}

	/** minimal constructor */
	public Productpic(Blob pic, Boolean mainpic) {
		this.pic = pic;
		this.mainpic = mainpic;
	}

	/** full constructor */
	public Productpic(Product product, Blob pic, Boolean mainpic) {
		this.product = product;
		this.pic = pic;
		this.mainpic = mainpic;
	}

	// Property accessors

	public Integer getPicid() {
		return this.picid;
	}

	public void setPicid(Integer picid) {
		this.picid = picid;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Blob getPic() {
		return this.pic;
	}

	public void setPic(Blob pic) {
		this.pic = pic;
	}

	public Boolean getMainpic() {
		return this.mainpic;
	}

	public void setMainpic(Boolean mainpic) {
		this.mainpic = mainpic;
	}

}