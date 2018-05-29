package com.shengrong.hibernate;

import java.sql.Blob;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */

public class Member implements java.io.Serializable {

	// Fields

	private Integer memberid;
	private Manager manager;
	private String membername;
	private String post;
	private Blob image;

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** minimal constructor */
	public Member(String membername, String post, Blob image) {
		this.membername = membername;
		this.post = post;
		this.image = image;
	}

	/** full constructor */
	public Member(Manager manager, String membername, String post, Blob image) {
		this.manager = manager;
		this.membername = membername;
		this.post = post;
		this.image = image;
	}

	// Property accessors

	public Integer getMemberid() {
		return this.memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getMembername() {
		return this.membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Blob getImage() {
		return this.image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

}