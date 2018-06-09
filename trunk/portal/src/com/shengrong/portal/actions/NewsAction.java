package com.shengrong.portal.actions;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern; 

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.shengrong.hibernate.News;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.hibernate.Newstype;
import com.shengrong.hibernate.NewstypeDAO;
import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.DataPackage;
import com.shengrong.hibernate.customization.PagingInfo;

public class NewsAction extends ActionBase{

	List<Newstype> newstypeList;
	
	private PagingInfo pagingInfo = new PagingInfo(1, 10);
	
	private List<News> newsList;
	
	private Integer currentNewstype;
	
	private Long totalCount;
	
	private News news;
	
	public News getNews(){
		return this.news;
	}
	
	public void setNews(News news){
		this.news = news;
	}
	
	public List<Newstype> getNewstypeList(){
		return this.newstypeList;
	}
	
	public void setNewstypeList(List<Newstype> newstypeList){
		this.newstypeList = newstypeList;
	}
	
	public int getCurrentNewstype(){
		return this.currentNewstype;
	}
	
	public void setCurrentNewstype(int currentNewstype){
		this.currentNewstype = currentNewstype;
	}
	
	public Long getTotalCount(){
		return this.totalCount;
	}
	
	public void setTotalCount(Long totalCount){
		this.totalCount = totalCount;
	}
	
	public List<News> getNewsList(){
		return this.newsList;
	}
	
	public void setNewsList(List<News> newsList){
		this.newsList = newsList;
	}
	
	public PagingInfo getPagingInfo(){
		return this.pagingInfo;
	}
	
	public void setPagingInfo(PagingInfo pagingInfo){
		this.pagingInfo = pagingInfo;
	}
	
	@SuppressWarnings("unchecked")
	public String execute() {
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstypeList = newstypeDao.findAll();
		return SUCCESS;
	}
	
	public String query(){
		//查询所有的类型
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstypeList = newstypeDao.findAll();
		CustomizedDAO<News> customizedDao = new CustomizedDAO<News>();
		if(this.currentNewstype == null){
			//第一个作为当前默认的类型
			this.currentNewstype = newstypeList.get(0).getTypeid();
		}
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("newstype.typeid", this.currentNewstype);
		
		DataPackage dataPkg = customizedDao.conditionPagingQuery(condition, this.pagingInfo.getCurrentPage(), 
				this.pagingInfo.getItemPerPage(), "News");
		this.newsList = dataPkg.getDatum();
		this.totalCount = dataPkg.getTotalRecords();
		return SUCCESS;
	}
	
	public String open(){
		if(request.getParameter("newsid") == null){
			return ERROR;
		};
		
		//查询所有的类型
		//NewstypeDAO newstypeDao = new NewstypeDAO();
		//newstypeList = newstypeDao.findAll();
		
		int newsid = Integer.parseInt(request.getParameter("newsid"));
		NewsDAO newsDao = new NewsDAO();
		this.news = newsDao.findById(newsid);
		 
		//NewsDAO newsDao2 = new NewsDAO();
		int newstypeid = this.news.getNewstype().getTypeid();
		int thisnewsid =newsid;
		String newsSql="from News where typeid=@newstypeid order by newsdate DESC";
		newsList = newsDao.findBySql(newsSql);
		
		if(this.news == null){
			return ERROR;
		}
		
		return SUCCESS;
	}
	
}


