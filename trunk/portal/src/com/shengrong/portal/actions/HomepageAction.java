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
import com.shengrong.hibernate.News;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.hibernate.NewstypeDAO;
import com.shengrong.hibernate.Teamprocess;
import com.shengrong.hibernate.TeamprocessDAO;
import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.DataPackage;

public class HomepageAction extends ActionSupport{
	
	private List<Carousel> carousels;
	private List<Introduction> introductions;
	private List<Business> businessList;
	private List<News> newsList;
	private List<Teamprocess> teamprocessList;
	
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
	
	public List<News> getNewsList(){
		return this.newsList;
	}
	
	public void setNewsList(List<News> newsList){
		this.newsList = newsList;
	}
	
	public List<Teamprocess> getTeamprocessList(){
		return this.teamprocessList;
	}
	
	public void setTeamprocessList(List<Teamprocess> teamprocessList){
		this.teamprocessList =teamprocessList;
	}
	

	@SuppressWarnings("unchecked")
	public String execute() {
		CarouselDAO carouselDao = new CarouselDAO();
		carousels = carouselDao.findAll();
		
		CustomizedDAO<Introduction> introductioncustomizedDao = new CustomizedDAO<Introduction>();
		String introductionSql= "where introductionid = (SELECT max(introductionid) FROM Introduction)";
		DataPackage introductiondataPkg = introductioncustomizedDao.findBySql(introductionSql,"Introduction");
		this.introductions= introductiondataPkg.getDatum();
		
		BusinessDAO businessDao = new BusinessDAO();
		businessList = businessDao.findAll();
		
		CustomizedDAO<News> newscustomizedDao = new CustomizedDAO<News>();
		String newsSql="where isheadline='1' order by newsdate DESC";
		DataPackage newsdataPkg = newscustomizedDao.findBySql(newsSql,"News");
		this.newsList = newsdataPkg.getDatum();
		
		CustomizedDAO<Teamprocess> teamprocesscustomizedDao = new CustomizedDAO<Teamprocess>();
        String processSql="order by date,processid";
        DataPackage teamprocessdataPkg = teamprocesscustomizedDao.findBySql(processSql,"Teamprocess");
        this.teamprocessList =  teamprocessdataPkg.getDatum();
        
		return SUCCESS;
	}

}
