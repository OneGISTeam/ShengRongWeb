<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
   <title>河南晟荣建筑工业科技有限公司</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="河南晟荣,晟荣,建筑工业科技">
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司网站">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="<%=basePath%>Plugins/bootstrap/bootstrap1.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/assets/form-elements.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/assets/style.css" />
	
  </head>
  
<body >
	<div class="container" style="width:50%; margin:20% auto">
		<div class="form-box" style="width:100%;">
			<div class="form-bottom"  >
                <h2><i class="fa fa-times fa-2x"></i><strong>错误！</strong></h2>
                <h4>${message}</h4>
                <button style="" class="btn" onclick="window.location.href= '<%=basePath%>${href}'">点击继续</button>
            </div>
	    </div>
    </div>
    <script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>Plugins/jquery/jquery.backstretch.min.js"></script>
</body>
</html>