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
	
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/news.css" rel="stylesheet" type='text/css'/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<!-- //FlexSlider-->
	<link rel="stylesheet" href="Plugins/jquery/flexslider.css" type="text/css" media="screen" />
	<script src="<%=basePath %>Plugins/jquery/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
				$(window).load(function() {
				$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
				});
				});
	</script>
	<!-- //FlexSlider-->
	<style>
	.pagination{
	display:table;
	margin:40px auto;
	}
	  
	</style>
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
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email: <a href="mailto:info@example.com">info@example.com</a> </li>
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
						<li><a href="<%=basePath%>homePage.jsp">公司首页 <span class="sr-only">(current)</span></a></li>
						<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">产品中心<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=basePath%>Products/coffeeMachine.jsp" target="_blank">咖啡机</a></li>
										<li><a href="<%=basePath%>Products/coffeeMachine.jsp">消防器材</a></li>
									</ul>
							</li>
							<li class="active"><a href="<%=basePath%>News/tradenews.jsp" >新闻前线</a></li>
						<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料共享 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="2columnsgallery.html">2 Columns Gallery</a></li>
										<li><a href="3columnsgallery.html">3 Columns Gallery</a></li>
										<li><a href="4columnsgallery.html">4 Columns Gallery</a></li>
									</ul>
						</li>
						<li><a href="<%=basePath%>Aboutus/aboutshengrong.jsp">关于我们</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</nav>
		</div>
	</div>
	<!-- /heander -->
	<!---banner--->
	<div class="banner-section">
			<div class="container">
				<h2>行业新闻</h2>
			</div>
	</div>
	<!---banner--->
	<!---banner--->
	<div class="content">
		<div class="properties-section">
			<div class="container">
				<div class="properties-grids">
					<!-- <div class="col-md-9 forsales-left"> -->
					<!-- <div class="forsale"> -->
				  <!-- <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">  -->
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#industry" id="industry-tab" role="tab" data-toggle="tab">行业</a></li>
						<li ><a href="#company" role="tab" id="company-tab" data-toggle="tab">公司</a></li>
					</ul>
					
				      <div id="myTabContent" class="tab-content">
					   <div role="tabpanel" class="tab-pane fade in active" id="industry">
						<div class="forsale-grids">
							<div class="forsale1"> 
								<div class="forsale-left">
									<a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="forsale-right">
								    <h5><a href="tradesingle.jsp" >无人驾驶技术应用到共享汽车</a></h5>
								    <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                    </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                                 </div>
								 <div class="clearfix"></div>
								 <ul>
								 	<li>2017-11-15</li>
									<li><a href="#">John Doe</a></li>
									<li><a href="#">0 评论</a></li>
									<li><a href="tradesingle.jsp">详情信息</a></li>				
								 </ul>    
							</div> 
					   </div>
					    <div class="forsale-grids">
					       <div class="forsale1">
							   <div class="forsale-left">
							   	   <a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
							   </div>
							   <div class="forsale-right">
								   <h5><a href="tradesingle.jsp" >无人驾驶技术应用到共享汽车</a></h5>
								   <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                   </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                               </div>
							   <div class="clearfix"></div>
							   <ul>
									<li>2017-11-15</li>
									<li><a href="#">John Doe</a></li>
									<li><a href="#">0 评论</a></li>
									<li><a href="tradesingle.jsp">详情信息</a></li>			
							   </ul>    
							</div>
						</div>
                        <div class="forsale-grids">
							<div class="forsale1">
								<div class="forsale-left">
									<a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="forsale-right">
								    <h5><a href="tradesingle.jsp">无人驾驶技术应用到共享汽车</a></h5>
								    <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                    </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                                 </div>
								 <div class="clearfix"></div>
								 <ul>
								     <li>2017-11-15</li>
									 <li><a href="#">John Doe</a></li>
									 <li><a href="#">0 评论</a></li>
									 <li><a href="tradesingle.jsp">详情信息</a></li>
								 </ul>    
							</div>
						</div>	
					   </div>
					 
					  <div role="tabpanel" class="tab-pane fade" id="company">
						<div class="forsale-grids">
							<div class="forsale1"> 
								<div class="forsale-left">
									<a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="forsale-right">
								    <h5><a href="tradesingle.jsp" >无人驾驶技术应用到共享汽车</a></h5>
								    <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                    </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                                 </div>
								 <div class="clearfix"></div>
								 <ul>
								 	<li>2017-11-15</li>
									<li><a href="#">John Doe</a></li>
									<li><a href="#">0 评论</a></li>
									<li><a href="tradesingle.jsp">详情信息</a></li>				
								 </ul>    
							</div> 
					   </div>
					    <div class="forsale-grids">
					       <div class="forsale1">
							   <div class="forsale-left">
							   	   <a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
							   </div>
							   <div class="forsale-right">
								   <h5><a href="tradesingle.jsp" >无人驾驶技术应用到共享汽车</a></h5>
								   <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                   </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                               </div>
							   <div class="clearfix"></div>
							   <ul>
									<li>2017-11-15</li>
									<li><a href="#">John Doe</a></li>
									<li><a href="#">0 评论</a></li>
									<li><a href="tradesingle.jsp">详情信息</a></li>			
							   </ul>    
							</div>
						</div>
                        <div class="forsale-grids">
							<div class="forsale1">
								<div class="forsale-left">
									<a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/s.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="forsale-right">
								    <h5><a href="tradesingle.jsp">无人驾驶技术应用到共享汽车</a></h5>
								    <p>
								                     今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。
                                                                                                             无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图...
                                    </p>
                                   <!--  <a href="tradesingle.jsp" class="button4">详情信息</a> -->
                                 </div>
								 <div class="clearfix"></div>
								 <ul>
								     <li>2017-11-15</li>
									 <li><a href="#">John Doe</a></li>
									 <li><a href="#">0 评论</a></li>
									 <li><a href="tradesingle.jsp">详情信息</a></li>
								 </ul>    
							</div>
						</div>	
					   </div>
					   
					   <ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
					  </ul>
				
					</div>	
				<!-- </div> -->	

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>	
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	<jsp:include page="../footer.jsp" flush="true" />
</body>
</html>

