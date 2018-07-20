package com.shengrong.manager.actions;

import java.security.MessageDigest;
import java.sql.Blob;

import org.hibernate.Transaction;

import sun.misc.BASE64Encoder;

import com.shengrong.hibernate.Manager;
import com.shengrong.hibernate.ManagerDAO;
import com.shengrong.hibernate.Role;
import com.shengrong.hibernate.RoleDAO;
import com.shengrong.system.System;

public class ManagerAction extends ActionBase{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5144045373593121337L;

	private Manager editManager;
	
	private int sex;
	
	private String imagedata;
	
	public String getImagedata(){
		return this.imagedata;
	}
	
	public void setImagedata(String imagedata){
		this.imagedata = imagedata;
	}
	
	public int getSex(){
		return this.sex;
	}
	
	public void setSex(int sex){
		this.sex = sex;
	}
	
	public Manager getEditManager(){
		return this.editManager;
	}
	
	public void setEditManager(Manager editManager){
		this.editManager = editManager;
	}
	
	/**
	 * 普通管理员注册，注册完成后需要由超级管理员登录系统并进行申请通过
	 * @return success返回成功页面，error返回错误页面
	 */
	public String register(){
		if(editManager == null || imagedata == null ||
				imagedata.equals("")){
			this.setMessage("操作失败！信息不完整！");
			this.setHref("Account/managerRegister.jsp");
			return ERROR;
		}
		
		ManagerDAO managerDao = new ManagerDAO();
		Manager manager = managerDao.findById(editManager.getName());
		if(manager != null){
			this.setMessage("已经存在名为：" + manager.getName() + "的管理员，请修改名称重新注册！");
			this.setHref("Account/managerRegister.jsp");
			return ERROR;
		}
		
		boolean ret = (sex==1)?true:false; 
		editManager.setSex(ret);
		
		Blob blob = managerDao.getSession().getLobHelper().createBlob(this.imagedata.getBytes());
		editManager.setPortrait(blob);
		
		editManager.setRegdatetime(System.sysClock());
		
		RoleDAO roleDao = new RoleDAO();
		Role role = roleDao.findById("admin");
		if(role == null){
			this.setMessage("数据库角色表存在错误，请联系系统管理员！");
			this.setHref("Account/managerRegister.jsp");
			return ERROR;
		}
		
		editManager.setRole(role);
		
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			byte str[] = md5.digest(this.editManager.getPassword().getBytes("utf-8"));
			str[Role.MASTER % 15] ^= Role.MASTER % 127 ; //利用角色对密码进行再加密
			BASE64Encoder encoder = new BASE64Encoder();
			//获取加密后的密码
			String encodePassword = encoder.encode(str);
			this.editManager.setPassword(encodePassword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//设置当前未审核状态
		editManager.setPermitted(false);
		
		Transaction tx = managerDao.getSession().getTransaction();
		tx.begin();
		managerDao.save(editManager);
		tx.commit();
		managerDao.getSession().close();
		
		this.setMessage("管理员注册成功，请耐心等待超级管理员通过您的请求！");
		this.setHref("enter.action");
		return SUCCESS;
	}
	
}
