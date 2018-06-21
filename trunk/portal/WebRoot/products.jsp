<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head lang="zh-CN">    
    <title>河南晟荣建筑工业科技有限公司</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="河南晟荣,晟荣,建筑工业科技">
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司网站">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/reset.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Portal/thems.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Portal/responsive.css">
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
		<div class="container">
			<h2>产品中心</h2>
		</div>
	</div>
	<!---banner--->
	
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
