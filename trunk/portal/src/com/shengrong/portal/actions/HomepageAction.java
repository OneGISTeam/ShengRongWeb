package com.shengrong.portal.actions;

import java.sql.*;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.shengrong.hibernate.Carousel;
import com.shengrong.hibernate.CarouselDAO;
import com.shengrong.hibernate.Introduction;
import com.shengrong.hibernate.IntroductionDAO;
import com.shengrong.hibernate.Business;
import com.shengrong.hibernate.BusinessDAO;

public class HomepageAction extends ActionSupport{
	
	private List<Carousel> carousels;
	private List<Introduction> introductions;
	private List<Business> businessList;
	
	public List<Carousel> getCarousels(){
		return this.carousels;
	}
	
	public void setCarousels(List<Carousel> carousels){
		this.carousels = carousels;
	}
	
	public List<Introduction> getIntroductions(){
		return this.introductions;
	}
	
	public void setIntroductions(List<Introduction> introductions){
		this.introductions = introductions;
	}
	
	public List<Business> getBusinessList(){
		return this.businessList;
	}
	
	public void setBusinessList(List<Business> businessList){
		this.businessList = businessList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public String execute() {
		CarouselDAO carouselDao = new CarouselDAO();
		carousels = carouselDao.findAll();
		
		IntroductionDAO introductionDao = new IntroductionDAO();
		String sql= "from Introduction  where introductionid = (SELECT max(introductionid) FROM Introduction)";
		introductions = introductionDao.findbySql(sql);
		
		BusinessDAO businessDao = new BusinessDAO();
		businessList = businessDao.findAll();
		
		return SUCCESS;
	}


}
