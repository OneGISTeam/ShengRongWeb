<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!---header--->
	<div class="header-section">
		<div class="container">
			
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<%-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button> --%>				  
					<div class="navbar-brand">
						<img style="height:50px" src="<%=basePath%>Images/shengrong-green.png">
					</div>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%=basePath%>homepage.action">公司首页 <span class="sr-only">(current)</span></a></li>
						<li><a href="<%=basePath%>products.action">产品中心</a></li>
						<li><a href="<%=basePath%>queryNewses.action">新闻前线</a></li>
						<li><a href="<%=basePath%>datumsharing.action">资料共享</a></li>
						<li><a href="<%=basePath%>aboutshengrong.action">关于我们</a></li>
						<li><a href="<%=basePath%>employment.action">招聘信息</a></li>
						<li><a href="<%=basePath%>cooperation.action">加盟我们</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</nav>
		</div>
	</div>
	<!-- /header -->