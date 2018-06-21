package com.shengrong.hibernate.customization;

import java.sql.Blob;

import com.shengrong.hibernate.Productpic;
import com.shengrong.hibernate.ProductpicDAO;

public class ProductpicEncapsulator extends Productpic  implements Encapsulator<Productpic> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2552784451985974388L;
	
	private String encpPic;
	
	public String getEncpPic(){
		return this.encpPic;
	}
	
	public void setEncpPic(String encpPic){
		this.encpPic = encpPic;
	}
	
	@Override
	public Productpic dataDecapsulate() {
		// TODO Auto-generated method stub
		
		Productpic productpic = new Productpic();
		productpic.setMainpic(this.getMainpic());
		productpic.setPic(convertToBlob(this.encpPic));
		
		return productpic;
	}
	
	private Blob convertToBlob(String base64){
		ProductpicDAO productpicDao = new ProductpicDAO();
		Blob blob = productpicDao.getSession().getLobHelper().createBlob(base64.getBytes());
		return blob;
	}

}
