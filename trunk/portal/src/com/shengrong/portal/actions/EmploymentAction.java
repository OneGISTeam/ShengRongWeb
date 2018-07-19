package com.shengrong.portal.actions;

import java.util.List;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Recruit;
import com.shengrong.hibernate.RecruitDAO;
import com.shengrong.hibernate.Recruitapply;
import com.shengrong.hibernate.RecruitapplyDAO;
import com.shengrong.system.System;

public class EmploymentAction extends ActionBase {
	
	private Recruit recruit;
	
	private Recruitapply recruitapply;
	
	private List<Recruit> recruitList;
	
	private List<Recruitapply> recruitapplyList;
	
	public Recruit getRecruit(){
		return this.recruit;
	}
	
	public void setRecruit(Recruit recruit){
		this.recruit = recruit;
	}
	
	public List<Recruit> getRecruitList(){
		return this.recruitList;
	}
	
	public void setRecruitList(List<Recruit>recruitList){
		this.recruitList = recruitList;
	}
	
	public Recruitapply getRecruitapply(){
		return this.recruitapply;
	}
	
	public void setRecruitapply(Recruitapply recruitapply){
		this.recruitapply = recruitapply;
	}
	
	public List<Recruitapply> getRecruitapplyList(){
		return this.recruitapplyList;
	}
	
	public void setRecruitapplyList(List<Recruitapply>recruitapplyList){
		this.recruitapplyList = recruitapplyList;
	}
	
	
	
	public String execute(){
		RecruitDAO recruitDao = new RecruitDAO();
		recruitList = recruitDao.findAll();
		return SUCCESS;
	}
	
	public String open(){
		if(request.getParameter("recruitid") == null){
			return ERROR;
		};
		int recruitid = Integer.parseInt(request.getParameter("recruitid"));
		RecruitDAO recruitDao = new RecruitDAO();
		this.recruit = recruitDao.findById(recruitid);
		if(this.recruit == null){
		return ERROR;
		}
		return SUCCESS;
	}
	
	public String save(){
		if(recruitapply.getApplyname() == null||recruitapply.getApplyeducation() == null||recruitapply.getApplyphone() == null){
			this.setMessage("公司、邮箱和评论不能为空");
			this.setHref("openRecruitapply.action");
			return ERROR;
		}
		int recruit_id = Integer.parseInt(request.getParameter("recruitid"));
		RecruitDAO recruitDao = new RecruitDAO();
		this.recruit= recruitDao.findById(recruit_id);
		recruitapply.setRecruit(this.recruit);
		recruitapply.setApplydatetime(System.sysClock());
		RecruitapplyDAO recruitapplyDao =new RecruitapplyDAO();
		Transaction tx = recruitapplyDao.getSession().getTransaction();
		tx.begin();
		recruitapplyDao.save(recruitapply);
		tx.commit();
		recruitapplyDao.getSession().close();
		return SUCCESS;
	}
}
