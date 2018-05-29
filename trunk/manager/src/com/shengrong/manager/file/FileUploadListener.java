package com.shengrong.manager.file;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

/**
 * 文件上传进度消息
 * @author zhangzheng
 *
 */
public class FileUploadListener implements ProgressListener {

	private HttpSession session;  
	  
    public FileUploadListener(HttpServletRequest request) {  
        session = request.getSession();  
        FileUploadProgress fileUploadProgress = new FileUploadProgress();  
        fileUploadProgress.setComplete(false);   
        session.setAttribute("fileUploadProgress", fileUploadProgress);  
    }  
  
      
    //更新进度情况  
    @Override  
    public void update(long readedBytes, long totalBytes, int currentItem) {   
        //实现文件上传的核心方法  
        Object attribute = session.getAttribute("fileUploadProgress");  
        FileUploadProgress fileUploadProgress  = null;  
        if(null == attribute){   
            fileUploadProgress = new FileUploadProgress();  
            fileUploadProgress.setComplete(false);   
            session.setAttribute("fileUploadProgress", fileUploadProgress);  
        }else{  
             fileUploadProgress = (FileUploadProgress)attribute;  
        }  
  
        fileUploadProgress.setCurrentLength(readedBytes);  
        fileUploadProgress.setLength(totalBytes);   
        if(readedBytes==totalBytes){  
            fileUploadProgress.setComplete(true);  
        }else{   
            fileUploadProgress.setComplete(false);  
        }  
           
        session.setAttribute("progress", fileUploadProgress);  
    }  

}
