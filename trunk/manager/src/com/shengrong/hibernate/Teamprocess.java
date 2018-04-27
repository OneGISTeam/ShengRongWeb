package com.shengrong.hibernate;

import java.sql.Blob;
import java.util.Date;

/**
 * Teamprocess entity. @author MyEclipse Persistence Tools
 */

public class Teamprocess implements java.io.Serializable {

	// Fields

	private Integer processid;
	private Manager manager;
	private String location;
	private Blob pos;
	private String brief;
	private Date date;
	private Blob image;

	// Constructors

	/** default constructor */
	public Teamprocess() {
	}

	/** minimal constructor */
	public Teamprocess(String location, String brief, Date date) {
		this.location = location;
		this.brief = brief;
		this.date = date;
	}

	/** full constructor */
	public Teamprocess(Manager manager, String location, Blob pos,
			String brief, Date date, Blob image) {
		this.manager = manager;
		this.location = location;
		this.pos = pos;
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

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Blob getPos() {
		return this.pos;
	}

	public void setPos(Blob pos) {
		this.pos = pos;
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