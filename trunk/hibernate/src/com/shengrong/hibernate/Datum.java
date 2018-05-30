package com.shengrong.hibernate;

import java.sql.Timestamp;

/**
 * Datum entity. @author MyEclipse Persistence Tools
 */

public class Datum implements java.io.Serializable {

	// Fields

	private Integer datumid;
	private Manager manager;
	private String title;
	private String brief;
	private String url;
	private String keywords;
	private Timestamp datetime;

	// Constructors

	/** default constructor */
	public Datum() {
	}

	/** minimal constructor */
	public Datum(String title, String brief, String url, String keywords,
			Timestamp datetime) {
		this.title = title;
		this.brief = brief;
		this.url = url;
		this.keywords = keywords;
		this.datetime = datetime;
	}

	/** full constructor */
	public Datum(Manager manager, String title, String brief, String url,
			String keywords, Timestamp datetime) {
		this.manager = manager;
		this.title = title;
		this.brief = brief;
		this.url = url;
		this.keywords = keywords;
		this.datetime = datetime;
	}

	// Property accessors

	public Integer getDatumid() {
		return this.datumid;
	}

	public void setDatumid(Integer datumid) {
		this.datumid = datumid;
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

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Timestamp getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

}