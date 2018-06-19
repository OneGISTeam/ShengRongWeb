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
			<h2>加入我们</h2>
		</div>
	</div>
	<!---banner--->
	<div class="content">
			<div class="contact-section">
				<div class="container">
					<div class="contact-grids">
						<div class="col-md-8 contact-grid">
							<h5>Fill out the form and we will get back to you within 24 hours</h5>
							<p></p>
							<form>
								<input type="text" value="姓名 " onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '姓名';}" required="">
								<input type="email" value="邮箱" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '邮箱';}" required="">
								<input type="text" value="电话" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '电话';}" required="">
								<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '您的需求和评论...';}" required="">您的需求和评论</textarea>
								<input type="submit" value="提交" >
							</form>
						</div>
						<div class="col-md-4 contact-grid1">
							<h4>Listing Agent</h4>
							<div class="contact-top">
								<div class="agent-img">
									<img src="<%=basePath%>Images/p3.png" class="img-responsive" alt="">
								</div>
								<div class="agent-info">
									<h5>John son</h5>
									<h6>Real Space Group</h6>
								</div>
								<div class="clearfix"></div>
							</div>
							<ul>
									<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i> Office : 0041-456-3692</li>
									<li><i class="glyphicon glyphicon-phone" aria-hidden="true"></i> Mobile : 0200-123-4567</li>
									<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i> <a href="#"><a href="mailto:info@example.com">info@example.com</a></a></li>
									<li><i class="glyphicon glyphicon-print" aria-hidden="true"></i> Fax : 0091-789-456100</li>
								</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp" flush="true"/>
	

</body>
</html>
