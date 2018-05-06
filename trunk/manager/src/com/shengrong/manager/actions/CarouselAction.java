package com.shengrong.manager.actions;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;


import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Carousel;
import com.shengrong.hibernate.CarouselDAO;
import com.shengrong.system.CarouselSetting;
import com.shengrong.system.System;

public class CarouselAction extends ActionBase{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1646301150193081587L;
	
	private List<Carousel> carousels;
	
	private CarouselSetting carouselSetting;
	
	public List<Carousel> getCarousels(){
		return this.carousels;
	}
	
	public void setCarousels(List<Carousel> carousels){
		this.carousels = carousels;
	}
	
	public CarouselSetting getCarouselSetting(){
		return this.carouselSetting;
	}
	
	public void setCarouselSetting(CarouselSetting carouselSetting){
		this.carouselSetting = carouselSetting;
	}
	
	/*
	 * 查询所有的carousel
	 */
	@SuppressWarnings("unchecked")
	public String execute(){
		//查询所有的carousel
		CarouselDAO carouselDao = new CarouselDAO();
		List<Carousel> allCarousels = carouselDao.findAll();
		
		//获取carousel的系统设置
		carouselSetting = System.SystemSettings().getCarouselSetting();
		if(allCarousels.size() <= carouselSetting.getDisplayCount()){
			carousels = allCarousels;
		}else{
			for(int i=0; i<carouselSetting.getDisplayCount(); i++){
				carousels.add(allCarousels.get(i));
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 执行carousel的ajax数据编辑请求
	 */
	public String saveOrUnpdate(){
		//获取前台传输的参数
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String data = request.getParameter("data");
		
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Timestamp ts = System.sysClock();
		
		//将Sting类型的图片数据转换为Blob类型
		CarouselDAO carouselDao = new CarouselDAO();
		Blob blob = carouselDao.getSession().getLobHelper().createBlob(data.getBytes());
		
		Carousel carousel = null;
		JSONObject json = new JSONObject();		
		if(request.getParameter("id").isEmpty() || request.getParameter("id").equals("")){
			carousel = new Carousel(title, content, ts, blob);
			json.put("code", "200");
			json.put("msg","插入数据成功！");
		}else{			
			int carouselid = Integer.parseInt(request.getParameter("id"));
			carousel = carouselDao.findById(carouselid);
			if(carousel == null){
				json.put("code", "500");
				json.put("msg","数据库中并不存在标识为" + carouselid + "的轮播消息！");
			}
			carousel.setTitle(title);
			carousel.setContent(content);
			carousel.setDatetime(ts);
			carousel.setImage(blob);
			
			json.put("code", "200");
			json.put("msg","更新数据成功！");
		}
		carousel.setManager(getManager());
		this.setResult(json.toString());
		
		//执行saveOrUpdate操作
		Transaction tx = carouselDao.getSession().getTransaction();
		tx.begin();
		carouselDao.getSession().saveOrUpdate(carousel);
		tx.commit();
		carouselDao.getSession().close();
		
		return SUCCESS;
	}

	

}
