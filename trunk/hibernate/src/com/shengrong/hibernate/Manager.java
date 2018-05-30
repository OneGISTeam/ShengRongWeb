package com.shengrong.hibernate;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Manager entity. @author MyEclipse Persistence Tools
 */

public class Manager implements java.io.Serializable {

	// Fields

	private String name;
	private Role role;
	private Timestamp regdatetime;
	private Blob portrait;
	private Boolean sex;
	private String password;
	private Boolean permitted;
	private Set datums = new HashSet(0);
	private Set members = new HashSet(0);
	private Set businesses = new HashSet(0);
	private Set teamprocesses = new HashSet(0);
	private Set introductions = new HashSet(0);
	private Set newses = new HashSet(0);
	private Set companyprocesses = new HashSet(0);
	private Set carousels = new HashSet(0);

	// Constructors

	/** default constructor */
	public Manager() {
	}

	/** minimal constructor */
	public Manager(String name, Role role, Timestamp regdatetime,
			Blob portrait, Boolean sex, String password, Boolean permitted) {
		this.name = name;
		this.role = role;
		this.regdatetime = regdatetime;
		this.portrait = portrait;
		this.sex = sex;
		this.password = password;
		this.permitted = permitted;
	}

	/** full constructor */
	public Manager(String name, Role role, Timestamp regdatetime,
			Blob portrait, Boolean sex, String password, Boolean permitted,
			Set datums, Set members, Set businesses, Set teamprocesses,
			Set introductions, Set newses, Set companyprocesses, Set carousels) {
		this.name = name;
		this.role = role;
		this.regdatetime = regdatetime;
		this.portrait = portrait;
		this.sex = sex;
		this.password = password;
		this.permitted = permitted;
		this.datums = datums;
		this.members = members;
		this.businesses = businesses;
		this.teamprocesses = teamprocesses;
		this.introductions = introductions;
		this.newses = newses;
		this.companyprocesses = companyprocesses;
		this.carousels = carousels;
	}

	// Property accessors

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Timestamp getRegdatetime() {
		return this.regdatetime;
	}

	public void setRegdatetime(Timestamp regdatetime) {
		this.regdatetime = regdatetime;
	}

	public Blob getPortrait() {
		return this.portrait;
	}

	public void setPortrait(Blob portrait) {
		this.portrait = portrait;
	}

	public Boolean getSex() {
		return this.sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getPermitted() {
		return this.permitted;
	}

	public void setPermitted(Boolean permitted) {
		this.permitted = permitted;
	}

	public Set getDatums() {
		return this.datums;
	}

	public void setDatums(Set datums) {
		this.datums = datums;
	}

	public Set getMembers() {
		return this.members;
	}

	public void setMembers(Set members) {
		this.members = members;
	}

	public Set getBusinesses() {
		return this.businesses;
	}

	public void setBusinesses(Set businesses) {
		this.businesses = businesses;
	}

	public Set getTeamprocesses() {
		return this.teamprocesses;
	}

	public void setTeamprocesses(Set teamprocesses) {
		this.teamprocesses = teamprocesses;
	}

	public Set getIntroductions() {
		return this.introductions;
	}

	public void setIntroductions(Set introductions) {
		this.introductions = introductions;
	}

	public Set getNewses() {
		return this.newses;
	}

	public void setNewses(Set newses) {
		this.newses = newses;
	}

	public Set getCompanyprocesses() {
		return this.companyprocesses;
	}

	public void setCompanyprocesses(Set companyprocesses) {
		this.companyprocesses = companyprocesses;
	}

	public Set getCarousels() {
		return this.carousels;
	}

	public void setCarousels(Set carousels) {
		this.carousels = carousels;
	}

}