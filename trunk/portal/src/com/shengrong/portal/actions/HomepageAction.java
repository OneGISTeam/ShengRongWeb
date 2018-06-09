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
		
		IntroductionDAO introductionDao = new IntroductionDAO();
		String sql= "from Introduction  where introductionid = (SELECT max(introductionid) FROM Introduction)";
		introductions = introductionDao.findBySql(sql);
		
		BusinessDAO businessDao = new BusinessDAO();
		businessList = businessDao.findAll();
		
		NewsDAO newsDao = new NewsDAO();
		String newsSql="from News where isheadline='1' order by newsdate DESC";
		newsList = newsDao.findBySql(newsSql);
		
        TeamprocessDAO teamprocessDao = new TeamprocessDAO();
        String processSql="from Teamprocess order by date,processid";
		teamprocessList = teamprocessDao.findBySql(processSql);
		
		return SUCCESS;
	}


}
