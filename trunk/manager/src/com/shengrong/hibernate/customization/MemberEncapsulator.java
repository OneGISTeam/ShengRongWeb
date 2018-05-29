package com.shengrong.hibernate.customization;

import java.sql.Blob;

import com.shengrong.hibernate.Member;
import com.shengrong.hibernate.MemberDAO;

public class MemberEncapsulator extends Member implements Encapsulator<Member>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1976539899391836157L;
	
	private String encpImage;
	
	public String getEncpImage(){
		return this.encpImage;
	}
	
	public void setEncpImage(String encpImage){
		this.encpImage = encpImage;
	}

	@Override
	public Member dataDecapsulate() {
		// TODO Auto-generated method stub
		Member member = new Member();
		member.setImage(convertToBlob(this.encpImage));
		member.setMembername(this.getMembername());
		member.setPost(this.getPost());
		
		return member;
	}

	private Blob convertToBlob(String base64){
		MemberDAO memberDao = new MemberDAO();
		Blob blob = memberDao.getSession().getLobHelper().createBlob(base64.getBytes());
		return blob;
	}
}
