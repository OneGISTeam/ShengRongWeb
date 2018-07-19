package com.shengrong.portal.actions;

import java.util.List;
import org.hibernate.Transaction;
import com.shengrong.hibernate.Joinus;
import com.shengrong.hibernate.JoinusDAO;

public class CooperationAction extends ActionBase {
	
	private Joinus joinus;
	private List<Joinus> joinusList;

	public Joinus getJoinus(){
		return this.joinus;
	}
	
	public void setJoinus(Joinus  joinus){
		this.joinus = joinus;
	}
	
	public List<Joinus> getJoinusList(){
		return this.joinusList;
	}
	
	public void setJoinusList(List<Joinus> joinusList){
		this.joinusList = joinusList;
	}
	
	public String execute(){
		JoinusDAO joinusDao =new JoinusDAO();
		joinusList = joinusDao.findAll();
		return SUCCESS;
	}
	
	/**
	 * 保存加盟信息
	 * @return
	 */
	public String save(){
		if(joinus.getCompany() == null||joinus.getEmail() == null||joinus.getComment() == null){
			this.setMessage("公司、邮箱和评论不能为空");
			this.setHref("cooperation.action");
			return ERROR;
		}
		JoinusDAO joinusDao =new JoinusDAO();
		Transaction tx = joinusDao.getSession().getTransaction();
		tx.begin();
		joinusDao.save(joinus);
		tx.commit();
		joinusDao.getSession().close();
		return SUCCESS;
	}
}
