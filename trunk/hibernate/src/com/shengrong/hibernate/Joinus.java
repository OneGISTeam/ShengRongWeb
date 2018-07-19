package com.shengrong.hibernate;

/**
 * Joinus entity. @author MyEclipse Persistence Tools
 */

public class Joinus implements java.io.Serializable {

	// Fields

	private Integer joinusid;
	private String name;
	private String company;
	private String email;
	private String phone;
	private String comment;

	// Constructors

	/** default constructor */
	public Joinus() {
	}

	/** minimal constructor */
	public Joinus(String name, String phone) {
		this.name = name;
		this.phone = phone;
	}

	/** full constructor */
	public Joinus(String name, String company, String email, String phone,
			String comment) {
		this.name = name;
		this.company = company;
		this.email = email;
		this.phone = phone;
		this.comment = comment;
	}

	// Property accessors

	public Integer getJoinusid() {
		return this.joinusid;
	}

	public void setJoinusid(Integer joinusid) {
		this.joinusid = joinusid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}