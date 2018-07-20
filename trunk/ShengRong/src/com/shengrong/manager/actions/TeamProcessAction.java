package com.shengrong.manager.actions;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Transaction;

import com.shengrong.hibernate.Teamprocess;
import com.shengrong.hibernate.TeamprocessDAO;
import com.shengrong.hibernate.customization.TeamprocessEncapsulator;


public class TeamProcessAction extends ActionBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9148358833995208205L;
	
	TeamprocessEncapsulator encpTeamProcess;
	
	Map<Integer, List<Teamprocess>> catalogTeamprocesses = new TreeMap<Integer, List<Teamprocess>>();
	
	private String catalogJSON;
	
	public String getCatalogJSON(){
		return this.catalogJSON;
	}
	
	public void setCatalogJSON(String catalogJSON){
		this.catalogJSON = catalogJSON;
	}
	
	public Map<Integer, List<Teamprocess>> getCatalogTeamprocesses(){
		return this.catalogTeamprocesses;
	}
	
	public void setCatalogTeamprocesses(Map<Integer, List<Teamprocess>> catalogTeamprocesses){
		this.catalogTeamprocesses = catalogTeamprocesses;
	}
	
	public TeamprocessEncapsulator getEncpTeamProcess(){
		return this.encpTeamProcess;
	}
	
	public void setEncpTeamProcess(TeamprocessEncapsulator encpTeamProcess){
		this.encpTeamProcess = encpTeamProcess;
	}
	
	/**
	 * 执行页面跳转，获取团队足迹列表
	 * @return 
	 */
	@Override
	public String execute(){
		TeamprocessDAO teamprocessDao = new TeamprocessDAO();
		
		@SuppressWarnings("unchecked")
		List<Teamprocess> processes = teamprocessDao.findAll();
		
		//将团队进程按年份进行分组
		for(int i=0; i<processes.size(); i++){
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(processes.get(i).getDate());
			int year = calendar.get(Calendar.YEAR);
			List<Teamprocess> tps = null;
			
			if(!catalogTeamprocesses.containsKey(year)){
				tps = new ArrayList<Teamprocess>();
				tps.add(processes.get(i));
				catalogTeamprocesses.put(year, tps);
			}else{
				tps = catalogTeamprocesses.get(year);
				tps.add(processes.get(i));
			}
		}
		
		/*//升序排序  
		List<Map.Entry<Integer, List<Teamprocess>>> list = 
				new ArrayList<Map.Entry<Integer, List<Teamprocess>>>(catalogTeamprocesses.entrySet());
		Collections.sort(list,new Comparator<Map.Entry<Integer, List<Teamprocess>>>() {    
            public int compare(Map.Entry<Integer, List<Teamprocess>> o1,  
            		Map.Entry<Integer, List<Teamprocess>> o2) {
                return o1.getKey().compareTo(o2.getKey());  
            }  
        }); */
		
		JSONArray array = new JSONArray();
		//将catalogTeamprocesses转化为JSON字符串
		for(int key:catalogTeamprocesses.keySet()){
			JSONObject item = new JSONObject();
			item.put("year", key);
			
			JSONArray element = new JSONArray();
			for(int i=0; i<catalogTeamprocesses.get(key).size(); i++){
				Teamprocess tps = catalogTeamprocesses.get(key).get(i);
				JSONObject tpsObj = new JSONObject();
				tpsObj.put("id", tps.getProcessid());
				tpsObj.put("location", tps.getLocation());
				tpsObj.put("brief", tps.getBrief());
				tpsObj.put("date", tps.getDate().toString());
				try{
					String pos = new String(tps.getPos().getBytes((long)1, (int)tps.getPos().length())); 
					tpsObj.put("pos", pos);
					String image = new String(tps.getImage().getBytes((long)1, (int)tps.getImage().length()));
					tpsObj.put("image", image);
				}catch(SQLException e){
					e.printStackTrace();
				}
				element.add(tpsObj);
			}
			item.put("teamprocess", element);
			array.add(item);
        }
		
		this.catalogJSON = array.toString();
		
		return SUCCESS;
	}
	
	/**
	 * 对团队足迹进行存储
	 * @return
	 */
	public String save(){
		if(encpTeamProcess.getEncpImage() == null || encpTeamProcess.getEncpPos() == null ||
				encpTeamProcess.getLocation() == null || encpTeamProcess.getBrief() == null){
			this.setMessage("信息填写不完整！");
			this.setHref("homepage/teamprocesses.action");
			return ERROR;
		}
		
		Teamprocess teamprocess = encpTeamProcess.dataDecapsulate();
		teamprocess.setManager(this.getManager());
		
		TeamprocessDAO teamprocessDao = new TeamprocessDAO();
		Transaction tx = teamprocessDao.getSession().getTransaction();
		tx.begin();
		teamprocessDao.save(teamprocess);
		tx.commit();
		teamprocessDao.getSession().close();
		
		return SUCCESS;
	}
	
	public String delete(){
		JSONObject root = new JSONObject();
		String strID = request.getParameter("id");
		if(strID == null || strID.isEmpty()){
			root.put("code", "400");
			root.put("msg", "参数标识id为空！");
		}
		
		int id = Integer.parseInt(strID);
		TeamprocessDAO teamprocessDao = new TeamprocessDAO();
		Teamprocess tp = teamprocessDao.findById(id);	
		if(tp == null){
			root.put("code", "500");
			root.put("msg", "没有参数为" + id + "的记录!");
		}else{
			Transaction tx = teamprocessDao.getSession().getTransaction();
			tx.begin();
			teamprocessDao.delete(tp);
			tx.commit();
			teamprocessDao.getSession().close();
			root.put("code", "200");
			root.put("msg", "删除成功！");
		}	
		this.setResult(root.toString());
		return SUCCESS;
	}

}
