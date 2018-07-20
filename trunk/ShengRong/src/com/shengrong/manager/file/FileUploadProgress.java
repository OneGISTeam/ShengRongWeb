package com.shengrong.manager.file;

/** 
 * 上传文件进度信息 
 *  
 * @author zhangzheng 
 * @version 0.1 
 */  
public class FileUploadProgress {
	
	// 文件总长度(设置至少为1字节防止前台出现/0的情况)  
    private long length = 1;  
    
    // 已上传的文件长度  
    private long currentLength = 0;  
    
    // 上传是否完成  
    private boolean isComplete = false;  
    
    public long getLength() {  
        return length;  
    }  
    public void setLength(long length) {  
        this.length = length;  
    }  
    public long getCurrentLength() {  
        return currentLength;  
    }  
    public void setCurrentLength(long currentLength) {  
        this.currentLength = currentLength;  
    }  
    public boolean isComplete() {  
        return isComplete;  
    }  
    public void setComplete(boolean isComplete) {  
        this.isComplete = isComplete;  
    }  
      
    public FileUploadProgress() {  
        super();  
    }  
}
