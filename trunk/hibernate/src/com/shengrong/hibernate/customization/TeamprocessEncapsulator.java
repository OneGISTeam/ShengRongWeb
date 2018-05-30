package com.shengrong.hibernate.customization;

import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.shengrong.hibernate.Teamprocess;
import com.shengrong.hibernate.TeamprocessDAO;

/**
 * 对Teamprocess进行数据封装
 * @author zhangzheng
 *
 */
public class TeamprocessEncapsulator extends Teamprocess implements Encapsulator<Teamprocess> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1321805170137447280L;

	private String encpPos;
	
	private String encpImage;
	
	private String encpDatetime;
	
	public String getEncpDatetime(){
		return this.encpDatetime;
	}
	
	public void setEncpDatetime(String encpDatetime){
		this.encpDatetime = encpDatetime;
	}
	
	public String getEncpImage(){
		return this.encpImage;
	}
	
	public void setEncpImage(String encpImage){
		this.encpImage = encpImage;
	}
	
	public String getEncpPos(){
		return this.encpPos;
	}
	
	public void setEncpPos(String encpPos){
		this.encpPos = encpPos;
	}
	
	@Override
	public Teamprocess dataDecapsulate() {
		// TODO Auto-generated method stub
		Teamprocess tp = new Teamprocess();
		tp.setBrief(this.getBrief());
		//将ecpsImage转化为blob
		tp.setImage(convertToBlob(encpImage));
		tp.setLocation(this.getLocation());
		//将ecpsPos转化为blob
		tp.setPos(convertToBlob(encpPos));
		//将encpDatetime转化为Datetime
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			tp.setDate(format.parse(encpDatetime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tp;
	}
	
	private Blob convertToBlob(String base64){
		TeamprocessDAO teamprocessDao = new TeamprocessDAO();
		Blob blob = teamprocessDao.getSession().getLobHelper().createBlob(base64.getBytes());
		return blob;
	}
}
