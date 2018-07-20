package com.shengrong.manager.model;

public class AmountInfo {
	
	private Long newsCount = 0L;
	
	private Long productCount = 0L;
	
	private Long datumCount = 0L;
	
	private Long memberCount = 0L;
	
	public Long getMemberCount(){
		return this.memberCount;
	}
	
	public void setMemberCount(Long memberCount){
		this.memberCount = memberCount;
	}
	
	public Long getDatumCount(){
		return this.datumCount;
	}
	
	public void setDatumCount(Long datumCount){
		this.datumCount = datumCount;
	}
	
	public Long getProductCount(){
		return this.productCount;
	}
	
	public void setProductCount(Long productCount){
		this.productCount = productCount;
	}
	
	public Long getNewsCount(){
		return this.newsCount;
	}
	
	public void setNewsCount(Long newsCount){
		this.newsCount = newsCount;
	}
}
