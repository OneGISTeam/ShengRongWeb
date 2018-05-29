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
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	
  </head>
  
<body>
	<!-- Top content -->
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
    			<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1><strong>超级管理员注册</strong></h1>
						<h4>
							河南晟荣建筑工业科技有限公司
						</h4>
						<div class="description">
							<p>
	                          	您的系统还没有超级管理员用户，请注册一个超级管理员用户，并牢记用户名和密码。
	                          	超级管理员是全系统中唯一的，主要用于创建多个普通管理员。
							</p>
						</div>
                     </div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
	                  	<div class="form-top">
	                  		<div class="form-top-left">
	                  			<h3>超级管理员注册</h3>
	                      		<p>请输入超级管理员的账号和密码:</p>
	                  		</div>
	                  		<div class="form-top-right">
	                  			<i class="fa fa-key"></i>
	                  		</div>
	                    </div>
	                 	<div class="form-bottom">
							<form role="form" action="masterregister.action" method="post" class="login-form">
			                 	<div class="form-group">
			                 		<label class="sr-only" for="mastername">账号</label>
			                     	<input type="text" datatype="s5-16" errormsg="昵称至少5个字符,最多16个字符！" name="mastername" placeholder="账号..." class="form-username form-control" id="form-username">
			                     </div>
			                     <div class="form-group">
			                     	<label class="sr-only" for="password">密码</label>
			                     	<input type="password" datatype="*6-15" errormsg="密码范围在6~15位之间,不能使用空格！" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                     </div>
			                     <div class="form-group">
			                     	<label class="sr-only" for="repassword">确认密码</label>
			                     	<input type="password" datatype="*" recheck="password" errormsg="您两次输入的账号密码不一致！" name="repassword" placeholder="重新输入密码..." class="form-password form-control" id="form-repassword">
			                     </div>
			                     <button type="submit" class="btn">注册</button>
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
    <script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		//初始化表单验证信息
			var form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
    	});
    </script>
</body>
</html>
