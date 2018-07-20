package com.shengrong.portal.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shengrong.hibernate.Datum;
import com.shengrong.hibernate.DatumDAO;
import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.DataPackage;
import com.shengrong.hibernate.customization.PagingInfo;


public class DatumAction extends ActionBase  {
	
	 private PagingInfo pagingInfo = new PagingInfo(1, 10);
	    
	 private Long totalCount;
	    
	 private List<Datum> datumList;
	    
	 public List<Datum> getDatumList(){
	    return this.datumList;
	 }
	    
	 public void setDatumList(List<Datum> datumList){
	    this.datumList = datumList;
	 }
	 
	 public Long getTotalCount(){
	    return this.totalCount;
	 }
	    
	 public void setTotalCount(Long totalCount){
	    this.totalCount = totalCount;
	 }
	    
	 public PagingInfo getPagingInfo(){
	    return this.pagingInfo;
	 }
	    
	 public void setPagingInfo(PagingInfo pagingInfo){
	    this.pagingInfo = pagingInfo;
	 }
	 
	public String execute(){
		return SUCCESS;
	}
	
	public String query(){
		CustomizedDAO<Datum> customizedDao = new CustomizedDAO<Datum>();
		
		DataPackage<Datum> dataPkg = customizedDao.pagingQuery(this.pagingInfo.getCurrentPage(), 
				this.pagingInfo.getItemPerPage(), "Datum");
		
		this.datumList = dataPkg.getDatum();
		this.totalCount = dataPkg.getTotalRecords();
		
		return SUCCESS;
	}
}
