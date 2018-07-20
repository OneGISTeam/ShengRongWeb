package com.shengrong.portal.actions;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.shengrong.hibernate.Manager;
import com.shengrong.hibernate.ManagerDAO;

public class ActionBase extends ActionSupport implements SessionAware, ServletRequestAware{
private String message;
	
	private String href;
	
	protected Map<String, Object> mySession;
	
	protected HttpServletRequest request;
	
	private String result;
	
	public String getResult(){
		return this.result;
	}
	
	public void setResult(String result){
		this.result = result;
	}
	
	public String getMessage(){
		return this.message;
	}
	
	public void setMessage(String message){
		this.message = message;
	}
	
	public String getHref(){
		return this.href;
	}
	
	public void setHref(String href){
		this.href = href;
	}
	

	@Override
	public void setSession(Map<String, Object> mySession) {
		// TODO Auto-generated method stub
		this.mySession = mySession;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
}
