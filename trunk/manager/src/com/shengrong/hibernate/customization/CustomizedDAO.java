package com.shengrong.hibernate.customization;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.shengrong.hibernate.BaseHibernateDAO;

/**
 * 该类主要是提供数据库自定义查询函数操作
 * @author zhangzheng
 *
 */
public class CustomizedDAO<T> extends BaseHibernateDAO {
	
	/**
	 * 
	 * @param currentPage 当前页码
	 * @param itemPerPage 每页的项数
	 * @param table 查询表的名称
	 * @return DataPackage<T> 返回查询结果集
	 */
	@SuppressWarnings("unchecked")
	public DataPackage<T> pagingQuery(int currentPage, int itemPerPage, String table){
		Query query = this.getSession().createQuery("from " + table);
		
		int iFrom = (currentPage - 1)*itemPerPage;
		int iEnd = currentPage*itemPerPage - 1;
		query.setFirstResult(iFrom);
		query.setMaxResults(iEnd);
		
		Long count = (Long)this.getSession().createQuery("select count(*) from " + table)
				.uniqueResult();
		
		DataPackage<T> dataPkg = new DataPackage<T>();
		dataPkg.setTotalRecords(count);
		dataPkg.setDatum((List<T>)query.list());
		return dataPkg;
	}
}
