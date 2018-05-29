package com.shengrong.manager.actions;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.shengrong.hibernate.Datum;
import com.shengrong.hibernate.DatumDAO;
import com.shengrong.hibernate.customization.CustomizedDAO;
import com.shengrong.hibernate.customization.PagingInfo;
import com.shengrong.hibernate.customization.DataPackage;
import com.shengrong.manager.file.FileUploadProgress;
import com.shengrong.manager.file.UploadFile;
import com.shengrong.system.System;

public class DatumAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2818789476760144749L;
	
	private Datum datum;
	
	private File uploadData; //上传文件域属性
    private String uploadDataContentType;     //上传文件类型的属性
    private String uploadDataFileName; //上传文件属性
    
    private String uploadProgress; //用于封装文件上传进度，防止与默认的result冲突
    
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
    
    public String getUploadProgress(){
    	return this.uploadProgress;
    }
    
    public void setUploadProgress(String uploadProgress){
    	this.uploadProgress = uploadProgress;
    }
    
    public File getUploadData(){
    	return this.uploadData;
    }
    
    public void setUploadData(File uploadData){
    	this.uploadData = uploadData;
    }
    
    public String getUploadDataContentType(){
    	return this.uploadDataContentType;
    }
    
    public void setUploadDataContentType(String uploadDataContentType){
    	this.uploadDataContentType = uploadDataContentType;
    }
    
    public String getUploadDataFileName(){
    	return this.uploadDataFileName;
    }
    
    public void setUploadDataFileName(String uploadDataFileName){
    	this.uploadDataFileName = uploadDataFileName;
    }

	public Datum getDatum(){
		return this.datum;
	}
	
	public void setDatum(Datum datum){
		this.datum = datum;
	}
	
	/**
	 * 上传资料页面跳转
	 */
	@Override
	public String execute(){
		return SUCCESS;
	}
	
	public String save(){
		JSONObject root = new JSONObject();
		HttpServletRequest servletRequest = ServletActionContext.getRequest(); 
		try {
			String title = request.getParameter("datum.title");
			String brief = request.getParameter("datum.brief");
			String keywords = request.getParameter("datum.keywords");
			datum.setBrief(java.net.URLDecoder.decode(brief , "UTF-8"));
		    datum.setKeywords(java.net.URLDecoder.decode(keywords , "UTF-8"));
		    datum.setTitle(java.net.URLDecoder.decode(title , "UTF-8"));
		    datum.setManager(getManager());
		    datum.setDatetime(System.sysClock());
		    
			String filePath = UploadFile.upload(servletRequest, ServletActionContext.getResponse());
			datum.setUrl(filePath);
			
			if(filePath.isEmpty()){
				root.put("code", "400");
				root.put("msg", "上传失败！");
				this.setResult(root.toString());
				return SUCCESS;
			}
			
			DatumDAO datumDao = new DatumDAO();
			Transaction tx = datumDao.getSession().getTransaction();
			tx.begin();
			datumDao.save(datum);
			tx.commit();
			datumDao.getSession().close();
			
			root.put("code", "200");
			root.put("msg", "上传成功！");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.setResult(root.toString());
		      
		return SUCCESS;
	}
	
	public String saveProgress(){
		JSONObject root = new JSONObject();
		// 新建当前上传文件的进度信息对象  
        FileUploadProgress progress = null;  
        Object attribute = ServletActionContext.getRequest().getSession().getAttribute("fileUploadProgress");
        
        if(null == attribute){  
        	progress = new FileUploadProgress();  
             // 缓存progress对象  
            ServletActionContext.getRequest().getSession().setAttribute("fileUploadProgress", progress);  
        }else{  
        	progress = (FileUploadProgress)attribute;  
        }  
        
        root.put("length", progress.getLength());
        root.put("current", progress.getCurrentLength());
        root.put("isComplete", progress.isComplete());
        
        uploadProgress = root.toString();
        
        ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");  
        ServletActionContext.getResponse().setHeader("pragma", "no-cache");  
        ServletActionContext.getResponse().setHeader("cache-control", "no-cache");  
        ServletActionContext.getResponse().setHeader("expires", "0");   
        
		return SUCCESS;
	}
	
	public String clearProgressSession(){
		JSONObject root = new JSONObject();
		ServletActionContext.getRequest().getSession().setAttribute("fileUploadProgress", null);
		root.put("msg", "session清除成功！");
		
		uploadProgress = root.toString();
		
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
	
	public String delete(){
		JSONObject root = new JSONObject();
		if(request.getParameter("datumid") == null
				||request.getParameter("datumid").equals("")){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
		}
		
		int datumid = Integer.parseInt(request.getParameter("datumid"));
		DatumDAO datumDao = new DatumDAO();
		Datum datum = datumDao.findById(datumid);
		
		if(datum == null){
			root.put("code", "400");
			root.put("msg", "不存在标识为" + datumid + "的记录！");
		}
		
		ServletContext sc = (ServletContext)ActionContext.getContext().get(ServletActionContext.SERVLET_CONTEXT);
		String rootPath = sc.getRealPath("/");
		String filePath = rootPath + datum.getUrl();
		
		File file = new File(filePath);
		//删除文件
		if(file.exists()){
			file.delete();
		}
		
		int index = filePath.lastIndexOf("/");
		filePath = filePath.substring(0, index);
		File dir = new File(filePath);
		if(dir.exists() && dir.listFiles().length == 0){
			dir.delete();
		}
		
		Transaction tx = datumDao.getSession().getTransaction();
		tx.begin();
		datumDao.delete(datum);
		tx.commit();
		datumDao.getSession().close();
		
		root.put("code", "200");
		root.put("msg", "操作成功！");
		
		this.setResult(root.toString());
		return SUCCESS;
	}
}
