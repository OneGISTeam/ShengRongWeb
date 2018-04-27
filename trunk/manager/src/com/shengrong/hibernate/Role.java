package com.shengrong.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role implements java.io.Serializable {

	//内部权限说明
	public static int MASTER = 1;//超级管理员
	public static int MANAGER = 2;//普通管理员
		
	// Fields

	private String roleid;
	private String rolename;
	private String des;
	private Set managers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String rolename, String des) {
		this.rolename = rolename;
		this.des = des;
	}

	/** full constructor */
	public Role(String rolename, String des, Set managers) {
		this.rolename = rolename;
		this.des = des;
		this.managers = managers;
	}

	// Property accessors

	public String getRoleid() {
		return this.roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set getManagers() {
		return this.managers;
	}

	public void setManagers(Set managers) {
		this.managers = managers;
	}

}