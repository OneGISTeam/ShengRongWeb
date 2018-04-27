package com.shengrong.hibernate;

import java.sql.Timestamp;

/**
 * Business entity. @author MyEclipse Persistence Tools
 */

public class Business implements java.io.Serializable {

	// Fields

	private Integer businessid;
	private Manager manager;
	private String name;
	private String des;
	private String icon;
	private Timestamp datetime;

	// Constructors

	/** default constructor */
	public Business() {
	}

	/** full constructor */
	public Business(Manager manager, String name, String des, String icon,
			Timestamp datetime) {
		this.manager = manager;
		this.name = name;
		this.des = des;
		this.icon = icon;
		this.datetime = datetime;
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

}