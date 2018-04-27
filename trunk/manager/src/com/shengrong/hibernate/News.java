package com.shengrong.hibernate;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News implements java.io.Serializable {

	// Fields

	private Integer newsid;
	private Manager manager;
	private Date newsdate;
	private Timestamp publishdatetime;
	private String title;
	private String content;
	private Boolean isheadline;
	private Blob image;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(Manager manager, Date newsdate, Timestamp publishdatetime,
			String title, String content, Boolean isheadline, Blob image) {
		this.manager = manager;
		this.newsdate = newsdate;
		this.publishdatetime = publishdatetime;
		this.title = title;
		this.content = content;
		this.isheadline = isheadline;
		this.image = image;
	}

	// Property accessors

	public Integer getNewsid() {
		return this.newsid;
	}

	public void setNewsid(Integer newsid) {
		this.newsid = newsid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Date getNewsdate() {
		return this.newsdate;
	}

	public void setNewsdate(Date newsdate) {
		this.newsdate = newsdate;
	}

	public Timestamp getPublishdatetime() {
		return this.publishdatetime;
	}

	public void setPublishdatetime(Timestamp publishdatetime) {
		this.publishdatetime = publishdatetime;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsheadline() {
		return this.isheadline;
	}

	public void setIsheadline(Boolean isheadline) {
		this.isheadline = isheadline;
	}

	public Blob getImage() {
		return this.image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

}