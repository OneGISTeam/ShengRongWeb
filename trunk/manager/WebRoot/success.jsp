<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	
	<link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
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
						<h1><i class="fa fa-check fa-2x"></i><strong>成功！</strong></h1>
						<h4>
							${message}
						</h4>
						<button type="button" class="btn" onclick="window.location.href= '<%=basePath%>${href}'">点击继续</button>
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