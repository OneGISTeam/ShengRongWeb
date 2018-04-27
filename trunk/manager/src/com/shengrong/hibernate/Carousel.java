package com.shengrong.hibernate;

import java.sql.Blob;
import java.sql.Timestamp;

/**
 * Carousel entity. @author MyEclipse Persistence Tools
 */

public class Carousel implements java.io.Serializable {

	// Fields

	private Integer carouselid;
	private Manager manager;
	private String title;
	private String content;
	private Timestamp datetime;
	private Blob image;

	// Constructors

	/** default constructor */
	public Carousel() {
	}

	/** minimal constructor */
	public Carousel(String title, String content, Timestamp datetime, Blob image) {
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.image = image;
	}

	/** full constructor */
	public Carousel(Manager manager, String title, String content,
			Timestamp datetime, Blob image) {
		this.manager = manager;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.image = image;
	}

	// Property accessors

	public Integer getCarouselid() {
		return this.carouselid;
	}

	public void setCarouselid(Integer carouselid) {
		this.carouselid = carouselid;
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

	public Blob getImage() {
		return this.image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

}