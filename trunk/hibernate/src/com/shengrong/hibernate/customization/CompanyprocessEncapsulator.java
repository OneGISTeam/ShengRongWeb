package com.shengrong.hibernate.customization;

import java.sql.Blob;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.shengrong.hibernate.Companyprocess;
import com.shengrong.hibernate.CompanyprocessDAO;

public class CompanyprocessEncapsulator extends Companyprocess implements Encapsulator<Companyprocess> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 225307067757181484L;

	private String encpImage;
	
	private String encpDate;
	
	public String getEncpDate(){
		return this.encpDate;
	}
	
	public void setEncpDate(String encpDate){
		this.encpDate = encpDate;
	}
	
	public String getEncpImage(){
		return this.encpImage;
	}
	
	public void setEncpImage(String encpImage){
		this.encpImage = encpImage;
	}
	
	@Override
	public Companyprocess dataDecapsulate() {
		// TODO Auto-generated method stub
		Companyprocess cp = new Companyprocess();
		cp.setBrief(this.getBrief());
		//将encpDate转化为Datetime
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			cp.setDate(format.parse(this.encpDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cp.setImage(convertToBlob(this.encpImage));
		cp.setTitle(this.getTitle());
		
		return cp;
	}

	private Blob convertToBlob(String base64){
		CompanyprocessDAO cpDao = new CompanyprocessDAO();
		Blob blob = cpDao.getSession().getLobHelper().createBlob(base64.getBytes());
		return blob;
	}
}
