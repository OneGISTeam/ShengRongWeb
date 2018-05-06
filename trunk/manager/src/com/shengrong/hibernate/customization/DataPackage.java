package com.shengrong.hibernate.customization;

import java.util.List;

public class DataPackage<T> {
	private List<T> datum;
	
	private Long totalRecords;
	
	public Long getTotalRecords(){
		return this.totalRecords;
	}
	
	public void setTotalRecords(Long totalRecords){
		this.totalRecords = totalRecords;
	}
	
	public List<T> getDatum(){
		return this.datum;
	}
	
	public void setDatum(List<T> datum){
		this.datum = datum;
	}
	
	
}
