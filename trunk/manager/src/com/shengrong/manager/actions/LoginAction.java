package com.shengrong.manager.actions;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Transaction;

import sun.misc.BASE64Encoder;

import com.shengrong.hibernate.Manager;
import com.shengrong.hibernate.ManagerDAO;
import com.shengrong.hibernate.Master;
import com.shengrong.hibernate.MasterDAO;
import com.shengrong.hibernate.Role;
import com.shengrong.hibernate.RoleDAO;

public class LoginAction extends ActionBase implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7722879410740390753L;
	
	private String mastername;

	private String password;
	
	private String roleid;
	
	private Map<String, Object> mySession;
	
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.mySession = session;
	}
	
	public String getRoleid(){
		return this.roleid;
	}
	
	public void setRoleid(String roleid){
		this.roleid = roleid;
	}
	
	public String getMastername(){
		return this.mastername;
	}
	
	public void setMastername(String mastername){
		this.mastername = mastername;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	/**
	 *	进行系统初始化，如果没有超级管理员则要进行超级管理员注册，如果有则进行系统页面
	 * @return String 返回“success”则直接进入系统；返回“input”进入超管注册页面；返回“error”进入错误页面
	 * 					
	 */
	@Override
	public String execute(){
		RoleDAO roleDao = new RoleDAO();
		Role master = roleDao.findById("master");
		if(master == null){
			this.setMessage("数据库中没有master角色，请联系系统管理员进行维修！");			
			return ERROR;
		}
		
		MasterDAO managerDao = new MasterDAO();
		@SuppressWarnings("unchecked")
		List<Master> managers = managerDao.findAll();
		if(managers.size() == 0){
			return INPUT;
		}else if(managers.size() == 1){
			return SUCCESS;
		}else {
			this.setMessage("超级管理员不唯一，请联系系统管理员进行维修！");
			return ERROR;
		}
	}
	
	/**
	 * 超级管理员注册
	 * @return String error时返回重新输入；success时进入登录页面
	 */
	public String register(){
		
		if(this.mastername == null || this.password == null){
			this.setMessage("账号和密码不可以为空！");
			this.setHref("enter.action");
			return ERROR;
		}
		
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte str[] = md5.digest(this.password.getBytes("utf-8"));
			str[Role.MASTER % 15] ^= Role.MASTER % 127 ; //利用角色对密码进行再加密
			BASE64Encoder encoder = new BASE64Encoder();
			
			//获取加密后的密码
			String encodePassword = encoder.encode(str);
			
			RoleDAO roleDao = new RoleDAO();
			Role role = roleDao.findById("master");
			
			MasterDAO masterDao = new MasterDAO();
			Master master = new Master(this.mastername, role, encodePassword);
			Transaction tx = masterDao.getSession().beginTransaction();
			masterDao.save(master);
			tx.commit();
			masterDao.getSession().close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		this.setMessage("您已成功注册超级管理员！");
		this.setHref("enter.action");
		return LOGIN;
	}
	
	/**
	 * 管理员登录，超级管理员登录比普通管理员多一个管理员管理模块
	 * @return success时进入系统(roleid用户判断是哪种登录方式)；error时进入错误页面
	 */
	public String login(){
		
		if(this.mastername == null || this.password == null || this.roleid == null){
			this.setMessage("账号、密码、登录身份不可以为空！");
			this.setHref("enter.action");
			return ERROR;
		}
		
		//验证登录信息
		String encodePassword = null;
		try{
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte str[] = md5.digest(this.password.getBytes("utf-8"));
			str[Role.MASTER % 15] ^= Role.MASTER % 127 ; //利用角色对密码进行再加密
			BASE64Encoder encoder = new BASE64Encoder();
			//获取加密后的密码
			encodePassword = encoder.encode(str);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		RoleDAO roleDao = new RoleDAO();
		Role role = roleDao.findById(this.roleid);
		
		//超级管理员身份登录
		if(this.roleid.equals("master")){
			MasterDAO masterDao = new MasterDAO();
			Master master = masterDao.findById(this.mastername);
			if(master != null && master.getPassword().equals(encodePassword)){
				//登录成功
				mySession.put("loginFlag", "login");
				mySession.put("loginRole", Role.MASTER);
				mySession.put("loginName", master.getMastername());
				return "master";
			}else{
				this.setMessage("账号或密码错误！也有可能是身份选择错误！");
				this.setHref("enter.action");
				return ERROR;
			}
			
		}else if(this.roleid.equals("admin")){
			//普通管理员身份登录
			ManagerDAO managerDao = new ManagerDAO();
			
			Manager manager = managerDao.findById(this.mastername);
			if(manager != null && manager.getPassword().equals(encodePassword)){
				if(manager.getPermitted()){
					//登录成功
					mySession.put("loginFlag", "login");
					mySession.put("loginRole", Role.MANAGER);
					mySession.put("loginName", manager.getName());
					mySession.put("loginSex", manager.getSex().toString());
					return SUCCESS;
				}else{
					//登录成功
					this.setMessage("您的账号还未通过超级管理员审核，请联系超级管理员进行审核！");
					this.setHref("enter.action");
					return ERROR;
				}
			}else{
				this.setMessage("账号或密码错误！也有可能是身份选择错误！");
				this.setHref("enter.action");
				return ERROR;
			}
		}else{
			this.setMessage("系统角色中仅有master和admin，但登录时出现了其余角色，请联系系统管理员！");
			this.setHref("enter.action");
			return ERROR;
		}
	}
	
	public String logout(){
		mySession.clear();
		return "logout";
	}
}
