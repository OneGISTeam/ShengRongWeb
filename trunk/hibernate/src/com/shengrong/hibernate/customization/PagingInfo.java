package com.shengrong.hibernate.customization;

public class PagingInfo {
	
	private int currentPage;
	
	private int itemPerPage;
	
	public PagingInfo(int currentPage, int itemPerPage){
		this.currentPage = currentPage;
		this.itemPerPage = itemPerPage;
	}
	
	public int getCurrentPage(){
		return this.currentPage;
	}
	
	public void setCurrentPage(int currentPage){
		this.currentPage = currentPage;
	}
	
	public int getItemPerPage(){
		return this.itemPerPage;
	}
	
	public void setItemPerPage(int itemPerPage){
		this.itemPerPage = itemPerPage;
	}
}
