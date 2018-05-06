package com.shengrong.hibernate.customization;

/**
 * 对数据模型进行封装，以适应前端传输接口
 * 
 * @author zhangzheng
 *
 * @param <T> 封装的模型类
 */
interface Encapsulator<T> {

	/**
	 * 数据解封接口
	 * @return
	 */
	public T dataDecapsulate();
}
