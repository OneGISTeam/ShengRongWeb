package com.shengrong.manager.file;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.struts2.dispatcher.multipart.JakartaMultiPartRequest;

public class MyJakartaMultiPartRequest extends JakartaMultiPartRequest {

	@Override
	public void parse(HttpServletRequest servletRequest, String saveDir) throws IOException{
		//do noting
	}
}
