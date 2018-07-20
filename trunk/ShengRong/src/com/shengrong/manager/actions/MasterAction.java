package com.shengrong.manager.actions;

import java.util.List;

import org.hibernate.Transaction;

import net.sf.json.JSONObject;

import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.DataPackage;
import com.shengrong.hibernate.customization.PagingInfo;
import com.shengrong.hibernate.Manager;
import com.shengrong.hibernate.ManagerDAO;


public class MasterAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4580228457559317617L;
	
	private PagingInfo pagingInfo = new PagingInfo(1, 10);
    
    private Long totalCount;
    
    private List<Manager> managerList;
    
    public List<Manager> getManagerList(){
    	return this.managerList;
    }
    
    public void setManagerList(List<Manager> managerList){
    	this.managerList = managerList;
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

	@Override
	public String execute(){
		
		CustomizedDAO<Manager> customizedDao = new CustomizedDAO<Manager>();
		DataPackage<Manager> dataPkg = customizedDao.pagingQuery(this.pagingInfo.getCurrentPage(), 
				this.pagingInfo.getItemPerPage(), "Manager");
		this.managerList = dataPkg.getDatum();
		this.totalCount = dataPkg.getTotalRecords();
		return SUCCESS;
	}
	
	public String passAudit(){
		return audit(true);
	}
	
	public String revokeAudit(){
		return audit(false);
	}
	
	private String audit(boolean bFlag){
		JSONObject root = new JSONObject();
		if(request.getParameter("name") == null){
			root.put("code", "400");
			root.put("msg", "无法获取名称！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		String name = request.getParameter("name");
		ManagerDAO managerDao = new ManagerDAO();
		Manager manager = managerDao.findById(name);
		if(manager == null){
			root.put("code", "400");
			root.put("msg", "没有名称为" + name + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		manager.setPermitted(bFlag);
		
		Transaction tx = managerDao.getSession().getTransaction();
		tx.begin();
		managerDao.getSession().saveOrUpdate(manager);
		tx.commit();
		managerDao.getSession().close();
		
		root.put("code", "200");
		root.put("msg", "操作成功！");
		this.setResult(root.toString());
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("name") == null){
			root.put("code", "400");
			root.put("msg", "无法获取名称！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		String name = request.getParameter("name");
		ManagerDAO managerDao = new ManagerDAO();
		Manager manager = managerDao.findById(name);
		if(manager == null){
			root.put("code", "400");
			root.put("msg", "没有名称为" + name + "的记录！");
			this.setResult(root.toString());
			return SUCCESS;
		}
		
		Transaction tx = managerDao.getSession().getTransaction();
		tx.begin();
		managerDao.delete(manager);
		tx.commit();
		managerDao.getSession().close();
		
		root.put("code", "200");
		root.put("msg", "操作成功！");
		this.setResult(root.toString());
		return SUCCESS;
	}
}
