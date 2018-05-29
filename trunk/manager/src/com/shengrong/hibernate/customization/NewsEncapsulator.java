package com.shengrong.hibernate.customization;

import java.sql.Blob;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.shengrong.hibernate.News;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.hibernate.Newstype;
import com.shengrong.hibernate.NewstypeDAO;

public class NewsEncapsulator extends News implements Encapsulator<News> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4099041728305884918L;

	private String encpImage;
	
	private String encpNewsDate;
	
	private int encpNewstypeID;
	
	public int getEncpNewstypeID(){
		return this.encpNewstypeID;
	}
	
	public void setEncpNewstypeID(int encpNewstypeID){
		this.encpNewstypeID = encpNewstypeID;
	}
	
	public String getEncpNewsDate(){
		return this.encpNewsDate;
	}
	
	public void setEncpNewsDate(String encpNewsDate){
		this.encpNewsDate = encpNewsDate;
	}
	
	public String getEncpImage(){
		return this.encpImage;
	}
	
	public void setEncpImage(String encpImage){
		this.encpImage = encpImage;
	}
	
	@Override
	public News dataDecapsulate() {
		// TODO Auto-generated method stub
        News news = new News();
        news.setContent(this.getContent());
        news.setImage(convertToBlob(this.encpImage));
        news.setIsheadline(this.getIsheadline());
        news.setKeywords(this.getKeywords());
        //news.setManager(getManager());
  		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  		try {
  			news.setNewsdate(format.parse(this.encpNewsDate));
  		} catch (ParseException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		news.setNewstype(this.getNewstype());
  		news.setTitle(this.getTitle());
  		NewstypeDAO newsDao = new NewstypeDAO();
  		Newstype newstype = newsDao.findById(this.encpNewstypeID);
  		news.setNewstype(newstype);  		
  		//manager和publishdatetime需要在action中进行获取和设置
		return news;
	}

	private Blob convertToBlob(String base64){
		NewsDAO newsDao = new NewsDAO();
		Blob blob = newsDao.getSession().getLobHelper().createBlob(base64.getBytes());
		return blob;
	}
}
