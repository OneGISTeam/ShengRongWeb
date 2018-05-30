package com.shengrong.portal.actions;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.shengrong.hibernate.Member;
import com.shengrong.hibernate.MemberDAO;


public class AboutMemberAction extends ActionSupport {
	
    private static final long serialVersionUID = 8516131113424460551L;
	
	
	
	private List<Member> memberList;
	
	public List<Member> getMemberList(){
		return this.memberList;
	}
	
	public void setMemberList(List<Member> memberList){
		this.memberList = memberList;
	}
	
	
	@Override
	public String execute(){
		MemberDAO memberDao = new MemberDAO();
		memberList = memberDao.findAll();
		return SUCCESS;
	}
}
