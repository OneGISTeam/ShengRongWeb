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
	<div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
        	<li>
                <a href="index.html"><i class="fa fa-dashboard"></i>网站统计工具</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-sitemap"></i>公司首页管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                    	<!-- class="activate-menu" -->
                        <a href="<%=basePath %>homepage/carousels.action">轮播消息</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>homepage/introductions.action">公司简介</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>homepage/businesses.action">业务范围</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>homepage/teamprocesses.action">团队足迹</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>