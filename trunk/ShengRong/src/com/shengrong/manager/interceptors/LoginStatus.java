package com.shengrong.manager.interceptors;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shengrong.manager.actions.LoginAction;

public class LoginStatus extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Object action = invocation.getAction();
		
		if(action instanceof LoginAction){
			return invocation.invoke();
		}
		
		Map<String, Object> session = invocation.getInvocationContext().getSession();
		String login = (String)session.get("loginFlag");
		if(login != null && login.equals("login")){
			return invocation.invoke();
		}else{
			((ActionSupport)action).addActionMessage("来自拦截器的消息：您还没有登录，请先登录！");
			return "login";
		}
	}

}
