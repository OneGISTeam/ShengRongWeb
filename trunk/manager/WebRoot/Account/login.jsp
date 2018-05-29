<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>河南晟荣建筑工业科技有限公司-超级管理员注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司-超级管理员注册页面">
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/bootstrap/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath%>Account/form-elements.css" />
	<link rel="stylesheet" href="<%=basePath%>Account/style.css" />
	
  </head>
  
<body>
	<!-- Top content -->
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
    			<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1><strong>系统登录</strong></h1>
						<h4>
							河南晟荣建筑工业科技有限公司
						</h4>
						<div class="description">
							<p>
	                          	即将登录河南晟荣建筑工业科技有限公司后台管理员系统，系统提供对公司网站内容的动态编辑与管理。
							</p>
						</div>
                     </div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
	                  	<div class="form-top">
	                  		<div class="form-top-left">
	                  			<h3>系统登录</h3>
	                      		<p>请输入账号和密码:</p>
	                  		</div>
	                  		<div class="form-top-right">
	                  			<i class="fa fa-key"></i>
	                  		</div>
	                    </div>
	                 	<div class="form-bottom">
							<form role="form" action="masterlogin.action" method="post" class="login-form">
			                 	<div class="form-group">
			                 		<label class="sr-only" for="mastername">账号</label>
			                     	<input type="text" name="mastername" placeholder="账号..." class="form-username form-control" id="form-username">
			                     </div>
			                     <div class="form-group">
			                     	<label class="sr-only" for="password">密码</label>
			                     	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                     </div>
			                     <label for="roleid">登录身份</label>
			                     <select name="roleid" class="form-control">
			                     	<option value="admin">普通管理员</option>
			                     	<option value="master">超级管理员</option>
			                     </select>
			                     <button type="submit" class="btn">进入系统</button>
							</form>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>
    <script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>Plugins/jquery/jquery.backstretch.min.js"></script>
    <script src="<%=basePath%>Account/scripts.js"></script>
</body>
</html>
