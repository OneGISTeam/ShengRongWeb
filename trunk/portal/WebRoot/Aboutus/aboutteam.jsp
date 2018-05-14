<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<link href="<%=basePath %>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath %>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath %>Portal/aboutus.css" rel="stylesheet" type='text/css'/>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.baiduMap.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cbZBSnBB0OtXxG4Zh1LWGOFTXvqbXmdO"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
  
  <body>
    <!---header--->
	<div class="header-section">
		<div class="container">
			<div class="head-top">
				<div class="social-icon">
					<a href="#"><i class="icon"></i></a>
					<a href="#"><i class="icon1"></i></a>
					<a href="#"><i class="icon2"></i></a>
					<a href="#"><i class="icon3"></i></a>
					<a href="#"><i class="icon4"></i></a>
				</div>
				<div class="email">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email: <a href="mailto:info@example.com">info@example.com</a></li>
						<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
						<li><i class="glyphicon glyphicon-lock" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal1">Register</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>				  
					<div class="navbar-brand">
						<img style="height:50px" src="<%=basePath %>Images/shengrong-green.png">
					</div>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%=basePath %>homePage.jsp">公司首页 <span class="sr-only">(current)</span></a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">产品中心<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=basePath%>AboutusProducts/coffeeMachine.jsp" target="_blank">咖啡机</a></li>
										<li><a href="<%=basePath%>AboutusProducts/coffeeMachine.jsp">消防器材</a></li>
									</ul>
							</li>
							<li><a href="<%=basePath%>News/tradenews.jsp">新闻前线</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料共享 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="2columnsgallery.html">2 Columns Gallery</a></li>
										<li><a href="3columnsgallery.html">3 Columns Gallery</a></li>
										<li><a href="4columnsgallery.html">4 Columns Gallery</a></li>
									</ul>
							</li>
						<li class="active"><a href="<%=basePath%>Aboutus/aboutshengrong.jsp">关于我们</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</nav>
		</div>
	</div>
	<!-- /header -->
	<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>关于我们</h2>
		    </div>
		    
		    <div class="dynamic-news">
		         <a class="dynamic" href="<%=basePath%>Aboutus/aboutshengrong.jsp" >关于晟荣</a> 
		         <a class="dynamic active" href="<%=basePath%>Aboutus/aboutteam.jsp">关于团队</a>
		    </div>
		</div>
	<!---banner--->
	   <div class="content">
	       <ul class="team-ul">
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team1.png">
	       			<p>五险一金</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team2.png">
	       			<p>双休年假</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team3.png">
	       			<p>生日礼物</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team4.png">
	       			<p>健康体验</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team5.png">
	       			<p>零食饮料</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team6.png">
	       			<p>弹性工作</p>
	       		</li>
	       </ul>
	       <div class="border-top"></div>
	   	   <div class="tit-5">绿色<span> · </span>环保</div>
	   	   <div class="subtitle">因为刚好遇见你，留下梦想的期许</div>
	   	   
	   	   <div class="friend-agent">
				<div class="container">
					<div class="friend-grids">
					
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p.png">
							<h4>Runner</h4>
							<p>执总，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p1.png">
							<h4>Agents</h4>
							<p>项目经理，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p2.png">
							<h4>Rent</h4>
							<p>工程师，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p3.png">
							<h4>Rent</h4>
							<p>工程师，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p4.png">
							<h4>Rent</h4>
							<p>工程师，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p5.png">
							<h4>Rent</h4>
							<p>工程师，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						
						<div class="col-md-4 friend-grid">
							<img src="<%=basePath %>Images/p5.png">
							<h4>Rent</h4>
							<p>工程师，Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
						
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	       
	  </div>
	
	 <jsp:include page="../footer.jsp" flush="true" />
  </body>
	          
</html>

