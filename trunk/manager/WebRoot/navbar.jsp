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
                <a href="#"><i class="fa fa-home"></i>晟荣首页管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
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
            <li>
            	<a href="#"><i class="fa fa-globe"></i>晟荣新闻管理<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                        <a href="<%=basePath %>news/newstypes.action">新闻类型</a>
                    </li>
            		<li>
                        <a href="<%=basePath %>news/newses.action">发布新闻</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>news/queryNewses.action">新闻列表</a>
                    </li>
            	</ul>
            </li>
            <li>
            	<a href="#"><i class="fa fa-cloud"></i>晟荣产品管理<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                        <a href="#">发布产品</a>
                    </li>
                    <li>
                        <a href="#">产品列表</a>
                    </li>
            	</ul>
            </li>
            <li>
            	<a href="#"><i class="fa fa-file-text-o"></i>晟荣资料管理<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                        <a href="<%=basePath %>datum/datum.action">资料上传</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>datum/queryDatums.action">资料列表</a>
                    </li>
            	</ul>
            </li>
            <li>
            	<a href="#"><i class="fa fa-users"></i>关于我们<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                        <a href="<%=basePath %>aboutus/aboutcompany.action">关于晟荣</a>
                    </li>
                    <li>
                        <a href="<%=basePath %>aboutus/aboutmember.action">关于团队</a>
                    </li>
            	</ul>
            </li>
        </ul>
    </div>
</nav>