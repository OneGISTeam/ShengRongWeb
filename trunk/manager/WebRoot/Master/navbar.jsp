<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<nav class="navbar navbar-default top-navbar" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
             <span class="sr-only">Toggle navigation</span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="index.jsp">
         	<img style="height:40px" src="<%=basePath %>Images/shengrong-green-short.png" />
         </a>
         <div id="sideNav">
         	<i class="fa fa-caret-right"></i>
         </div>
	</div>
</nav>
<nav class="navbar-default navbar-side" role="navigation">
	<div>
		<img style="width:60px;height:60px" src="<%=basePath %>Images/potrait.png" />
	</div>
	<div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
            	<a href="<%=basePath %>masterPage.action"><i class="fa fa-dashboard"></i>管理员账号管理</a>
            </li>
        </ul>
    </div>
</nav>