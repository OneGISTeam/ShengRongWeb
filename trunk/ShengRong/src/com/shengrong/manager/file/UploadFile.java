package com.shengrong.manager.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;

import com.shengrong.system.System;

public class UploadFile {
	
	@SuppressWarnings("unchecked")  
	public static String upload(HttpServletRequest request, HttpServletResponse response) throws IOException {  
		//String contenttype = request.getContentType();
		if (request.getContentType() == null) {  
			throw new IOException(  
                "The request doesn't contain a multipart/form-data stream");  
		}  
		// 上传文件的保存位置在“/Manager/Datum/temp”,该位置在tomcat服务器的“webapps”之中
        String path= ServletActionContext.getServletContext().getRealPath("/Manager/Datum/temp");
        String relativePath = "/Manager/Datum/temp";
        
        // 设置上传工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(path));
        // 阀值,超过这个值才会写到临时目录  
        factory.setSizeThreshold(1024 * 1024 * 10); 
        
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //设置上传大小最大为1G
        upload.setSizeMax(1024 * 1024 * 1024);
        // 设置监听器监听上传进度  
        upload.setProgressListener(new FileUploadListener(request));   
        try {    
            List<FileItem> items = upload.parseRequest(request);
             
            for (FileItem item : items) { 
            	// 非表单域 
            	if (!item.isFormField()) {
            		String dateFile = new SimpleDateFormat("yyyy-MM-dd").format(System.sysClock());
            		String strDir = path + "/" +  dateFile;
            		File fileDir = new File(strDir);
            		if(!fileDir.exists()){
            			fileDir.mkdir();
            		}
            		String uuid = UUID.randomUUID().toString();
            		
            		String suffix = item.getName().substring(item.getName().lastIndexOf(".") + 1);
            		relativePath += "/" + dateFile + "/" + uuid + "." + suffix;
            		
            		FileOutputStream foStream = new FileOutputStream(strDir + "/" + uuid + "." + suffix);
            		
            		// 文件全在内存中  
                    if (item.isInMemory()) {  
                    	foStream.write(item.get());  
                    } else {  
                    	InputStream is = item.getInputStream();  
                        byte[] buffer = new byte[1024];  
                        int len;  
                        while ((len = is.read(buffer)) > 0) {  
                        	foStream.write(buffer, 0, len);  
                        }  
                        is.close();  
                    }
                    
                    foStream.close();
                    //删除临时文件
                    item.delete(); 
            	}
            }
        }catch (Exception e) {
        	e.printStackTrace();
        	request.getSession().removeAttribute("percent"); 
        }
        
        return relativePath;
	}
}
