package actions;

import java.util.List;

import com.shengrong.hibernate.MemberDAO;
import com.shengrong.hibernate.Member;

public class HomePage {
	
	public String execute() {
		MemberDAO memberDao = new MemberDAO();
		List<Member> members = memberDao.findAll();
		return "homePage";
	}

}
