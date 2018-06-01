package com.shengrong.manager.actions;

import com.shengrong.hibernate.DatumDAO;
import com.shengrong.hibernate.ManagerDAO;
import com.shengrong.hibernate.MemberDAO;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.manager.model.AmountInfo;

public class StatisticAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 497563937624360827L;

	private AmountInfo amountInfo = new AmountInfo();
	
	public AmountInfo getAmountInfo(){
		return this.amountInfo;
	}
	
	public void setAmountInfo(AmountInfo amountInfo){
		this.amountInfo = amountInfo;
	}
	
	public String execute(){
		NewsDAO newsDao = new NewsDAO();
		Long newsCount = (Long)newsDao.getSession().createQuery("select count(*) from " + "News").uniqueResult();
		this.amountInfo.setNewsCount(newsCount);
		/**
		ProductDAO productDao = new ProductDAO();**/
		
		DatumDAO datumDao = new DatumDAO();
		Long datumCount = (Long)datumDao.getSession().createQuery("select count(*) from " + "Datum").uniqueResult();
		this.amountInfo.setDatumCount(datumCount);
		
		MemberDAO memberDao = new MemberDAO();
		Long memberCount = (Long)memberDao.getSession().createQuery("select count(*) from " + "Member").uniqueResult();
		this.amountInfo.setMemberCount(memberCount);
		
		return SUCCESS;
	}
}
