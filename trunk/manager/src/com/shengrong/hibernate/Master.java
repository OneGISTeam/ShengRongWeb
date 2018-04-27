package com.shengrong.hibernate;

/**
 * Master entity. @author MyEclipse Persistence Tools
 */

public class Master implements java.io.Serializable {

	// Fields

	private String mastername;
	private Role role;
	private String password;

	// Constructors

	/** default constructor */
	public Master() {
	}

	/** minimal constructor */
	public Master(String mastername, String password) {
		this.mastername = mastername;
		this.password = password;
	}

	/** full constructor */
	public Master(String mastername, Role role, String password) {
		this.mastername = mastername;
		this.role = role;
		this.password = password;
	}

	// Property accessors

	public String getMastername() {
		return this.mastername;
	}

	public void setMastername(String mastername) {
		this.mastername = mastername;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}