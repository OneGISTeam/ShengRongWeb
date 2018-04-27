package com.shengrong.manager.actions;

import com.opensymphony.xwork2.ActionSupport;

public class ActionBase extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3937323628054579271L;
	
	private String message;
	
	private String href;
	
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
}
