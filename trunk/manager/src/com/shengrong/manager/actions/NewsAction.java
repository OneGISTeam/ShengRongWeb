package com.shengrong.manager.actions;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.News;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.hibernate.Newstype;
import com.shengrong.hibernate.NewstypeDAO;
import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.DataPackage;
import com.shengrong.hibernate.customization.NewsEncapsulator;
import com.shengrong.hibernate.customization.PagingInfo;
import com.shengrong.system.System;

public class NewsAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8698849958267326143L;

	private List<Newstype> newstypeList;
	
	private NewsEncapsulator encpNews;
	
	private PagingInfo pagingInfo = new PagingInfo(1, 10);
	
	private List<News> newsList;
	
	private Integer currentNewstype;
	
	private Long totalCount;
	
	private News editNews;
	
	public News getEditNews(){
		return this.editNews;
	}
	
	public void setEditNews(News editNews){
		this.editNews = editNews;
	}
	
	public Long getTotalCount(){
		return this.totalCount;
	}
	
	public void setTotalCount(Long totalCount){
		this.totalCount = totalCount;
	}
	
	public int getCurrentNewstype(){
		return this.currentNewstype;
	}
	
	public void setCurrentNewstype(int currentNewstype){
		this.currentNewstype = currentNewstype;
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
	
	public NewsEncapsulator getEncpNews(){
		return this.encpNews;
	}
	
	public void setEncpNews(NewsEncapsulator encpNews){
		this.encpNews = encpNews;
	}
	
	public List<Newstype> getNewstypeList(){
		return this.newstypeList;
	}
	
	public void setNewstypeList(List<Newstype> newstypeList){
		this.newstypeList = newstypeList;
	}
	
	/**
	 * 跳转新闻发布页面
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String execute(){
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstypeList = newstypeDao.findAll();
		return SUCCESS;
	}
	
	public String save(){
		if(encpNews.getEncpImage() == null || encpNews.getEncpNewsDate() == null ){
			this.setMessage("信息填写不完整！");
			this.setHref("news/newses.action");
			return ERROR;
		}
		News news = encpNews.dataDecapsulate();
		news.setManager(getManager());
		news.setPublishdatetime(System.sysClock());
		
		NewsDAO newsDao = new NewsDAO();
		Transaction tx = newsDao.getSession().getTransaction();
		tx.begin();
		newsDao.save(news);
		tx.commit();
		newsDao.getSession().close();
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
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
		
		@SuppressWarnings("rawtypes")
		DataPackage dataPkg = customizedDao.conditionPagingQuery(condition, this.pagingInfo.getCurrentPage(), 
				this.pagingInfo.getItemPerPage(), "News");
		
		this.newsList = dataPkg.getDatum();
		this.totalCount = dataPkg.getTotalRecords();
		
		return SUCCESS;
	}
	
	/**
	 * 编辑新闻页面跳转
	 * @return success则跳转至新闻编辑页面
	 */
	public String updatePage(){
		if(request.getParameter("newsid") == null){
			this.setMessage("记录为null");
			this.setHref("news/queryNewses.action");
			return ERROR;
		};
		
		//查询所有的类型
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstypeList = newstypeDao.findAll();
		
		int newsid = Integer.parseInt(request.getParameter("newsid"));
		NewsDAO newsDao = new NewsDAO();
		this.editNews = newsDao.findById(newsid);
		
		if(this.editNews == null){
			this.setMessage("没有标志为" + newsid + "的记录！");
			this.setHref("news/queryNewses.action");
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	public String update(){
		if(request.getParameter("newsid") == null ||
				request.getParameter("newsid").equals("")){
			this.setMessage("操作失败：参数标识为空！");
			this.setHref("news/queryNewses.action");
			return ERROR;
		}
		
		int newsid = Integer.parseInt(request.getParameter("newsid"));
		NewsDAO newsDao = new NewsDAO();
		News news = newsDao.findById(newsid);

		if(news == null){
			this.setMessage("操作失败：没有标识为" + newsid + "的记录！");
			this.setHref("news/queryNewses.action");
			return ERROR;
		}
		newsDao.getSession().close();
		
		News editData = encpNews.dataDecapsulate();
		editData.setNewsid(news.getNewsid());
		editData.setPublishdatetime(System.sysClock());
		editData.setManager(getManager());
		Transaction tx = newsDao.getSession().getTransaction();
		tx.begin();
		newsDao.getSession().saveOrUpdate(editData);
		tx.commit();
		newsDao.getSession().close();
		
		this.setMessage("操作成功！");
		this.setHref("news/queryNewses.action");
		return SUCCESS;
	}
	
	/**
	 * 根据标识号删除新闻
	 * @return
	 */
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("newsid") == null ||
				request.getParameter("newsid").equals("")){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
			this.setResult(root.toString());
			return SUCCESS;
		};
		
		int newsid = Integer.parseInt(request.getParameter("newsid"));
		NewsDAO newsDao = new NewsDAO();
		News news = newsDao.findById(newsid);
		if(news == null){
			root.put("code", "400");
			root.put("msg", "没有标识为" + newsid + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		Transaction tx = newsDao.getSession().getTransaction();
		tx.begin();
		newsDao.delete(news);
		tx.commit();
		newsDao.getSession().close();
		
		root.put("code", "200");
		root.put("msg", "操作成功！");
		this.setResult(root.toString());
		return SUCCESS;
	}
}
