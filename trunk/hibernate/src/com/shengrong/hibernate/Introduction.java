package com.shengrong.hibernate;

import java.sql.Timestamp;

/**
 * Introduction entity. @author MyEclipse Persistence Tools
 */

public class Introduction implements java.io.Serializable {

	// Fields

	private Integer introductionid;
	private Manager manager;
	private String content;
	private Timestamp datetime;

	// Constructors

	/** default constructor */
	public Introduction() {
	}

	/** minimal constructor */
	public Introduction(String content, Timestamp datetime) {
		this.content = content;
		this.datetime = datetime;
	}

	/** full constructor */
	public Introduction(Manager manager, String content, Timestamp datetime) {
		this.manager = manager;
		this.content = content;
		this.datetime = datetime;
	}

	// Property accessors

	public Integer getIntroductionid() {
		return this.introductionid;
	}

	public void setIntroductionid(Integer introductionid) {
		this.introductionid = introductionid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

}