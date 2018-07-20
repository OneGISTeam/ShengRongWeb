package com.shengrong.system;

public class CarouselSetting {
	static private int iMinCount = 5;
	static private int iMaxCount = 10;
	
	private int iDisplayCount = iMinCount;
	
	final public int minCount(){
		return CarouselSetting.iMinCount;
	}
	
	final public int maxCount(){
		return CarouselSetting.iMaxCount;
	}
	
	public void setDisplayCount(int iCount){
		this.iDisplayCount = iCount;
	}
	
	public int getDisplayCount(){
		return this.iDisplayCount;
	}
}
