package com.shengrong.hibernate;

import java.sql.Timestamp;

/**
 * Recruitapply entity. @author MyEclipse Persistence Tools
 */

public class Recruitapply implements java.io.Serializable {

	// Fields

	private Integer applyid;
	private Recruit recruit;
	private String applyname;
	private Boolean applysex;
	private String applynation;
	private String applynative;
	private String applyeducation;
	private String applyemail;
	private String applyphone;
	private String applyresume;
	private Timestamp applydatetime;

	// Constructors

	/** default constructor */
	public Recruitapply() {
	}

	/** minimal constructor */
	public Recruitapply(Recruit recruit, String applyname,
			String applyeducation, String applyphone, Timestamp applydatetime) {
		this.recruit = recruit;
		this.applyname = applyname;
		this.applyeducation = applyeducation;
		this.applyphone = applyphone;
		this.applydatetime = applydatetime;
	}

	/** full constructor */
	public Recruitapply(Recruit recruit, String applyname, Boolean applysex,
			String applynation, String applynative, String applyeducation,
			String applyemail, String applyphone, String applyresume,
			Timestamp applydatetime) {
		this.recruit = recruit;
		this.applyname = applyname;
		this.applysex = applysex;
		this.applynation = applynation;
		this.applynative = applynative;
		this.applyeducation = applyeducation;
		this.applyemail = applyemail;
		this.applyphone = applyphone;
		this.applyresume = applyresume;
		this.applydatetime = applydatetime;
	}

	// Property accessors

	public Integer getApplyid() {
		return this.applyid;
	}

	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
	}

	public Recruit getRecruit() {
		return this.recruit;
	}

	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	public String getApplyname() {
		return this.applyname;
	}

	public void setApplyname(String applyname) {
		this.applyname = applyname;
	}

	public Boolean getApplysex() {
		return this.applysex;
	}

	public void setApplysex(Boolean applysex) {
		this.applysex = applysex;
	}

	public String getApplynation() {
		return this.applynation;
	}

	public void setApplynation(String applynation) {
		this.applynation = applynation;
	}

	public String getApplynative() {
		return this.applynative;
	}

	public void setApplynative(String applynative) {
		this.applynative = applynative;
	}

	public String getApplyeducation() {
		return this.applyeducation;
	}

	public void setApplyeducation(String applyeducation) {
		this.applyeducation = applyeducation;
	}

	public String getApplyemail() {
		return this.applyemail;
	}

	public void setApplyemail(String applyemail) {
		this.applyemail = applyemail;
	}

	public String getApplyphone() {
		return this.applyphone;
	}

	public void setApplyphone(String applyphone) {
		this.applyphone = applyphone;
	}

	public String getApplyresume() {
		return this.applyresume;
	}

	public void setApplyresume(String applyresume) {
		this.applyresume = applyresume;
	}

	public Timestamp getApplydatetime() {
		return this.applydatetime;
	}

	public void setApplydatetime(Timestamp applydatetime) {
		this.applydatetime = applydatetime;
	}

}