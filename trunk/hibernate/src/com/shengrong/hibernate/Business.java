package com.shengrong.hibernate;

import java.sql.Timestamp;

/**
 * Business entity. @author MyEclipse Persistence Tools
 */

public class Business implements java.io.Serializable {

	// Fields

	private Integer businessid;
	private Manager manager;
	private String des;
	private String icon;
	private Timestamp datetime;
	private String businessname;

	// Constructors

	/** default constructor */
	public Business() {
	}

	/** minimal constructor */
	public Business(String des, String icon, Timestamp datetime,
			String businessname) {
		this.des = des;
		this.icon = icon;
		this.datetime = datetime;
		this.businessname = businessname;
	}

	/** full constructor */
	public Business(Manager manager, String des, String icon,
			Timestamp datetime, String businessname) {
		this.manager = manager;
		this.des = des;
		this.icon = icon;
		this.datetime = datetime;
		this.businessname = businessname;
	}

	// Property accessors

	public Integer getBusinessid() {
		return this.businessid;
	}

	public void setBusinessid(Integer businessid) {
		this.businessid = businessid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Timestamp getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getBusinessname() {
		return this.businessname;
	}

	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}

}