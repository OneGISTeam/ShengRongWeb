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
         <div id="nav_top_header" class="nav navbar-top-links navbar-left" style="padding-left:30px">
         	<h4 class="nav-top-title" style="color:#F09B22">河南晟荣建筑科技有限公司-后台管理员系统</h4>
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
		<img style="width:60px;height:60px;border-radius:50%" src="<%=basePath %>Images/potrait.png" />
		<h5 style="color:white">
			<%
				String sex = (String)session.getAttribute("loginSex");
				if(sex.equals("true")){
				%>
				<span style="color:#AEEEEE" class="fa fa-male"></span>
				<%
				}else{
				%>
				<span style="color:#FFC1C1" class="fa fa-female"></span>
				<%
				}
			%>
			<%=session.getAttribute("loginName") %>
		</h5>
	</div>
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