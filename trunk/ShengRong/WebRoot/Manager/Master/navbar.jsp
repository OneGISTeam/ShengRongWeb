<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
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
         <div id="nav_top_header" class="nav navbar-top-links navbar-left" style="padding-left:30px">
         	<h4 class="nav-top-title" style="color:#F09B22">河南晟荣建筑科技有限公司-超级管理员系统</h4>
         </div>
	</div>
	<ul class="nav navbar-top-links navbar-right">
     	<li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                 <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
             </a>
             <ul class="dropdown-menu dropdown-user">
                 <li><a href="<%=basePath %>masterlogout.action"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                 </li>
             </ul>
             <!-- /.dropdown-user -->
     	</li>
     </ul>
</nav>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="nav-side-portrait" style="text-align:center">
		<h5 style="color:#F09B22">欢迎，超级管理员：</h5>
		<h5 style="color:#F09B22">
			<%=session.getAttribute("loginName") %>
		</h5>
	</div>
	<div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
            	<a href="<%=basePath %>masterPage.action"><i class="fa fa-users"></i>管理员账号管理</a>
            </li>
        </ul>
    </div>
</nav>