package com.shengrong.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Newstype entity. @author MyEclipse Persistence Tools
 */

public class Newstype implements java.io.Serializable {

	// Fields

	private Integer typeid;
	private String name;
	private String des;
	private Set newses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Newstype() {
	}

	/** minimal constructor */
	public Newstype(String name, String des) {
		this.name = name;
		this.des = des;
	}

	/** full constructor */
	public Newstype(String name, String des, Set newses) {
		this.name = name;
		this.des = des;
		this.newses = newses;
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

	public Set getNewses() {
		return this.newses;
	}

	public void setNewses(Set newses) {
		this.newses = newses;
	}

}