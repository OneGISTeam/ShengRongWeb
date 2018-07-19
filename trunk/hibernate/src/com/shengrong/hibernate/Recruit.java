package com.shengrong.hibernate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Recruit entity. @author MyEclipse Persistence Tools
 */

public class Recruit implements java.io.Serializable {

	// Fields

	private Integer recruitid;
	private Manager manager;
	private String recruitname;
	private String age;
	private String workplace;
	private String payment;
	private String recruitnumber;
	private Date publishdate;
	private Date deadline;
	private String duty;
	private String requirement;
	private Set recruitapplies = new HashSet(0);

	// Constructors

	/** default constructor */
	public Recruit() {
	}

	/** minimal constructor */
	public Recruit(String recruitname, String age, String workplace,
			String payment, String recruitnumber, Date publishdate,
			Date deadline, String duty, String requirement) {
		this.recruitname = recruitname;
		this.age = age;
		this.workplace = workplace;
		this.payment = payment;
		this.recruitnumber = recruitnumber;
		this.publishdate = publishdate;
		this.deadline = deadline;
		this.duty = duty;
		this.requirement = requirement;
	}

	/** full constructor */
	public Recruit(Manager manager, String recruitname, String age,
			String workplace, String payment, String recruitnumber,
			Date publishdate, Date deadline, String duty, String requirement,
			Set recruitapplies) {
		this.manager = manager;
		this.recruitname = recruitname;
		this.age = age;
		this.workplace = workplace;
		this.payment = payment;
		this.recruitnumber = recruitnumber;
		this.publishdate = publishdate;
		this.deadline = deadline;
		this.duty = duty;
		this.requirement = requirement;
		this.recruitapplies = recruitapplies;
	}

	// Property accessors

	public Integer getRecruitid() {
		return this.recruitid;
	}

	public void setRecruitid(Integer recruitid) {
		this.recruitid = recruitid;
	}

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getRecruitname() {
		return this.recruitname;
	}

	public void setRecruitname(String recruitname) {
		this.recruitname = recruitname;
	}

	public String getAge() {
		return this.age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getWorkplace() {
		return this.workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getPayment() {
		return this.payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getRecruitnumber() {
		return this.recruitnumber;
	}

	public void setRecruitnumber(String recruitnumber) {
		this.recruitnumber = recruitnumber;
	}

	public Date getPublishdate() {
		return this.publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getRequirement() {
		return this.requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public Set getRecruitapplies() {
		return this.recruitapplies;
	}

	public void setRecruitapplies(Set recruitapplies) {
		this.recruitapplies = recruitapplies;
	}

}