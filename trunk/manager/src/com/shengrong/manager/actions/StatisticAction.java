package com.shengrong.manager.actions;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.lang.management.ManagementFactory;

import net.sf.json.JSONObject;

import com.shengrong.hibernate.DatumDAO;
import com.shengrong.hibernate.ManagerDAO;
import com.shengrong.hibernate.MemberDAO;
import com.shengrong.hibernate.NewsDAO;
import com.shengrong.manager.model.AmountInfo;
import com.shengrong.manager.model.Bytes;
import com.sun.management.OperatingSystemMXBean;

public class StatisticAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 497563937624360827L;
	
	//可以设置长些，防止读到运行此次系统检查时的cpu占用率，就不准了  
    private static final int CPUTIME = 5000;  
  
    private static final int PERCENT = 100;  
  
    private static final int FAULTLENGTH = 10;  

	private AmountInfo amountInfo = new AmountInfo();
	
	public AmountInfo getAmountInfo(){
		return this.amountInfo;
	}
	
	public void setAmountInfo(AmountInfo amountInfo){
		this.amountInfo = amountInfo;
	}
	
	public String execute(){
		NewsDAO newsDao = new NewsDAO();
		Long newsCount = (Long)newsDao.getSession().createQuery("select count(*) from " + "News").uniqueResult();
		this.amountInfo.setNewsCount(newsCount);
		/**
		ProductDAO productDao = new ProductDAO();**/
		
		DatumDAO datumDao = new DatumDAO();
		Long datumCount = (Long)datumDao.getSession().createQuery("select count(*) from " + "Datum").uniqueResult();
		this.amountInfo.setDatumCount(datumCount);
		
		MemberDAO memberDao = new MemberDAO();
		Long memberCount = (Long)memberDao.getSession().createQuery("select count(*) from " + "Member").uniqueResult();
		this.amountInfo.setMemberCount(memberCount);
		
		return SUCCESS;
	}
	
	public String systemPerformance(){
		 int kb = 1024;
		 
		 OperatingSystemMXBean osmxb = (OperatingSystemMXBean) ManagementFactory
                 .getOperatingSystemMXBean();
		 
		 // 操作系统
         String osName = System.getProperty("os.name");
         
		 long totalMemorySize = osmxb.getTotalPhysicalMemorySize() / kb;
		 // 已使用的物理内存
         long usedMemory = (osmxb.getTotalPhysicalMemorySize() - osmxb
                 .getFreePhysicalMemorySize())
                 / kb;
		
		JSONObject root = new JSONObject();
		root.put("memoryRatio", usedMemory*1.0/totalMemorySize*100);
		root.put("osName", osName);
		
		this.setResult(root.toString());
		return SUCCESS;
	}
	
	 /*****  
     * 读取CPU信息.  
     * @param proc  
     * @return  
     */  
    private long[] readCpu(final Process proc) {   
        long[] retn = new long[2];   
        try {   
            proc.getOutputStream().close();   
            InputStreamReader ir = new InputStreamReader(proc.getInputStream());   
            LineNumberReader input = new LineNumberReader(ir);   
            String line = input.readLine();   
            if (line == null || line.length() < FAULTLENGTH) {   
                return null;   
            }   
            int capidx = line.indexOf("Caption");   
            int cmdidx = line.indexOf("CommandLine");   
            int rocidx = line.indexOf("ReadOperationCount");   
            int umtidx = line.indexOf("UserModeTime");   
            int kmtidx = line.indexOf("KernelModeTime");   
            int wocidx = line.indexOf("WriteOperationCount");   
            long idletime = 0;   
            long kneltime = 0;   
            long usertime = 0;   
            while ((line = input.readLine()) != null) {   
                if (line.length() < wocidx) {   
                    continue;   
                }   
                // 字段出现顺序：Caption,CommandLine,KernelModeTime,ReadOperationCount,   
                // ThreadCount,UserModeTime,WriteOperation   
                String caption = Bytes.substring(line, capidx, cmdidx - 1)   
                        .trim();   
                String cmd = Bytes.substring(line, cmdidx, kmtidx - 1).trim();   
                if (cmd.indexOf("wmic.exe") >= 0) {   
                    continue;   
                }   
                // log.info("line="+line);   
                if (caption.equals("System Idle Process")   
                        || caption.equals("System")) {   
                    idletime += Long.valueOf(   
                            Bytes.substring(line, kmtidx, rocidx - 1).trim())   
                            .longValue();   
                    idletime += Long.valueOf(   
                            Bytes.substring(line, umtidx, wocidx - 1).trim())   
                            .longValue();   
                    continue;   
                }   
  
                kneltime += Long.valueOf(   
                        Bytes.substring(line, kmtidx, rocidx - 1).trim())   
                        .longValue();   
                usertime += Long.valueOf(   
                        Bytes.substring(line, umtidx, wocidx - 1).trim())   
                        .longValue();   
            }   
            retn[0] = idletime;   
            retn[1] = kneltime + usertime;   
            return retn;   
        } catch (Exception ex) {   
            ex.printStackTrace();   
        } finally {   
            try {   
                proc.getInputStream().close();   
            } catch (Exception e) {   
                e.printStackTrace();   
            }   
        }   
        return null;   
    }   
}
