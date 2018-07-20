package com.shengrong.manager.actions;

import java.util.List;

import org.hibernate.Transaction;

import net.sf.json.JSONObject;

import com.shengrong.hibernate.Newstype;
import com.shengrong.hibernate.NewstypeDAO;

public class NewstypeAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 48011128135225289L;

	List<Newstype> newstypeList;
	
	Newstype newstype;
	
	public Newstype getNewstype(){
		return this.newstype;
	}
	
	public void setNewstype(Newstype newstypeList){
		this.newstype = newstypeList;
	}
	
	public List<Newstype> getNewstypeList(){
		return this.newstypeList;
	}
	
	public void setNewstypeList(List<Newstype> newstypeList){
		this.newstypeList = newstypeList;
	}
	
	/**
	 * 查询所有的新闻类型，并跳转页面
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String execute(){
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstypeList = newstypeDao.findAll();
		return SUCCESS;
	}
	
	/**
	 * 添加新的新闻类型
	 * @return
	 */
	public String save(){
		if(this.newstype == null){
			this.setMessage("新闻类型为null！");
			this.setHref("news/newstypes.action");
			return ERROR;
		}
		NewstypeDAO newstypeDao = new NewstypeDAO();
		Transaction tx = newstypeDao.getSession().getTransaction();
		tx.begin();
		newstypeDao.save(newstype);
		tx.commit();
		newstypeDao.getSession().close();
		
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("id") == null ||
				request.getParameter("id").equals("")){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
			this.setResult(root.toString());
			return SUCCESS;
		};
		
		int id = Integer.parseInt(request.getParameter("id"));
		NewstypeDAO newstypeDao = new NewstypeDAO();
		newstype = newstypeDao.findById(id);
		
		if(newstype == null){
			root.put("code", "400");
			root.put("msg", "没有标识号为：" + id + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		Transaction tx = newstypeDao.getSession().getTransaction();
		tx.begin();
		newstypeDao.delete(newstype);
		tx.commit();
		newstypeDao.getSession().close();
		root.put("code", "200");
		root.put("msg", "删除成功！");
		
		this.setResult(root.toString());
		return SUCCESS;
	}
}
