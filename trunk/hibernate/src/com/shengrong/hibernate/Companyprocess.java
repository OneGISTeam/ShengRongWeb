package com.shengrong.hibernate;

import java.sql.Blob;
import java.util.Date;

/**
 * Companyprocess entity. @author MyEclipse Persistence Tools
 */

public class Companyprocess implements java.io.Serializable {

	// Fields

	private Integer processid;
	private Manager manager;
	private String title;
	private String brief;
	private Date date;
	private Blob image;

	// Constructors

	/** default constructor */
	public Companyprocess() {
	}

	/** minimal constructor */
	public Companyprocess(String title, String brief, Date date, Blob image) {
		this.title = title;
		this.brief = brief;
		this.date = date;
		this.image = image;
	}

	/** full constructor */
	public Companyprocess(Manager manager, String title, String brief,
			Date date, Blob image) {
		this.manager = manager;
		this.title = title;
		this.brief = brief;
		this.date = date;
		this.image = image;
	}

	// Property accessors

	public Integer getProcessid() {
		return this.processid;
	}

	public void setProcessid(Integer processid) {
		this.processid = processid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Blob getImage() {
		return this.image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

}